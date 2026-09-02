Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FE8C624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699F810F20F;
	Wed,  2 Sep 2026 14:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWN/plWz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7B110F20F
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 14:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788358975; x=1819894975;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=av1DBL/H81b5RvAPWQyaTCAqWXg8fHest107/2Ctn+c=;
 b=EWN/plWz38ljg7+3jeiAtxZ44afLGkPEvJaVB5Fi9tzmwh5cYUGLYk+l
 38Q5QmM8RGX5/9HV4js0Ieugpk1qsc/a3X25FUCKhv2/weceroU7o6z6n
 QgNXrrGEj5vq6dkvuAWtjc8/DtWtlYxxwkmMmHd14xyGlPjtRc1Jtpgp2
 qDozqTjveuH4CnnmZxM2yvMQNaY2Y1z1/DqsdCOYj7c3i7Vn3qxMh2K9B
 QxZqTQJX8LsQgvBe67pv281mO6i65TrCHSecZIgiZzO0fZ5lOlBhbMg08
 9As1e0JCcwh3wkTeTvhPNsI3skr6HvsSrS1zGKkLfC1phFDUYIS5rDi0b w==;
X-CSE-ConnectionGUID: 8MYX0Z4MROW6onprHWTCrA==
X-CSE-MsgGUID: bbaGH7fdRDa92IXX3hpRBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88695883"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88695883"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:22:48 -0700
X-CSE-ConnectionGUID: fi9ugpN3TleQd5bVEQ17mA==
X-CSE-MsgGUID: ucwieZIJTRSqMRmmm8b9fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="273595523"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:22:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 07:22:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 07:22:47 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 07:22:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdCwGh6tx6VhJoNJf+kQFqqM0XHAx8fLVE6YZpCPcoLkDCxSpjEiH4bN+TGZr+KhbV/CFrxE0K+CoEK31jyTNQgBo082u75IqCraymk4P+xvyZnldx0tHLevzP4ENAgdStuLStzbbByvawC6ZeDO1V9bgfDCsSEXJp3jEbViYE0ot2w+3SFXp0/1/X2Np+cJGfUAZi0O7AFVM+qHS/cQ8SK/ejUOoZpHBeixhhki3GmT9954zVuefB7rLUBLd34BI2Ta3UASYGJaFPBC+A2g5pzg7jUNRmVfADiZ5GRG6dyXZmi5Ct6h0LxhiP+rHCmqoqACbAV/5N/aeFH26qNBFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sJbgwFsl4VrxHTqMjXikglfgAbbBsyKO9quf7OLwJU=;
 b=QqR6pnkqh1hPeTcnKlB5m0AgErj/uo7WxbeEVrtp2iHjKi3xDOnnc1qcotG241pb7+67oeVZmi8uS2nPLpqpk2PWADkpfgm0rJ3450/x0cqRFK+9Ln2i9O4H29oq+vBFRIzDcKTc/kR254qINUtSbiharqC1HZn6w8MF9lnUW8aGYbDCZlLc4k0MxsJRemc2+IR+Xay+iQv8YQ0lQVJ5eqH/CsnsnzeWhh9SUS8JyEh9EnanWPgvQg5L3i0+YxVsrkVlJDcGQbNHW2G6dJG61JqS/B3CHZMDLeS9FMf1lx/CeDNxaPUJHeCQQPT6Z9MYeLQ04VUxtLOHVOSjLz4Log==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by PH8PR11MB6660.namprd11.prod.outlook.com (2603:10b6:510:1c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Wed, 2 Sep
 2026 14:22:44 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 14:22:44 +0000
Message-ID: <bf230932-338a-4d83-9606-f4250d06c2a4@intel.com>
Date: Wed, 2 Sep 2026 16:22:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/xe/guc: Use different error codes for CT errors
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
CC: <daniele.ceraolospurio@intel.com>, <aravind.iddamsetty@intel.com>,
 <mallesh.koujalagi@intel.com>, <alan.previn.teres.alexis@intel.com>,
 <julia.filipchuk@intel.com>
References: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
 <20260901211204.131972-9-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260901211204.131972-9-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0250.eurprd05.prod.outlook.com
 (2603:10a6:20b:493::28) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|PH8PR11MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e2c136-d08a-4313-78a3-08df08fda7b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|6133799003|3023799007|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: ejoZeh5EqZnRrMGQIO1MFzkUSDMgQKqiTl5YlBCw7SNQFn+eqRcgXvaAnODPYDA2rZeS+rxF2homAV45woruCU1lm06JSItzc9RNX/KG78uz0YiORXxdKFnBagemfPq1O7imMeuX5YAKI3SRHOs2JxKeJlfPkv5VG3SFDmZHAjIULt+B5qdZhZRzUuO+Kv8WJAGsrz4R0cROTc4zylxBW5MaXEJq7phsgqT59/JO9eQs50/+568FDjCFds5p2JksJciKMrxSGDj0NNBYK89MEQ/KnqBaDarG9ofAuUy/jQ0KUrcmj2f/1/ktcusb9WFZ8W+W+M13pL+/YOnTCs8/NS0YjgxnS2PiFlOjZz1ZWXTOc6oLsPQ4t3YoHU4jUzmePAjU3Gq9BZwS9fOhXRlFYZFW+hvOfxkcDKJPCjHwdGtOK3eEBf3WA8AHshi093wlPorOY91HPH1tdT+BvV2cU7dTYL3QtPQMU4zkvUam8pF/PMXpZvJgSlEGijrmGXfPbSzcZauaFtsFr133JCEtX1/lNTbNZz1szXuRPZFXbw2A9DGj5Q6Zhm6fzp52w9FXnTArhcavZFXkBxcC7mO0goeb7j3pHYOdlCCduL+j7XIn0NskclnyMKifH6FkhKBAejdftaEoDqvVIaQRAp/CvH20EumeAAtu6LnkT4Ok6BI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(6133799003)(3023799007)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3U5ZWsxSE01WVl3UHFmL1hDUlNlQmZvS0poQ3RWZCtXMVZ2TVlNT0EwT0d5?=
 =?utf-8?B?QmhGcUdITllnNVYxSXBSaSt4RUl2ejUwNDdLZjl5WnRsdVB2Wmd6c1YxTFRu?=
 =?utf-8?B?WHhnM1dOMzc1d3JDSzU0NXZ3WlpOR2E4VVZTR1NZOVhSUWFmTWdOcmsvZEIw?=
 =?utf-8?B?QStTdG4rTGp3dUJaK0JaZjBBTk9QVUswcDRBSUVwQlRpQTc3V04vK1I3OFU4?=
 =?utf-8?B?MVg3UWdJSHQvc1Nod21UVFlhMjdSWW9aTWMvZHVNVFA0ZU5RZ0thZHlneXJT?=
 =?utf-8?B?V2xSbGpmSnFqTnVIVGFnTGhYWUlVSjBRL0o2a1RQczcxWVFEdUpjd1Z0UHUy?=
 =?utf-8?B?b2E3RU04RWx3djFSaEkwL3FnWUY0MVBQWGRNWWRMYTQrQ1pybXJidFIydjgy?=
 =?utf-8?B?emp0QzJFcXhZaFY5R3pUQWVKd3lIRm5PbmJTbWRCck8xZlJpT2NaaXBGTFJE?=
 =?utf-8?B?VmhzSDdPalJ0SExuWEJzaDlvbFBFbE1tNWFlR2FUcDFUVVpzUnErTS92YVVQ?=
 =?utf-8?B?dVo5Z0ZaMDdlWjhjZFZZU2JoRmJ4Yi9HMlo0MjlxTFZ6K0NMMENnNVgzbnFL?=
 =?utf-8?B?SG9Id3J3V1pYckZPeG8vTmlNc1JkOUxLQ0hNM2Z3cjhjaVFWY1l6UDdQdGJr?=
 =?utf-8?B?dktFZjErUGtwUTN0enhYNGcvalRQTWM3RksxbWV1ZHRnS3J6OGRmdHB2a2pF?=
 =?utf-8?B?d0V0dTNwdEhaQ0JoTGFtekN4TEkxZTFhVDBQdWl3algxK1FFR0VsMzgzcEo1?=
 =?utf-8?B?cjkzNWV3UkJxcUFzTTJPU0p5ZmNYdlRJdW4vUVp6UEM4aXNsUDF1QmRoS0tk?=
 =?utf-8?B?bFp0RjQvY0EwREcyRFVtMzVlN0NEaUl0ZTlSKzBWaFhoUFFNekZtSHVUSzhl?=
 =?utf-8?B?Nzl0ZjQ0ZmRNRGFRSDlHNGJSdmo3U2hRaWRqQmZ5eVo0bEtlaE8zQlBYdWk2?=
 =?utf-8?B?OFdmaWkyempSTW1Hcm96RnU4K2RrZjBZTzVscFI4WFNsa1FsK3ErMjBOb0NO?=
 =?utf-8?B?TTI4TmhkMGZOQWt0aVU1S3RZZlA1NzAvc1I5dVpKc0c5U3JiZEdxdkp2WWtZ?=
 =?utf-8?B?NitVUnA3dkJKNitaTlBEaVpxUHpyZVc5Nmgwd282R0FzaU5QYWtUWG5XcC9h?=
 =?utf-8?B?Ni9VTUZ4SlNmb1MxcStrdUJrMTJMRHRqekcvTzg5dzhMeEdnNzBLK2VQUlly?=
 =?utf-8?B?bVRvOFpJNW5MM21YNjlCaHcrVmxiSHllblk0ekdjcHpaZDNiQ0lVTzRPdW55?=
 =?utf-8?B?WHZKWlY4ZU4zVTZ3QUdCMmVYaHBzVDhSUmx1MTZZQitWT3RvNVREcjJSL05Z?=
 =?utf-8?B?TllONjVVWDdnaWZxMnZ6Q0hrRy8vME1YYjZaNFd0aXpIZDBCZjRnVE9jSE9E?=
 =?utf-8?B?WWtxdnJXRjA4US9Bd3ZHMERtUDMxT1BlY2lyNXdTenA4b1p1VytZZUZKSjhZ?=
 =?utf-8?B?WUlCNkZrb2ZtWXVrNWtlbm1Nby9qRXZnMS9seGtaM0JYenk3TUtnZExIYWZB?=
 =?utf-8?B?TjZlNXVqbWRrNklvbTNqdzQzMVVST05qODF0bXBrR0JTaHhDVWpucEQ2QVAy?=
 =?utf-8?B?THVEYStWaWdXUkdaek0rSlp3STFVNk50bFJBQ2tncUtSQlk2MVhiOHRUOENI?=
 =?utf-8?B?aWVCSW8vbUZ0QlUxUWFGVDAvVUZnUC9PaEhRd0pCMWYwTTBBQW1QOGxldXo0?=
 =?utf-8?B?YW9OK3VZdzRyaU5kcVE5V3ZJRGdoMnMzdkMrV3FVc0duSURXRU4wTERuekNS?=
 =?utf-8?B?MElzaHZGZWlyejNGc0RrNWc3UWZwOFFjald6YlJ2N1k3S291UFo3WWo5UkVs?=
 =?utf-8?B?eHo2RU5Nc0IyZlFYWUwwK0VHUUE0OFVrQ1FjSGJDL1BqMXUzQVBUSHZnbXVx?=
 =?utf-8?B?Vzg5OVgwOFlCaFZTWEFLc2Iyc1Y1TDhJYlJxSE1Lb0I1Qm0xcGk3YVpicmZC?=
 =?utf-8?B?eFhIQ1FvSWJ3NWhUUnYrNWJIdk5QZms5WFdpMWFwV3JoRVhna0dsUEljZVFj?=
 =?utf-8?B?ZXdEYTE1eHBTNVNybHlDNzI3Vmltb042QUxFdlltcXFJTGUzT3h3QjRWTjFD?=
 =?utf-8?B?THlNMkUwT1FHOEFDckpzVEcxcnNoSFg1YlBPeXd6WVpDc3RXbkw4RXBTRm51?=
 =?utf-8?B?S1lkdmtKajBreERjUHp1RFZjSGRHb0VrbjM4Y3hrblVmWHZpa3NJSWZRc3Bi?=
 =?utf-8?B?MXRmekVUREd1dUdpS1VUVlhoZ3RNRDdqdmgxcWl6VG5ZK214WXN3dVM0MVk1?=
 =?utf-8?B?eDZTbndKb25hb1g5dzlFbFBJYmoyM282MVlmNUU2K3p5c1dNcDVoK2pMcDF6?=
 =?utf-8?B?aTk2bWFQZHF3SFR4REl6eUlib2xKVmZsVHYwQVpMa0hrRElrREhOR0tvMjVw?=
 =?utf-8?Q?AMT4HwQ7eyZXtWgk=3D?=
X-Exchange-RoutingPolicyChecked: 2PdNH5GA8SROWLCI+t/UG1U4pPWxA5msUK5EdDTrlGtG9i83jf94uvZFSHsyegeWJIzUn5FxqUaCD9L9U19n0UaqHJQlpArkkYZEiClu7yK5T7u7fyXx2Pm3gmsTr3U+deNhC2CVqGZZ5enSivILQiLiKUmMmUpD4ZXnmj5UpF9eseC+AYCrweLpwe/ignB1H9LCrJQgVooL76NPYuEUwIj0EB1t5Ic3d35MKSMmdZDzgeqt9objt94pCJhxyRBfei368+8vBSN8TbYACHPa3Nxt5j77g2XgZpImGoRCW+BWt647PTouw3b9cY2j7hwbhSkGXcJBGDauGoT7OmK7Rg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e2c136-d08a-4313-78a3-08df08fda7b9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:22:44.4714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Z6nybtZ9WoEt/N9b8YreLtvgYirRCu9HePyHgjro7hTmethQSIsRCq9+CcUPBOjOeXCZT/yzjbt82FBtpbPsaMuRbv91Ts94VfR6a4XetE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6660
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 9/1/2026 11:12 PM, Umesh Nerlige Ramappa wrote:
> Instead of always returning -EPROTO for most errors, use different error
> codes based on the error type. -EPROTO is retained for the cases that
> are genuine protocol violations by the GuC.  The remaining cases now
> report what actually went wrong.
> 
> receive_g2h() used to escalate to CT_DEAD + kick_reset() by matching the
> two error codes that dequeue_one_g2h() could return on a fatal error.
> Invert the check to simplify reset handling.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Assisted-by: Claude:claude-opus-5
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 48 +++++++++++++++++++++++++++++-----
>  1 file changed, 42 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 5c4733da385c..dcd457f38b89 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -947,6 +947,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	u32 cmd[H2G_CT_HEADERS];
>  	u32 tail = h2g->info.tail;
>  	u32 full_len;
> +	int err;
>  	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
>  							 tail * sizeof(u32));
>  
> @@ -961,12 +962,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  		desc_status = desc_read(xe, h2g, status);
>  		if (desc_status) {
> +			err = -EPROTO;

didn't we agree to use -EPIPE for a bad CT descriptor status?

>  			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
>  			goto corrupted;
>  		}
>  
>  		if (tail > h2g->info.size) {
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> +			err = -EPROTO;

hmm, IMO it would be better to use -EPROTO only for the errors related
to the actual HXG messages, and for raw CT transport failures use -EPIPE

unless we want to use -EPIPE only for existing problems in descriptor
and for new error conditions use something else, like -ENFILE?
but maybe that's overkill as it is fatal anyway, and the message already
says what went wrong

>  			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
>  				  tail, h2g->info.size);
>  			goto corrupted;
> @@ -974,6 +977,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  		if (desc_head >= h2g->info.size) {
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> +			err = -EPIPE;

we should be consistent 

	-EPIPE = CT already broken
vs
	-EPIPE = all CT channel errors


>  			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
>  				  desc_head, h2g->info.size);
>  			goto corrupted;
> @@ -1591,14 +1595,19 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	 * failure to trigger a reset.
>  	 */
>  	if (fence & CT_SEQNO_UNTRACKED) {
> -		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
> +		int err;
> +
> +		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
> +			err = -EBADE;

I'm little concerned that there was no other proposal here ;)

>  			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
>  				  fence,
>  				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
>  				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
> -		else
> +		} else {
> +			err = -EPROTO;
>  			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
>  				  type, fence);
> +		}
>  
>  		fast_req_report(ct, fence);
>  
> @@ -1608,7 +1617,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
>  
> -		return -EPROTO;
> +		return err;
>  	}
>  
>  	/* don't erase as we still expect a final response with the same fence */
> @@ -1809,10 +1818,12 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  	s32 avail;
>  	u32 action;
>  	u32 *hxg;
> +	int err;
>  
>  	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>  	lockdep_assert_held(&ct->fast_lock);
>  
> +	/* Keep in sync with g2h_err_is_fatal() */
>  	if (xe_device_wedged(xe))
>  		return -ENOTRECOVERABLE;
>  
> @@ -1840,6 +1851,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  		}
>  
>  		if (desc_status) {
> +			err = -EIO;

earlier in this patch in h2g_write you used -EPROTO for the similar issue
but I would go with -EPIPE here
>  			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
>  			goto corrupted;
>  		}
> @@ -1871,6 +1883,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  
>  		if (g2h->info.head > g2h->info.size) {
>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> +			err = -ERANGE;

-EPIPE if we want to treat all CT descriptor problems in the same way

>  			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
>  				  g2h->info.head, g2h->info.size);
>  			goto corrupted;
> @@ -1878,6 +1891,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  
>  		if (desc_tail >= g2h->info.size) {
>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> +			err = -ERANGE;

ditto

>  			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
>  				  desc_tail, g2h->info.size);
>  			goto corrupted;
> @@ -1898,6 +1912,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  			   sizeof(u32));
>  	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>  	if (len > avail) {
> +		err = -EBADMSG;
>  		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>  			  avail, len);
>  		goto corrupted;
> @@ -1950,7 +1965,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  
>  corrupted:
>  	CT_DEAD(ct, &ct->ctbs.g2h, G2H_READ);
> -	return -EPROTO;
> +	return err;
>  }
>  
>  static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
> @@ -2042,6 +2057,27 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>  	return 1;
>  }
>  
> +/*
> + * Errors reported by dequeue_one_g2h() come in two flavours: either the channel
> + * is simply not available right now, which is expected and handled gracefully,
> + * or the channel state or the message itself is inconsistent, in which case the
> + * only way forward is to declare the CT dead and reset the GuC. Since the
> + * former is a short and well known list, check against that and treat anything
> + * else as fatal, so that new error codes don't silently escape the escalation.
> + */
> +static bool g2h_err_is_fatal(int err)
> +{
> +	switch (err) {
> +	case -ENOTRECOVERABLE:	/* device wedged */
> +	case -ENODEV:		/* CT disabled */
> +	case -ECANCELED:	/* CT stopped */
> +	case -EPIPE:		/* CT already declared broken */

btw, there is a different order of checks in

	__guc_ct_send_locked()
		if (xe_device_wedged(ct_to_xe(ct))) {
		if (unlikely(ct->ctbs.h2g.info.broken)) {
		if (ct->state == XE_GUC_CT_STATE_DISABLED) {
		if (ct->state == XE_GUC_CT_STATE_STOPPED || xe_gt_recovery_pending(gt)) {

vs

	g2h_read
		if (xe_device_wedged(xe))
		if (ct->state == XE_GUC_CT_STATE_DISABLED)
		if (ct->state == XE_GUC_CT_STATE_STOPPED)
		if (g2h->info.broken)
	
and IMO we should revisit usage of -ECANCELED as it should be used only
for already sent H2G which wait for G2H but were cancelled due to a reset

if someone is still trying to send H2G when CT is already stopped/
then we should use different code, maybe -EPERM ?

-ENOTRECOVERABLE	/* device already wedged */
-ENODEV			/* CT disabled */
-EPERM			/* CT already stopped */
-EPROTO			/* CT message broken */    => reset => stop/start => enabled|wedged
-EPIPE			/* CT channel broken */	   => reset => stop/start => enabled|wedged
-EDEADLK		/* CT deadlock detected */ => reset => stop/start => enabled|wedged
-ECANCELED		/* CT stopped/GT reset */



> +		return false;
> +	default:
> +		return true;

are we sure only all other errors need to be recovered immediately by
the full GT reset? not the other way around?

we should kick reset on the first report of -EPROTO/-EPIPE (when we detect broken
HXG message or CTB descriptor), subsequent calls to send() shall return new
either new errors, like -EPERM, as CTB should be already STOPPED, or -EPIPE
as we might still wait for the reset flow, but CTB is already marked BROKEN.

and I'm not sure that reset would help for -EOPNOTSUPP, as it is unlikely
that driver will suddenly start supporting some new messages ...

> +	}
> +}
> +
>  static void receive_g2h(struct xe_guc_ct *ct)
>  {
>  	bool ongoing;
> @@ -2079,8 +2115,8 @@ static void receive_g2h(struct xe_guc_ct *ct)
>  		ret = dequeue_one_g2h(ct);
>  		mutex_unlock(&ct->lock);
>  
> -		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
> -			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
> +		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
> +			xe_gt_err(ct_to_gt(ct), "CT dequeue failed (%pe)\n", ERR_PTR(ret));

btw, shouldn't we always report an error and just kick reset on fatal?
or maybe even move kick_reset() somewhere else we know it is something
new and fatal (like detected corrupted descriptor) ?

>  			CT_DEAD(ct, NULL, G2H_RECV);
>  			kick_reset(ct);
>  		}


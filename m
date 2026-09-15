Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50759C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 16:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E973E10E619;
	Tue, 15 Sep 2026 16:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6NTirDn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B4A10E605
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 16:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789490703; x=1821026703;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=JG3bQkJM1mQkdJsOn4fbLZLMzRARsng2LfEBozOPuc8=;
 b=Y6NTirDnkzlwhWlEwXsCWkWSKFgntR7W1k2v4UIv/yzVwK+DUcXfFD21
 vi5/RqpS+nkpSuVJiXQ4EpzK2xbRoIowd5n+v+5MJmQEEZ6L0o7m46QuL
 uXH7Lhrvlvi/h9LooRgNLHgeZ1tIWJXDOX79B0khizzNkvWalQKPQ33Ha
 9u1wA62pjAJxAtHpDun52y/Id5Qs2/psrmptxsj9LG4tfb9NGPXTq/1r9
 dAl7c34yn64kSPCXSbg0wB5GCxr2ojFHpw7g8RDhlKR0PCqsoaGjHmrTi
 pLeKVrIy+T+briZG76B2PO23t1PQyV+9/UEWwnPyIZ7eh7ctXtsgu8EV+ g==;
X-CSE-ConnectionGUID: Ewh8MxdUT9OHddLmK3H58Q==
X-CSE-MsgGUID: U6+RoXu+SF2LAV56fPcjmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89733326"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208,217";a="89733326"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 09:45:02 -0700
X-CSE-ConnectionGUID: K6vEiz4YShSajPpkglRIXQ==
X-CSE-MsgGUID: kc+ihMVnSeCwWSV/xEtC+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
 d="scan'208,217";a="276593614"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 09:45:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 09:45:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 09:45:01 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 09:44:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZInsoJ4G5RB8bq3DeYmQMmj7Tw9SdEcELpMOCKR+tP0vsycTCCtbiColXTGuOYsBXek9wgmMC7aZ2aCH2E8xJgFD7Ifde91Z+/XJMIRoFXUhOO6gLNTwhYmSj0eaFpKe+DyRNyx9zSYGNRgnwulubzCM4x7/wOLdEAeNefxeRuzTeWaccmPwEa9Bmmk82p8zT1DSHgszj7jCw6txxpriWZ8oTcHVuXEjKlr56UDsI7LFdeSr6q5rcqpvcDWl5okj3V+hvvWhIRWFPR3WpE/MsFQki+EI31w19QBRMlvNGJVgynv9x8de6W8N/vzanLY7wdS/+VIuLgJ4ymAmeTeMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3u9bXoua75U3ZDsMhSufCuNlsc2VBLnuR+kEyCMiEI=;
 b=N0LSB8HJHO9UvF/T8oJbjsSw6heWv5IcD7w6WmOlUqKEJR3CsOiXVO66lOgrE4tN6iD9TWFXfK1ne0hsIye68DrHnTmoSHwHFJGdwCaJuQTki+/Myz2FDe6xs+O2yN7+YCG78opQIGa5A0pjcfK7iOxGmmVHmJUXGthcU7CIx3UMdCheTemO7Q+JIOLnMHg+4Iyks9xL6IuK8BLxPdVuUjaHQ63WHFoeBUqi2XBlkCk7iwpXSxSOOYHtMvFAG+5ULdo7/+IcU4m7YKuzEgapNAiq3zMi/ts8MANVl5+geb/YY2cw2GN/w5z0qUQGpYDXx60XShhXWrpu7ZQXlO/1GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by CY8PR11MB7135.namprd11.prod.outlook.com (2603:10b6:930:61::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Tue, 15 Sep
 2026 16:44:57 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 16:44:57 +0000
Content-Type: multipart/alternative;
 boundary="------------2WgLBNVZifuZ2TDLgegbSsYB"
Message-ID: <ae265075-0481-4a9d-8d50-cb750bcd0374@intel.com>
Date: Tue, 15 Sep 2026 22:14:52 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/debu?=
 =?UTF-8?Q?gfs=3A_Expose_per-engine_idle_status_=28rev5=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260910165855.1124574-2-sk.anirban@intel.com>
 <178909114179.147924.17797398735215807849@61270ab9df2a>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <178909114179.147924.17797398735215807849@61270ab9df2a>
X-ClientProxiedBy: MA0PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::17) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|CY8PR11MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: ba740058-0bda-40e1-f8af-08df1348acbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|4143699003|6133799003|22082099003|18002099003|5023799004|56012099006|11063799006|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: vDPb7s3xCIA7Z47mZ5RszXG08YCbk/B3pel+B1w4En1CoJJU6xbYRKSNv4apaR3tP3S8snX6A4lM/DUVdEOVvJVJm3DkJsJcvsHx/SlkOB9tO1NWji2H2sK0qmKZvBihXu8SX1NKlzFiR6jNLoyxd3DDGrAMS7RLTXjc5naJAeY0RLV/Ec30SaAPgLRpo4iqE88y4EsbqXn+t3siQWNTvDMFm9TzahPlWiy9/tTSQHwJ2mTe+fjI12FmRDq1+GCbazeB28Mr3yKlpomKS0IqqYBR/iIHN7wcvtmnIYTjoz9FM5LW9CjQuvUPbrTRV/MCatC/SPF0hFrZSFycyoVBQxBp7dGHl9xcrOfEoT3gzBHmUgBzqWbL1FFr+pgR0F/uuT5iWhY4EdlNzpticwP/jDeseI8Ae1uW8eeklNC6f7fBcWs5E3aHOghEitbueblaGTBG3xPAQmzgSgYL3+c+Cmb+Vaz2FDiQzETrhgojMUoTWUq2cNmMbE/Z7o7qyS44JoC/es4N3o9ERsfY24tdKMO8ChkpPANwCNbSeBKjio/6+wR1L68X3BtRGVa5s7QzP1zUVdp3deF/Dy2wF2newXhLTMzmKSnKppmhpqzKoow=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(4143699003)(6133799003)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006)(8096899003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkhBYThWdEFBVVExZXpDdnVkbVlRcnR2ZDRVM011NHBDWXoxS202NEVWeU95?=
 =?utf-8?B?Q1JDS0tVOE1hV2NyOXVKYzc5NnZ2RkxWaXVHUmVOaGpuN2orY1R0WDB0OERK?=
 =?utf-8?B?WnI3TVJDcW1sU0lPYXNVVU5uOGlZZUl0QndLSWZLdlErTVdRUUtGWmlUOWJ5?=
 =?utf-8?B?dVpUUmNPWWl2aHp4WDZIeHMrZjJuVVVBcFdUdURGVTRKUmpLNC85OXcrZUhU?=
 =?utf-8?B?ck15aHZtWU9qZ2NKNXo5WTNUaVlzWnkweWhEaklBK2xLU0ExWG80V3FHMGxB?=
 =?utf-8?B?UEIxSTBVWmNZSEl1VHJyVGE4WDlvVkFZN2llbExyTGhYVDRtekprYlBLY2tz?=
 =?utf-8?B?ZXp2Ykd5Zk5tNkZUMkVKeEhIdkhLOWRWNTVqTkVaVXNDTTZUR1cyc2l5bC9a?=
 =?utf-8?B?RVFUdnhWOW9SZ2JEb0ttSE92RTFyN0YzSDFEaDVNUkR4RWwxMnNMN2I0ekEz?=
 =?utf-8?B?WjVCcFZxRmN6TjJBeVpRYkRVclZzSTlUakt6SU8wTi96U2F6OVJLOForajd2?=
 =?utf-8?B?TG92QlZCTjdYUXNXczczOFRtNmY5TGtFWTFoMnNmR3p0dy9CdFNTZkJkL2Zm?=
 =?utf-8?B?Y2EwYjc3NzZpNmZYancyUDBzY1lHRVhyUkViUFJrUUxJQ1dFUlQ4Y3NnK2xm?=
 =?utf-8?B?d3JCaUxRZTRQaE1EUDQ3NXF3RC9Reml2UHByUk53MnlIYXFDODViWVNXMnRz?=
 =?utf-8?B?SGVsWURiL0wwdUhCbFZCekVqbGZvK1hwTmdaVnRTd0N5NlNCa1VMQ2ZuZ09t?=
 =?utf-8?B?cmpsQXc1Q3J5dlpOZElLdlNQMUphV3hqamc2S1ZMaW5pYlVra0JzYVM3d1Vv?=
 =?utf-8?B?VFdSYjhWeTdiZlhQWC9LY1B4MFFYQUJ0d1lDMWZYc1RyRmtrRXJFNW1KM2Ni?=
 =?utf-8?B?MkhmcXlCTVFQeXk0VzNZV3MrbWJvdC80T1NWNlBmUWsvME51eW8yK3E3Ymsz?=
 =?utf-8?B?UXk1Qi9obEN2bFhCUmdSZDUweXdHM2xKRlhUS0d4dGxvRm96ajhwZWZDUm5O?=
 =?utf-8?B?K0ZwVTVnUGhEelpaNGRPbnRXOFRsZXVCMDFvZFhkLzV1b0phV2RXR3RBUkpU?=
 =?utf-8?B?Q3grYlIwQWYvY3VSeVF3dnJKdTJWZ3RFM244UVR6NTkvWFZBVUkzcFlVN2wx?=
 =?utf-8?B?SmFrWTVEQ0oxNmJMckgydUhqQ1BPNng4YktQMDBUYjdzTFlWYkYyL0lxZk1y?=
 =?utf-8?B?WlJRVDZveTJ5R053OWttUzNkTHpObXo4VWZ4cXJUMlIwTlVNK0ZvaDB1Nkw5?=
 =?utf-8?B?L003T2Z0QjVRQVgyekVTZ21zMk9XK01kOUlGbC9kcmxvM3NmeDBwaEhaRFVX?=
 =?utf-8?B?Q3JxbTFsZ1R2ekRvNSsxR2lFNXBJUXRKU091b05aNTZmWmpFVm9wZWNwYWhV?=
 =?utf-8?B?aFBNYld5cVU5RzdjYWNvTE9oQTljV3ZoMFNhRmlxUnFvN2NCc3MvRUptYkVU?=
 =?utf-8?B?andDeGE2UXV3WEd5RWRIaFZLekhMaGExTExUTGh6eEtsZHJURHRqb3Yrbmph?=
 =?utf-8?B?cE1MTVI5alo3VUZqWEhBK2p1aTJqZ3E0OGhDMVJLaUdtNUJsTHBCdXAyTWxE?=
 =?utf-8?B?WmRid0xoOS9zdU1VTy82ZmoxaThYdXBmeTlqZDI3ZE84anpxckZvbFZHd2lu?=
 =?utf-8?B?b0k1LzNla1VadjRrN3hEVmc2QTVicmU0UlR1MjRCUkF6V3JWM0NHQkV4UENF?=
 =?utf-8?B?TmVSQW9pcWk2Z3hBQkh3cXBLbWhjK3hGaFRCSm9qWlYwYmovamJ5YTAzQU5K?=
 =?utf-8?B?dmxmNzdnYVE3ZC9NU1VDZXdFcWs1QUpxd1NWdDltSzBMc1FsNWZPMTNwc0Ro?=
 =?utf-8?B?QnlZc1VRUlFCZVNBcWNLZUN1bUtNVTQrbGVUVmYzayt0WlhxK21SSnB1c29q?=
 =?utf-8?B?WHc2VmpDYVVkTEJIOG5EczIzTDVqa1U4TERlYVFzc1F3bGtLOWVBeDhIWXN5?=
 =?utf-8?B?UzBWcCt3d1JWdU96d213ZUFadTVpaWs0NUJwOENjR1VPUHVaTTV3cmlVbkZC?=
 =?utf-8?B?ZENmV2NUd1FHU3kzSTFzUy81S2F6am9VVmNkNDBxM1lkbFoxdmxRdnZpVGRn?=
 =?utf-8?B?RXZ0dWhkblcwdk41ZkZpUzNqQzRhNHBzS2NTSmlFYW9WNXlaQ0dXYUFpd3F1?=
 =?utf-8?B?MXRRUkY5NDF0YjMzbm5QOExLR0tGanA1TnpOaGFqbldxVXBpWHlWUnN4S2tz?=
 =?utf-8?B?QVJRQjRKS2JYZTZ4Zmtpb3puL1BEN1NiZ3ljQmhSaDdMdDFjUFRhNld2a3l2?=
 =?utf-8?B?M2FJTEYyTDh2S0tSTUlqWXlGbjlWbVF2VDcxaEFqSkRlNkFqelZJV1I2RE83?=
 =?utf-8?B?M2l4UlYzVjNUTk5NK2hXQmVRQnk0d0Q2NVo4R1ZzdkMwMnhTdTdoZz09?=
X-Exchange-RoutingPolicyChecked: l+1VbF5DYz+skvs0+49v1xNGSUjZLcsDs24ey663AOR7EMtjwHVWq3wARxnVWWizKYnuOCG3hpPDTc6gklKGp0/W6YeFaS0c6HSGHUnjI09f7W7173J6SQgWlVkmYY6FXR56j/PqjKBtCoTDyf07M6ppiyWVwtzvrOW1v+mpys5ZmDepElpCmfKYg6FfT9bUpgbQLunv2ZGVi6S3CgzGYA4P5SgiWYh6vZP6LZaU6JI1L0HR0c3VoFJV3p+hA/AHVHIlNSYyQTj33P1QSSDCQgkx7CjEz6IkjjCpIG8OkjkDXz0PPoVXyEb/kIfVIJ6QWMNRTDCeigzck2tARuvItw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ba740058-0bda-40e1-f8af-08df1348acbb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 16:44:57.0374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZr2Lh+PN0klNLdib80nNlINOQaAwAavXSXbIQyrlwxU7lRn6fiGpXFyfc2zgwnv26ukCYUmoSBejFIPBeY0zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7135
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

--------------2WgLBNVZifuZ2TDLgegbSsYB
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

These failures are not related to my changes. Could someone please 
re-report?

Thanks.
Anirban

On 11-09-2026 07:15 am, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/debugfs: Expose per-engine idle status (rev5)
> *URL:* 	https://patchwork.freedesktop.org/series/168204/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/index.html
>
>
>   CI Bug Log - changes from
>   xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6_FULL ->
>   xe-pw-168204v5_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-168204v5_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-168204v5_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-168204v5_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-10/igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-8/igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault.html>
>
>
>     Known issues
>
--------------2WgLBNVZifuZ2TDLgegbSsYB
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>These failures are not related to my changes. Could someone
      please re-report?</p>
    <p>Thanks.<br>
      Anirban</p>
    <div class="moz-cite-prefix">On 11-09-2026 07:15 am, Patchwork
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:178909114179.147924.17797398735215807849@61270ab9df2a">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">@scope { td { padding: 2pt; } }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/debugfs: Expose per-engine idle status (rev5)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/168204/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/168204/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6_FULL -&gt;
        xe-pw-168204v5_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-168204v5_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-168204v5_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-168204v5_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault:
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-10/igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-8/igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
    </blockquote>
  </body>
</html>

--------------2WgLBNVZifuZ2TDLgegbSsYB--

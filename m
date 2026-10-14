Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AF4CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 09:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40F810EA6C;
	Wed, 14 Oct 2026 09:16:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3488110EA6C
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 09:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791969357; x=1823505357;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BeZ5x+xDyFTziJaX5wDrOyLp2ONVb4C/lZONzpeb+Ks=;
 b=jII0+iH9SRV5Ftl8S1TKnMMMvgEc9F7F1PnwtxRbR7Ke7clPgqXJ9i+L
 vJycYjNPPPGWm2nmQi3ba/Db5wO+SmIG1+5fxms7c1NS4ODFrE6LwcAr2
 aLf2M61AbkFSLPZRKViKXdlC0TXEr7cx10PS79hYhtd/M7+03HslPA4BL
 wh+6DEm8vnM02MO2S2ZQlY/Rkxx2aZ7AFOvtfk7VRnm2kHkIbd1hsQVMk
 /rWse31B2SoMZEdJsAi8oYLSR1/1ETxyOPy5m952uZ7JuSzlWcRBXozKI
 Nf8dmq5vP2LCfQ/RdHWb2LEhGcsn9Wq0G35ZJtDMcXVTzUAVFTXs1ezJT A==;
X-CSE-ConnectionGUID: bRkYC0AnRXqqefcZzIfH8w==
X-CSE-MsgGUID: +LxTmecHTKOBkWSabnigyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="702096"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="702096"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 02:15:56 -0700
X-CSE-ConnectionGUID: z5bT7X1BS3OwqytWLN5PIw==
X-CSE-MsgGUID: XFaqf8AeQKio6u+eNlQ82A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="3137331"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 02:15:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 02:15:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 02:15:56 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 02:15:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rz3GwNDutApDZLUEeUNN3KSncDwRcWTyl1qNuBL4ic+PeRdRW92T9LSdbzVKBZqEtoex1nijbY9pWy15NFr0cKgrVGwYrZlvKi6qaKe7hRMWjh6dKh04ejS9kQpPnu2jcFDQUA4/CwXZ/PdcA12RFhYPsqNyC1VB158Qof7p8wI9KyZjPQftIu+9dJWdtI17PCXyOjPKw0Oy1eSMEB3z5DWi50P8fwx+znQXZKRsJZ3o8ddm/927iismWvYxjpYk2QIrY1l0oPcvZ5O/ni0kNmUiZGlGa80R9Qkoxtfr0gDUwkf50qsr43+0hPuGwrDadomIxeVbK9yarH8/u+bZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I71eqjkifOTysT+5Ms/1HH7nj48lu5I2iJSGVeBGF2s=;
 b=GoH5Sczk++PXBv9T74MUIMqjAtMUqvWDLwWfYCqw31RBMLU/3K6ZDqrLBEgpKFVVIxSv66u76Ral9uBKmT8XhtwZp+5SejF7MQg/KHnuM9axgraJ9L1rO0K4omnD6GqmKtk3oG+u8HgH7pP8k0j+WTJ4L7hKdndDjk9MM9OY5ddtG43g4WSYgjzRGfM8p3kLDrBoCDzwP1FfbZw1ZcH8XCmZxvSPHTl/tTBYb079FoDbmiNW0tPUMxy++o30MqILpzmw0lq4F7RInPkQm7zLvx8fCjpY/kYS74pTdQrIgJnJQ9Gf8HzWp8Rw2CyNfqL0pmjsAmjz0w25qpJN5ZHXhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CY8PR11MB7361.namprd11.prod.outlook.com (2603:10b6:930:84::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 14 Oct
 2026 09:15:45 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0496.015; Wed, 14 Oct 2026
 09:15:45 +0000
Date: Wed, 14 Oct 2026 11:15:41 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 2/4] drm/xe/kunit: Extend GuC ID manager split-pool
 coverage
Message-ID: <20261014091541.zp25ijy63txmhhrt@intel.com>
References: <20261012115143.4100364-1-piotr.piorkowski@intel.com>
 <20261012115143.4100364-3-piotr.piorkowski@intel.com>
 <31e312b2-58c4-4070-8740-91676073301d@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31e312b2-58c4-4070-8740-91676073301d@intel.com>
X-ClientProxiedBy: DUZPR01CA0201.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::12) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CY8PR11MB7361:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f18ed9-6c0a-45c8-c459-08df29d3ba1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info: Iu2mzEWj07nN1Ml1EQh+D6fjg7jUFncL8w3kiUgKVuy9F9DjIw2dMnQDwxGustvtC1KxdAHqhyqMwCNovdKZctN/c/wG3W7ITtUrElz3/3oyrEoLh/Qqx7NFCZ0EYfmuxf9aw1mud2kAs+rOS9k0IIY0x3tOiMuPlgi3Z5b7gNu9mUiloEoxveoiz56oUR2kG+oYlCpTLmOu5LS0qJv7gp8Kj2diecBGRj9i609yLVWV1flu7otbu7a3QsGlgCwRDqWOtWTpsR/yhnIU1zpWNmv6w1Y2iP/DMJqzGIVttPxZW69NzeBw4CFTHL3IOgVHWsl2cVe7+rIP/7cMej4Fs1L3ySdmIKw3ESs/9sQa9LzJfwagmHWlZgzRU2VBPhb4zE6SAD4o0p2WJe17zMYkrGevhsoFOrFdsYLKa01O4mlChriOnlixhmlUteoYna+XurONaL2nbwtx4zu9jMohHpeXXykoVsPY+eDX01XA3hP0mRj3vHotfvAlxogRbXDb0o0BvjUfpE/CHriTKGuHiXMlEtC+bbGxRAL1DYaRrRXsKpWK83gwWxWCjdLDFFLP+LmGwGxam3I9H1Wu8i5Pvvc8H/rwWbZ5Vc9w5Oh4BHUKEJzQDhHXx4akuk8gWOzbkX6yynkxx9ekk4eQQARzCTAPbPK9A6Ct6Mr3vtxQFtM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003)(261009223027099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmRQaTQrclVKVmZNY09SZ1BudnJIckJDbTNCdXVtUHp2Q1pTcE8wTUpiUW5a?=
 =?utf-8?B?bUdweGN6ZXFyN3FiVStFcmwwL0xESklNbTNHNlc0aGNJV2tWTVlwZ1JqcGJw?=
 =?utf-8?B?ckFqZ2prYjV5QXRHQ1FXd3pkYVdzZGNBM2RpM2E0dWp5V1M5dGpqWUkxc3hh?=
 =?utf-8?B?NkY5SXU2M0VnbmY1aXVUSGlEVjl3Vk0ySGc3N0plU1pSUU9ERmF6WGlEQUpq?=
 =?utf-8?B?dVBlSDBOYndRamJ3R2RlWXdQa3UvK0hNQ1g5N1hFOVlqdTl5UCtHOXJhM2sr?=
 =?utf-8?B?TjBLeG1UMmIzYWp3SnFFbzJQTHpoUS9NUURKOFVrZ3FBMFY4YW81MER2OXBL?=
 =?utf-8?B?c2VQM3prN3oveVRDNHlZNVN6UnBpRklvY3p5UEZ6cENMRlBvY0NSQmhsSHc5?=
 =?utf-8?B?akJQRkpmdUF5dmt4TTdobUJOS0Z0WFMxTmR1eU5WazJzeWdQQkw1N0l0cFZH?=
 =?utf-8?B?V0lqNmx2ditIT2FVVHhvNWU2eS9EZ0JJR0xBU0NLaW1ySGtsNXg2Q2hDVGg1?=
 =?utf-8?B?ZHpsdUc4ZlhyTDlUeStPdnlwdjVHVHBzeUhhL256SHdhdlZEdjZBaXNibitK?=
 =?utf-8?B?UjFQOXl5a1N3ZisrUWhVMmxQRU42N3FGSTRVa0NWdGhMT2s0MVN1UlhzdkhD?=
 =?utf-8?B?c3N1ZEVPR3ZqU1l3cDluaFhSM2xnU2FzSlBhRzMxVEREZXRhcFM1RVlwOGN3?=
 =?utf-8?B?cnJkMDc2YVZRTlNqSmg2UEwvWjFVRm1QeWYyV2hWL1JqOFlKZWpXMGZVK0xP?=
 =?utf-8?B?QWZUdFIycHp5TSt4VGUrNHZmSW5WM3hXYnBNamJVWGU5T1J4eXNOT051UUo2?=
 =?utf-8?B?ZnJTMDQwZmtuVDNuTXVDclZnKzBVSW1oWTVWSU9EWUo1aHFnN2gyV1VralZZ?=
 =?utf-8?B?clJwd3JweUpzS2c1WHkwNldpNGd1ZkJUbGJubFlUOUV2aFJBL3NGcHhKSmxv?=
 =?utf-8?B?NTU1bmc4Vms1MDJaSFNUS2czcFBrdlVzbVlpZXVRUHY4WjVrUWNmWnl0b0Fl?=
 =?utf-8?B?Z2dUN0dMb0FtbHFoVUUwSEY1Uy9CWGxXZU9VZnNVRUFUV0dsdEh2Zm5nNFg1?=
 =?utf-8?B?N1gvTTYyY3FrcTB3THJIaXcyQ1EvM0NoNW9lcm5OQ3VMVHdrWDExMHlCQmxl?=
 =?utf-8?B?RlNNcjVhOUliZlJ1QzcrUHJMbWdwZmFDbHNKZ2E0S2h6bmtOY2NpNWxPNUdr?=
 =?utf-8?B?OW1KbGhGWW5hYms5eWFleXEwUzkzcm8xWTBsYjhXRFlGNXd1RWp2VDNQZUN6?=
 =?utf-8?B?dWt2YS9tVkZqVS84a1pRekhWbDB0bnFOTDNBaVZraDZVVTR5R3VrMnBmVzBT?=
 =?utf-8?B?S3RoZ2wyb3NFZ1A3Q0RMR29MSnFoS2FScGhXcGVveGt0V0ZsTmxiM0U4UVpX?=
 =?utf-8?B?UlM5S0xYa2t0Q0hWRzJ0eXJIOE9MYXpWbEFkVWxPTWdMaDNQVjlzL2E1bk1k?=
 =?utf-8?B?QjN3bjRWWGhPTi9EV2YweGtid3dKU2d3dkVYdTMvQVNxTzlESUI5OEJFb2Rh?=
 =?utf-8?B?Y3QvQVdUV0EvNEltNXV5U3pIZEMyelhZUVRuU2h3OEhzaTh3bjh6MnVobkVx?=
 =?utf-8?B?cW9lN2sxUG55UUZtTVZvVmxDRWpsbEhLUjJVaVpMeHJ1d1hjT2xiZlJRNVRL?=
 =?utf-8?B?UnN6c3JST2ZqVjBlMlNCVmhINmpyZUVFYVkreVpVT3hKbW9VQ3ozaVc0Ykhm?=
 =?utf-8?B?cllCa1poQjV2T2t1Y1FOZWxrQXVrZFRlbHZkZE1TNnNXQjdzTmpOeUZKM0k3?=
 =?utf-8?B?dXNwYy9xb1ZqNjNtYjhINkdXejQvREtCSTdvRzVFTGxPblhZWUx6RE9WRVFn?=
 =?utf-8?B?QldCRFBHK1NlUm03TmRid21YUHBzMUE5K2lCZlRGZmo3Z2dwc2RXakV4Q1E5?=
 =?utf-8?B?NFllYWgyZWZ0L2F4YkhjZWYrazF4aFF1T3d4K1B2YXdWNmpVQWZKbVVMcnJa?=
 =?utf-8?B?R3dWNVRWaGlvcnNLeGkrNjJtcWpQSVJ1T2grUENYY3hxR3hoL1V3QVZHN3dK?=
 =?utf-8?B?ZFI2eCtwbTNMYnhLc3VubmlScno1MUJ3OTZmbDF5QTZWa0gxWFViVGxKTzFP?=
 =?utf-8?B?MDgwNHZBZ1hCQ2tja1F4ZFV3OU4rUTM2NmR6Rk5CTm95YUh2UXluRytZUXZp?=
 =?utf-8?B?bkRMY0V4cFAxa3Z2MVk0MXYxeGdBV0c1SUpDNmR3bjc1M05adTVTbzJaZnZY?=
 =?utf-8?B?VzM3WlJmWlRhMVU2VkFXZnNYWEFzTTVIbWZLdGk5WjJ6T2lGa1BuWWROMGRo?=
 =?utf-8?B?VHlobGhOUUVlQlhEc0todk5lYzVLeENPQVl5TjdDZG1RcTJIWE1RMG04T20w?=
 =?utf-8?B?TWNEcjlGdDBiS1J0MFVIQUt6bnNpRVIwVFI3L1kvWDZPbWNxMERJa3AvTUV3?=
 =?utf-8?Q?z2gOfgRisE0tHzrU=3D?=
X-Exchange-RoutingPolicyChecked: AP0mB3fRqCY4ObXbad7o76NtbjjlKJwGY6d0eTmCxQzXVCQtw0F4jgPITR9GGo/UASwzc1BgfjGMdQLlhfIsGn9G/3PJCNOwXKRpbMosfbg1CjSyaM7ZB8ycCFNNsR/qopFbueaANzhvvFjP7jq9AWrHXAS+eeVH2um2qmeYwPlD+EES9P+4578OHZfCioxy4eNsTj8pVsEQ8ERqK98h9ZxPbo/0Y4a3ssZU0AJPoanfkoYxsLhK3VrI66tq8sKi2PHEOsY2FYiCZt8Dwvp/yERRcRjHiBPUQCzV9KocxXuW2+fqWRHeAhuTIEyZeipl7ODJHZ6U22SYMotLI9PGpw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f18ed9-6c0a-45c8-c459-08df29d3ba1b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:15:45.0159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IfUCAb03Tq+Fwxx1NH2eWEaTMm7WmTHQdvPe31ogBjlHD9ocEDQ5E4evyrlTfVfdLErktefZf0cNrRf8NkDq7CIHvwJ/CtwYNAyTALZrCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7361
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

K V P, Satyanarayana <satyanarayana.k.v.p@intel.com> wrote on wto [2026-paź-13 15:48:36 +0530]:
> 
> On 12-Oct-26 5:21 PM, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > Expand the GuC ID manager KUnit coverage to exercise the new
> > usable/shareable pool model.
> > 
> > v2: Use KUNIT_EXPECT instead of KUNIT_ASSERT inside the locked section
> >      so the mutex is not leaked on failure (Sashiko).
> > v3: Guard failed ID reservations before releasing test allocations.
> > v4: Avoid releasing unreserved ID ranges after failed test reservations.
> > v5: Fix check_used() cleanup and add missing reservation guards (Sashiko).
> > 
> > Assisted-by: Claude:claude-5-sonnet
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > ---
> >   drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 670 +++++++++++++++++-
> >   1 file changed, 654 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> > index 78d3de46b7572..48a962de5abcb 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> > @@ -7,13 +7,27 @@
> >   #include "xe_device.h"
> >   #include "xe_kunit_helpers.h"
> > +#include "xe_pci_test.h"
> >   static int guc_id_mgr_test_init(struct kunit *test)
> >   {
> > +	struct xe_pci_fake_data *fake;
> >   	struct xe_guc_id_mgr *idm;
> > +	/* Keep one logical suite: use PF fixture when IOV is enabled. */
> > +	fake = kunit_kzalloc(test, sizeof(*fake), GFP_KERNEL);
> > +	if (!fake)
> > +		return -ENOMEM;
> > +
> > +	*fake = (struct xe_pci_fake_data) {
> > +		.sriov_mode = XE_SRIOV_MODE_PF,
> > +		.platform = XE_TIGERLAKE, /* some random platform */
> > +		.subplatform = XE_SUBPLATFORM_NONE,
> > +	};
> > +	test->priv = fake;
> > +
> >   	xe_kunit_helper_xe_device_test_init(test);
> > -	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
> > +	idm = &xe_root_mmio_gt(test->priv)->uc.guc.submission_state.idm;
> >   	mutex_init(idm_mutex(idm));
> >   	test->priv = idm;
> > @@ -33,10 +47,10 @@ static void no_init(struct kunit *test)
> >   	struct xe_guc_id_mgr *idm = test->priv;
> >   	mutex_lock(idm_mutex(idm));
> > -	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_locked(idm, 0));
> > +	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_usable_locked(idm, 0));
> >   	mutex_unlock(idm_mutex(idm));
> > -	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve(idm, 1, 1));
> > +	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_shareable(idm, 1, 1));
> >   }
> >   static void init_fini(struct kunit *test)
> > @@ -51,10 +65,28 @@ static void init_fini(struct kunit *test)
> >   	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
> >   }
> > +static bool require_iov_config_or_skip(struct kunit *test)
> > +{
> > +	if (!IS_ENABLED(CONFIG_PCI_IOV)) {
> > +		kunit_skip(test, "requires CONFIG_PCI_IOV");
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +static unsigned int test_idm_used_total(struct xe_guc_id_mgr *idm)
> > +{
> > +	lockdep_assert_held(idm_mutex(idm));
> > +
> > +	return bitmap_weight(idm->bitmap, idm_total(idm));
> > +}
> > +
> >   static void check_used(struct kunit *test)
> >   {
> >   	struct xe_guc_id_mgr *idm = test->priv;
> >   	unsigned int n;
> > +	int id;
> >   	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
> > @@ -62,13 +94,17 @@ static void check_used(struct kunit *test)
> >   	for (n = 0; n < idm_total(idm); n++) {
> >   		kunit_info(test, "n=%u", n);
> > -		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n);
> > -		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
> > -		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n + 1);
> > +		KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), n);
> > +		id = xe_guc_id_mgr_reserve_usable_locked(idm, 1);
> > +		KUNIT_EXPECT_GE(test, id, 0);
> > +		if (id < 0)
> > +			break;
> > +		KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), n + 1);
> >   	}
> > -	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
> > -	idm_release_chunk_locked(idm, 0, idm_total(idm));
> > -	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), 0);
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), idm_total(idm));
> > +	if (n)
> > +		idm_release_chunk_locked(idm, 0, n);
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> >   	mutex_unlock(idm_mutex(idm));
> >   }
> > @@ -76,32 +112,620 @@ static void check_used(struct kunit *test)
> >   static void check_quota(struct kunit *test)
> >   {
> >   	struct xe_guc_id_mgr *idm = test->priv;
> > +	unsigned int usable = GUC_ID_MAX - 10;
> > +	unsigned int shareable = 20;
> > +	unsigned int spare = 11;
> > +	unsigned int tail = 10;
> > +	int usable_id, tail_id;
> Can we define some meaningful macros instead magic numbers like this?

Partially agree. In check_quota() the values are already named locals,
but they are not tied to each other, so I will derive them from the
overlap and VF-exclusive tail sizes (usable = GUC_ID_MAX - tail,
shareable = overlap + tail, spare = overlap + 1), which makes it clear
why the last reservation must hit -EDQUOT.

Elsewhere I will add IDM_TEST_POOL_SIZE and IDM_TEST_PARTIAL_POOL_SIZE
for the pool sizes shared between tests, and named consts for chunk
sizes, with the expected values computed from them. I would keep
literals where the value itself is the test input and is used only once
(e.g. 0 count for -EINVAL), since a macro there would not add much.

> > -	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
> > +	if (!require_iov_config_or_skip(test))
> > +		return;
> Can we print a debug/info message which will be visible when the test is
> skipped?

kunit_skip() already records the reason as the status comment, so it is
reported in the KTAP output, e.g. with CONFIG_PCI_IOV=n:

    ok 5 check_quota # SKIP requires CONFIG_PCI_IOV

While checking this I noticed that kunit_skip() never returns (it
aborts the test case), so the "return false" and the "if (...) return;"
in the callers are dead code. I will make the helper return void in the
next revision.

> > -	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 2), 0);
> > -	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
> > -	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 2), 0);
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, usable, shareable));
> > +
> > +	mutex_lock(idm_mutex(idm));
> How about using guard() or scoped_guard() instead of mutex_lock()?

Good point, I will switch to guard() in the next revision - it also
removes all the unlock-and-return error paths.

One note: guard() does not make KUNIT_ASSERT safe inside the locked
section.

> > +
> > +	/* spare is larger than the overlap, but the PF-exclusive range is free. */
> > +	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, usable - spare);
> > +	KUNIT_EXPECT_GE(test, usable_id, 0);
> > +	if (usable_id < 0) {
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	tail_id = xe_guc_id_mgr_reserve_shareable_locked(idm, tail, spare);
> > +	KUNIT_EXPECT_EQ(test, tail_id, usable);
> > +	if (tail_id < 0) {
> > +		idm_release_chunk_locked(idm, usable_id, usable - spare);
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	KUNIT_EXPECT_EQ(test,
> > +			xe_guc_id_mgr_reserve_shareable_locked(idm, 1, spare), -EDQUOT);
> > +
> > +	idm_release_chunk_locked(idm, usable_id, usable - spare);
> > +	idm_release_chunk_locked(idm, tail_id, tail);
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> > +
> > +	mutex_unlock(idm_mutex(idm));
> >   }
> >   static void check_all(struct kunit *test)
> >   {
> >   	struct xe_guc_id_mgr *idm = test->priv;
> >   	unsigned int n;
> > +	int id;
> >   	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
> >   	mutex_lock(idm_mutex(idm));
> 
> Same comment for mutex here.

Ack, will do.

> 
> > -	for (n = 0; n < idm_total(idm); n++)
> > -		KUNIT_EXPECT_LE(test, 0, xe_guc_id_mgr_reserve_usable_locked(idm, 1));
> > -	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
> > +	for (n = 0; n < idm_total(idm); n++) {
> > +		id = xe_guc_id_mgr_reserve_usable_locked(idm, 1);
> > +		KUNIT_EXPECT_GE(test, id, 0);
> > +		if (id < 0)
> > +			break;
> > +	}
> > +	if (n < idm_total(idm)) {
> > +		if (n)
> > +			idm_release_chunk_locked(idm, 0, n);
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), idm_total(idm));
> >   	for (n = 0; n < idm_total(idm); n++)
> >   		idm_release_chunk_locked(idm, n, 1);
> >   	mutex_unlock(idm_mutex(idm));
> >   }
> > +static void check_limits(struct kunit *test)
> > +{
> > +	struct xe_guc_id_mgr *idm = test->priv;
> > +
> > +	if (!require_iov_config_or_skip(test))
> > +		return;
> > +
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 10, 20));
> > +
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), 10);
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), 20);
> > +	KUNIT_EXPECT_EQ(test, idm_total(idm), 30);
> > +}
> 
> Use some macros instead of magic numbers. Same comment at other places in
> the file.
> 

Ack, will be addressed across the file, see my reply to the
check_quota() comment above.

> -Satya.


Thanks fore review,
Piotr
> 
> > +
> > +static void check_overlap(struct kunit *test)
> > +{
> > +	struct xe_guc_id_mgr *idm = test->priv;
> > +
> > +	if (!require_iov_config_or_skip(test))
> > +		return;
> > +
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
> > +
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), GUC_ID_MAX);
> > +	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
> > +}
> > +
> > +static void check_overlap_alloc(struct kunit *test)
> > +{
> > +	struct xe_guc_id_mgr *idm = test->priv;
> > +	unsigned int total;
> > +	int usable_id, shareable_id;
> > +
> > +	if (!require_iov_config_or_skip(test))
> > +		return;
> > +
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
> > +
> > +	mutex_lock(idm_mutex(idm));
> > +	total = idm_total(idm);
> > +
> > +	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
> > +	KUNIT_EXPECT_EQ(test, usable_id, 0);
> > +	if (usable_id < 0) {
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
> > +	KUNIT_EXPECT_EQ(test, shareable_id, total - 3);
> > +	if (shareable_id < 0) {
> > +		idm_release_chunk_locked(idm, usable_id, 2);
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 5);
> > +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 5);
> > +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 5);
> > +
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, 2), 0);
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, shareable_id, 3), 0);
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> > +
> > +	mutex_unlock(idm_mutex(idm));
> > +}
> > +
> > +static void check_overlap_release(struct kunit *test)
> > +{
> > +	struct xe_guc_id_mgr *idm = test->priv;
> > +	unsigned int total;
> > +	int id;
> > +
> > +	if (!require_iov_config_or_skip(test))
> > +		return;
> > +
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
> > +
> > +	mutex_lock(idm_mutex(idm));
> > +	total = idm_total(idm);
> > +
> > +	id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
> > +	KUNIT_EXPECT_EQ(test, id, 0);
> > +	if (id < 0) {
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, id, 4), 0);
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> > +
> > +	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
> > +	KUNIT_EXPECT_EQ(test, id, total - 4);
> > +	if (id < 0) {
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, id, 4), 0);
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> > +
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, 0), -EINVAL);
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, 0, 0), -EINVAL);
> > +
> > +	mutex_unlock(idm_mutex(idm));
> > +}
> > +
> > +static void check_overlap_partial_init(struct kunit *test)
> > +{
> > +	struct xe_guc_id_mgr *idm = test->priv;
> > +	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
> > +	unsigned int shareable_start;
> > +	unsigned int rest;
> > +	int usable_id, shareable_id;
> > +
> > +	if (!require_iov_config_or_skip(test))
> > +		return;
> > +
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
> > +
> > +	mutex_lock(idm_mutex(idm));
> > +
> > +	shareable_start = idm_shareable_start(idm);
> > +	rest = idm_total(idm) - pools_size;
> > +
> > +	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), pools_size);
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), pools_size);
> > +	KUNIT_EXPECT_EQ(test, shareable_start, GUC_ID_MAX - pools_size);
> > +
> > +	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
> > +	KUNIT_EXPECT_EQ(test, usable_id, 0);
> > +	if (usable_id < 0) {
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, rest, 0);
> > +	KUNIT_EXPECT_EQ(test, shareable_id, pools_size);
> > +	if (shareable_id < 0) {
> > +		idm_release_chunk_locked(idm, usable_id, pools_size);
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), GUC_ID_MAX);
> > +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), pools_size);
> > +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), pools_size);
> > +
> > +	KUNIT_EXPECT_EQ(test,
> > +			xe_guc_id_mgr_release_usable_locked(idm, usable_id, pools_size), 0);
> > +	KUNIT_EXPECT_EQ(test,
> > +			xe_guc_id_mgr_release_shareable_locked(idm, shareable_id, rest), 0);
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> > +
> > +	mutex_unlock(idm_mutex(idm));
> > +}
> > +
> > +static void check_overlap_partial_shared_range_blocking(struct kunit *test)
> > +{
> > +	struct xe_guc_id_mgr *idm = test->priv;
> > +	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
> > +	int usable_id, shareable_range_id, shareable_overlap_id;
> > +	unsigned int shareable_start;
> > +	unsigned int nonoverlap_size;
> > +	unsigned int overlap_size;
> > +	unsigned int total;
> > +
> > +	if (!require_iov_config_or_skip(test))
> > +		return;
> > +
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
> > +
> > +	mutex_lock(idm_mutex(idm));
> > +
> > +	total = idm_total(idm);
> > +	shareable_start = idm_shareable_start(idm);
> > +	nonoverlap_size = total - pools_size;
> > +	overlap_size = pools_size - shareable_start;
> > +
> > +	KUNIT_EXPECT_GT(test, nonoverlap_size, 0);
> > +	KUNIT_EXPECT_GT(test, overlap_size, 0);
> > +
> > +	shareable_range_id = xe_guc_id_mgr_reserve_shareable_locked(idm, nonoverlap_size, 0);
> > +	KUNIT_EXPECT_EQ(test, shareable_range_id, pools_size);
> > +	if (shareable_range_id < 0) {
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
> > +	KUNIT_EXPECT_EQ(test, usable_id, 0);
> > +	if (usable_id < 0) {
> > +		idm_release_chunk_locked(idm, shareable_range_id, nonoverlap_size);
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
> > +
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, pools_size), 0);
> > +
> > +	shareable_overlap_id = xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size, 0);
> > +	KUNIT_EXPECT_EQ(test, shareable_overlap_id, shareable_start);
> > +	if (shareable_overlap_id < 0) {
> > +		idm_release_chunk_locked(idm, shareable_range_id, nonoverlap_size);
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, shareable_start);
> > +	KUNIT_EXPECT_EQ(test, usable_id, 0);
> > +	if (usable_id < 0) {
> > +		idm_release_chunk_locked(idm, shareable_overlap_id, overlap_size);
> > +		idm_release_chunk_locked(idm, shareable_range_id, nonoverlap_size);
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), -ENOSPC);
> > +
> > +	KUNIT_EXPECT_EQ(test,
> > +			xe_guc_id_mgr_release_usable_locked(idm, usable_id, shareable_start),
> > +			0);
> > +	KUNIT_EXPECT_EQ(test,
> > +			xe_guc_id_mgr_release_shareable_locked(idm, shareable_overlap_id,
> > +							       overlap_size),
> > +			0);
> > +	KUNIT_EXPECT_EQ(test,
> > +			xe_guc_id_mgr_release_shareable_locked(idm, shareable_range_id,
> > +							       nonoverlap_size),
> > +			0);
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> > +
> > +	mutex_unlock(idm_mutex(idm));
> > +}
> > +
> > +static void check_used_usable(struct kunit *test)
> > +{
> > +	struct xe_guc_id_mgr *idm = test->priv;
> > +	int id;
> > +
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 0));
> > +
> > +	mutex_lock(idm_mutex(idm));
> > +
> > +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
> > +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
> > +
> > +	id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
> > +	KUNIT_EXPECT_GE(test, id, 0);
> > +	if (id < 0) {
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 2);
> > +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 2);
> > +
> > +	idm_release_chunk_locked(idm, id, 2);
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> > +
> > +	mutex_unlock(idm_mutex(idm));
> > +}
> > +
> > +static void check_used_shareable(struct kunit *test)
> > +{
> > +	struct xe_guc_id_mgr *idm = test->priv;
> > +	unsigned int shareable_start;
> > +	int id;
> > +
> > +	if (!require_iov_config_or_skip(test))
> > +		return;
> > +
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
> > +
> > +	mutex_lock(idm_mutex(idm));
> > +	shareable_start = idm_shareable_start(idm);
> > +
> > +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
> > +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
> > +
> > +	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
> > +	KUNIT_EXPECT_EQ(test, id, shareable_start);
> > +	if (id < 0) {
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
> > +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 3);
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 3);
> > +
> > +	idm_release_chunk_locked(idm, id, 3);
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> > +
> > +	mutex_unlock(idm_mutex(idm));
> > +}
> > +
> > +static void check_used_mixed(struct kunit *test)
> > +{
> > +	struct xe_guc_id_mgr *idm = test->priv;
> > +	unsigned int shareable_start;
> > +	int usable_id, shareable_id;
> > +
> > +	if (!require_iov_config_or_skip(test))
> > +		return;
> > +
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
> > +
> > +	mutex_lock(idm_mutex(idm));
> > +	shareable_start = idm_shareable_start(idm);
> > +
> > +	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
> > +	KUNIT_EXPECT_EQ(test, usable_id, 0);
> > +	if (usable_id < 0) {
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
> > +	KUNIT_EXPECT_EQ(test, shareable_id, shareable_start);
> > +	if (shareable_id < 0) {
> > +		idm_release_chunk_locked(idm, usable_id, 2);
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 2);
> > +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 3);
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 5);
> > +
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, 2), 0);
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, shareable_id, 3), 0);
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> > +
> > +	mutex_unlock(idm_mutex(idm));
> > +}
> > +
> > +static void check_release_usable_range(struct kunit *test)
> > +{
> > +	struct xe_guc_id_mgr *idm = test->priv;
> > +	int id;
> > +
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 0));
> > +
> > +	mutex_lock(idm_mutex(idm));
> > +
> > +	id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
> > +	KUNIT_EXPECT_EQ(test, id, 0);
> > +	if (id < 0) {
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 4, 7), -ERANGE);
> > +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
> > +
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, 0), -EINVAL);
> > +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
> > +
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, id, 4), 0);
> > +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
> > +
> > +	mutex_unlock(idm_mutex(idm));
> > +}
> > +
> > +static void check_release_shareable_range(struct kunit *test)
> > +{
> > +	struct xe_guc_id_mgr *idm = test->priv;
> > +	unsigned int shareable_start;
> > +	int id;
> > +
> > +	if (!require_iov_config_or_skip(test))
> > +		return;
> > +
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
> > +
> > +	mutex_lock(idm_mutex(idm));
> > +
> > +	shareable_start = idm_shareable_start(idm);
> > +	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
> > +	KUNIT_EXPECT_EQ(test, id, shareable_start);
> > +	if (id < 0) {
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, 4, 7), -ERANGE);
> > +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
> > +
> > +	KUNIT_EXPECT_EQ(test,
> > +			xe_guc_id_mgr_release_shareable_locked(idm, shareable_start, 0),
> > +			-EINVAL);
> > +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
> > +
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, id, 4), 0);
> > +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
> > +
> > +	mutex_unlock(idm_mutex(idm));
> > +}
> > +
> > +static void check_split_boundaries(struct kunit *test)
> > +{
> > +	struct xe_guc_id_mgr *idm = test->priv;
> > +	unsigned int shareable_start;
> > +	int usable_id, shareable_id;
> > +
> > +	if (!require_iov_config_or_skip(test))
> > +		return;
> > +
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 4, 4));
> > +
> > +	mutex_lock(idm_mutex(idm));
> > +
> > +	shareable_start = idm_shareable_start(idm);
> > +
> > +	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
> > +	KUNIT_EXPECT_EQ(test, usable_id, 0);
> > +	if (usable_id < 0) {
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), -ENOSPC);
> > +
> > +	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
> > +	KUNIT_EXPECT_EQ(test, shareable_id, shareable_start);
> > +	if (shareable_id < 0) {
> > +		idm_release_chunk_locked(idm, usable_id, 4);
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
> > +
> > +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
> > +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
> > +
> > +	idm_release_chunk_locked(idm, usable_id, 4);
> > +	idm_release_chunk_locked(idm, shareable_id, 4);
> > +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> > +
> > +	mutex_unlock(idm_mutex(idm));
> > +}
> > +
> > +static void check_shareable_spare(struct kunit *test)
> > +{
> > +	struct xe_guc_id_mgr *idm = test->priv;
> > +	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
> > +	unsigned int shareable_start;
> > +	unsigned int overlap_size;
> > +	unsigned int shared_tail;
> > +	int id_tail, id_overlap, id_extra;
> > +
> > +	if (!require_iov_config_or_skip(test))
> > +		return;
> > +
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
> > +
> > +	mutex_lock(idm_mutex(idm));
> > +	shareable_start = idm_shareable_start(idm);
> > +	overlap_size = idm->usable - shareable_start;
> > +	shared_tail = idm_total(idm) - idm->usable;
> > +
> > +	KUNIT_EXPECT_GT(test, overlap_size, 0);
> > +	KUNIT_EXPECT_GT(test, shared_tail, 0);
> > +
> > +	id_tail = xe_guc_id_mgr_reserve_shareable_locked(idm, shared_tail, 1);
> > +	KUNIT_EXPECT_EQ(test, id_tail, idm->usable);
> > +	if (id_tail < 0) {
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), shared_tail);
> > +
> > +	id_overlap = xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size - 1, 1);
> > +	KUNIT_EXPECT_EQ(test, id_overlap, shareable_start + 1);
> > +	if (id_overlap < 0) {
> > +		idm_release_chunk_locked(idm, id_tail, shared_tail);
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), idm->shareable - 1);
> > +
> > +	id_extra = xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 1);
> > +	KUNIT_EXPECT_EQ(test, id_extra, shareable_start);
> > +	if (id_extra < 0) {
> > +		idm_release_chunk_locked(idm, id_tail, shared_tail);
> > +		idm_release_chunk_locked(idm, id_overlap, overlap_size - 1);
> > +		mutex_unlock(idm_mutex(idm));
> > +		return;
> > +	}
> > +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), idm->shareable);
> > +
> > +	idm_release_chunk_locked(idm, id_tail, shared_tail);
> > +	idm_release_chunk_locked(idm, id_overlap, overlap_size - 1);
> > +	idm_release_chunk_locked(idm, id_extra, 1);
> > +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
> > +
> > +	mutex_unlock(idm_mutex(idm));
> > +}
> > +
> > +static void check_shareable_spare_fragmented_tail(struct kunit *test)
> > +{
> > +	struct xe_guc_id_mgr *idm = test->priv;
> > +	unsigned int usable = GUC_ID_MAX - 50;
> > +	unsigned int shareable = 90;
> > +	unsigned int shareable_start;
> > +	unsigned int overlap_size;
> > +	unsigned int count = 39;
> > +	unsigned int spare = 10;
> > +	unsigned int i;
> > +
> > +	if (!require_iov_config_or_skip(test))
> > +		return;
> > +
> > +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, usable, shareable));
> > +
> > +	mutex_lock(idm_mutex(idm));
> > +	shareable_start = idm_shareable_start(idm);
> > +	overlap_size = idm->usable - shareable_start;
> > +	KUNIT_EXPECT_EQ(test, overlap_size, 40);
> > +
> > +	bitmap_fill(idm->bitmap, idm_total(idm));
> > +	bitmap_set(idm->bitmap, 0, 1);
> > +	bitmap_clear(idm->bitmap, shareable_start + 1, overlap_size - 1);
> > +	for (i = idm->usable; i < idm_total(idm); i++) {
> > +		if ((i - idm->usable) % 5)
> > +			bitmap_clear(idm->bitmap, i, 1);
> > +	}
> > +
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, count, spare),
> > +			-EDQUOT);
> > +
> > +	bitmap_fill(idm->bitmap, idm_total(idm));
> > +	bitmap_clear(idm->bitmap, shareable_start, 30);
> > +	bitmap_clear(idm->bitmap, idm_total(idm) - 20, 20);
> > +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 30, 1),
> > +			-EDQUOT);
> > +
> > +	bitmap_zero(idm->bitmap, idm_total(idm));
> > +
> > +	mutex_unlock(idm_mutex(idm));
> > +}
> > +
> >   static struct kunit_case guc_id_mgr_test_cases[] = {
> >   	KUNIT_CASE(bad_init),
> >   	KUNIT_CASE(no_init),
> > @@ -109,6 +733,20 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
> >   	KUNIT_CASE(check_used),
> >   	KUNIT_CASE(check_quota),
> >   	KUNIT_CASE_SLOW(check_all),
> > +	KUNIT_CASE(check_limits),
> > +	KUNIT_CASE(check_overlap),
> > +	KUNIT_CASE(check_overlap_alloc),
> > +	KUNIT_CASE(check_overlap_release),
> > +	KUNIT_CASE(check_overlap_partial_init),
> > +	KUNIT_CASE(check_overlap_partial_shared_range_blocking),
> > +	KUNIT_CASE(check_used_usable),
> > +	KUNIT_CASE(check_used_shareable),
> > +	KUNIT_CASE(check_used_mixed),
> > +	KUNIT_CASE(check_release_usable_range),
> > +	KUNIT_CASE(check_release_shareable_range),
> > +	KUNIT_CASE(check_split_boundaries),
> > +	KUNIT_CASE(check_shareable_spare),
> > +	KUNIT_CASE(check_shareable_spare_fragmented_tail),
> >   	{}
> >   };

-- 

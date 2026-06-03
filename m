Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11E2CD6E4A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 07:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D60010F9A3;
	Wed,  3 Jun 2026 07:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgIUKp9Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E5C10F9A3
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 07:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780473453; x=1812009453;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=j8IxGgeKbqaH4xyNHjVimFHyN2IanLphG4BFDnOjnu8=;
 b=lgIUKp9YP5I3ywdCfbHDpkIiDnWkGfqx4Z+kFyvAbzzv6b6IDsB351aC
 jyqooMr3p3CfxbUmV8BdcYCp6YhrcyiFXRn21RN0yYTsr5hnhsx9Q7ic6
 /6ogS6maA8EGIziZLOexbCisr4PwYPExO5WCanOdOTjLRoaIzv+mrhs/7
 R6req/HJPEXUMUW+kEULQtNhDUXGUwZeH1f4oUrpj1RKUTJgaUUhX5bM/
 AfRklvZQ/FzJjedTIJl00LVJ6wK3sSWI4phzrEjK/fGDWAU0xbP1JF+QS
 zBETu4MUuPPlTUpkaLEUM5fglLvMo9Aepi+hpgu79UzjXox86rKolISqj w==;
X-CSE-ConnectionGUID: ZmqCZZLpQpikcU8uxLoibw==
X-CSE-MsgGUID: MXTg6mi1RZef/DN/PIKoQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="85127809"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="85127809"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 00:57:32 -0700
X-CSE-ConnectionGUID: d8RNrhtWTl+1aI0SZwHDxg==
X-CSE-MsgGUID: 6tuY1KEwS3GKqdvj453aKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="245967973"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 00:57:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 00:57:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 00:57:31 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 00:57:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7NAWdrU4r8w9ea+ZrqKDdR6U1TzMlBsLBGYsI9k+CMCKbq/XWN2FfCnAtuNL4vmrxSdF2aVp2MKn3RHDnaZT0bEEo5EDoZ3FPcotSsRvQ0f0uR1byfquTYeRRW1dFsW54BTDiasmyuSKae+S60LUJvEK0xz4mKLRKuvQ3LrMeauXShbfk92/zziVUYbmHNqZiLOofP9/uUSVabH7l6FOZgaEgyRwIeTV8bcPZzDKBPyzX0Qw2u5aeN+2C78qHPbx4gR/J6le4trphpLb6x5Ed0YHDHXE3aX/J0d5iyFBqzLBu0dEaqlqb90Ai/T7B5ne86mWgzpSGWcbqUsR7dgOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUbKzFvAKMTpTowXFyvRU+Wsu3TN7S/0CSHS6A+doPo=;
 b=cUj3y3XEOK1hVoohesPzf3YvMiLow/e0YRCVGbkn2KNcmlMFG8Wj6696xvwccYA5D99qKu+fUuPbp5iUo6e4aXw/ZtoY+5CUYQU+4qRgaDFcnRTDdMxSQbqxk/fQLJj3VKI+XtAP64aRnrjBq9DUXnDZGHCFoiljAv8wm3XAebI7sTaA8vEra8VQKRpJoOBx7+TwjUtvrfPgEWy2aIptLdw3ikZInvBko1UxcmzKZkOUwqEtFl9BvUa/YPACiD6oPDzCGMsM6qjBFgwo+kdQWoZ/9AyI4hAUbTgxTcTqHjNRK1i9wmpAz8HhRqIzip+ctA51qRQN95Njg/vGslYgNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SA1PR11MB8278.namprd11.prod.outlook.com (2603:10b6:806:25b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 3 Jun 2026
 07:57:29 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:57:28 +0000
Date: Wed, 3 Jun 2026 13:27:20 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>, <matthew.d.roper@intel.com>,
 <vinay.belgaumkar@intel.com>, <tejas.upadhyay@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
Message-ID: <ah_eYJpPX1_YKtHf@bvivekan-mob1>
References: <20260602043231.3119355-1-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260602043231.3119355-1-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: MA5PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::16) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SA1PR11MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: 019ce0d9-edd3-4968-17f9-08dec145c1fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: ZHBviBLSw9HRr8p9y/iHgG6Mi97N8gYEhU6l3bjewvQ7z4QSRQ7xP9HyWnVEGBIz2XJfU9/Y7kpDpMvYYAgJdGRDkXVoC4jtkpazybK2FUarYlKnMTfcnf5CaNHknEaUGft0h4vxW6b9q4Vu7mfzwuf3foCUrNhPzmzr965dl+IuzWsp3eYkTan/tl6mJgBAmEcxtMYtCtTws7IhL2Pfy5adeAFyjlZiPPQDCPUYCyW46QOh6PX2adw7cw6ouqbWYmyLwGY4UhVyQWTxRqxtTehCyQcXEwzibkHBbKx5Ju+Qlf1rYytWgwJwSfzrgqUHC8TrltQZRLFsT8j153Mvnk+0oDH4O5u5W/l+E1GnfBMJZWc7oamKp479okRhYsPy1fl0TIFs0PIXYicTjnjrm6ahvnzKBw4m/oY1PFl9WNYgYmF7LjzdBsBxhLX6Zdn0a3AyCLCZN8KeftlOLOwFZ3BLoprrhhHg8leJZ8R1fU1T3z6nsqp09JPSrl0ojA9fvoT8RHGP4iKjoGvOn9Ekfy1hHvyYUgpodobjVsfzT3X4VnbZ5Chv/1b4uZkFFI9IhoTsdSqapFYdKLt9Bid0vYY/P7do2TPPCg0GjX0pj4B4yIlza/8OHhiv0zkgm/ftTDoomczeeElMi5WoYmK1VP45PoUmjw6QmD7rCVoMr5Aq2rgGnEnH1/KDP1e0eCJv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXpqWnM4eFB6RTZUd2drb2J5SWY4bVdDYkFTdWFNMHpTS2hYcWh4VDVFd2tR?=
 =?utf-8?B?VEI2VCtRNTdJNWZTblFUV0Y5dWlWZjdoQ2hvVU9iWFpVY1FmWlZzVVpYYjky?=
 =?utf-8?B?SGRsS2JiTHRVc3h3ZWJhSWhYSkpKNmVhdWRoeWhUcG1yZGVOcEVWQjVtNll1?=
 =?utf-8?B?bkhsMWVsSTBJSUY1ZllwQXY0akIrR2hhZVp0eFpMOUVyQm5nb3NERitMUlcv?=
 =?utf-8?B?YlZseGovV2RRSU84WjdzNGFiUEVKYk5PTU5GV251MU1WWnE3clA5bnEzYnZQ?=
 =?utf-8?B?dC9TVUtwR0w4RWVmOTM4V1hSbTYwcVhhaCt5d2lBSGxTQSs1ZXlEL3E5UUFB?=
 =?utf-8?B?cThTeFhyU1Z2K1dzS1ZGNFFUUU05eUxmN1hTa2dMb2FPdjZINWhHdzZSL2lR?=
 =?utf-8?B?ZWR3Ykp2MVBkMWtkZGJ3ZjZJL2xhUGZwRDNxNmFhMWhBK2NlSXROUHh1TVNK?=
 =?utf-8?B?NWZvc1RjSVVEZnVRZFBXOEVBOFlTREtrNUpMajI3NSsrbms0Q3Y4aXVUcG4w?=
 =?utf-8?B?MEZleG5OdnVjS05tZm5UcElwazhFL01DL0dUNStJNElOUkNhSGROY0lMbVFZ?=
 =?utf-8?B?QVI3Z2tqQkxOOW53NllZN0FoM01Ud05XQlRQemZHUjNzSXlRR1QyVHJlTU94?=
 =?utf-8?B?UUJyWjQ2aVpFa0J2UldsZFNZNmFtWDVtZUlWM2xpRTErdGluOXlac1ExaEhs?=
 =?utf-8?B?cGZCQ09SSFp1ZGNCZk5kN01lWmIycHpQNDd3c0dvaEFucUVxSnUwWE5aWnR0?=
 =?utf-8?B?eDNDRFBDNVA1VEE3ZFZTOVowMW9qbGtCM3pPYUtCNUNpT2V3L3liMk5iNjNo?=
 =?utf-8?B?dTk5WnZLNzcweUoxOEQ2Um1RcDlmQkJwMjJtS29PbnJtWG41VS8zK0pyWHFT?=
 =?utf-8?B?dU43K0VkNHQyaVpudDZraW53VjVCd3BMMmh0REMyVjhVQ1VQMVRQSWV1WHU0?=
 =?utf-8?B?aFVJamMwZWQzNmJpTVRGWVZmMTdGZGVCUmVNbkYvYWhNNlJRbWdDWFNqVGdQ?=
 =?utf-8?B?N29EdXREOWhYUmcwQ0xPWk41MkcvY3ZFQ1FqSTNpVEJoUHRHZy9BMFFRZ21D?=
 =?utf-8?B?bzhLc3k5YzE4SnE3dU5kZ3VRMllZRkE5NTVCSWdzN3ZoQ3dvYXFJQWtWUDZZ?=
 =?utf-8?B?S21ZRzZwWlRtZ0pRWS9HNit2Y1VNWHNLakRha2p6TGQ1b1dpTWE3d0taaHUv?=
 =?utf-8?B?bldya0pxb1hmWGJjVkU5TEp2T2F5WUZBZ1N4c2ZySldKTDVuRStvK05oWGpu?=
 =?utf-8?B?YklRTnZlN2hJLzZkOFpCbGRIUHY3NitBaGdDMUVrZXJhNlVDRGIwVjlMTEwx?=
 =?utf-8?B?K3U2NUJqRlNMWDczS1hMd1ozalVYc1VPY29KQkM0RFpZbnhhS0tXdzJSenB6?=
 =?utf-8?B?V2pWelNVeW1DenBRMVB6UWZFMWdMazBzTlFTTWpQU0RuQWplVXpHRi9Gb1VM?=
 =?utf-8?B?ckxDdm1nNjdCVHRBaTJybHE2bzNGNTJvcUdkUXFKcGFJNU5CWGYrb2V1OEtx?=
 =?utf-8?B?OUJuNHVOa3RMQzU5M00zZVg2aCt0ZjYzU0ZpS1kyd2pSRVhLWFIzZlpiZE1Q?=
 =?utf-8?B?RytmekR3K21ySGdpT0U2RzM5dVJneTBHU2JkN0RTZGk4cDhNZmt1dlZkcXVY?=
 =?utf-8?B?KzlmeXN0aldpdVYxSENlS3pZc0RQaGVzNUNMVFNEc21EMHVmVXBkQjZ0dGI0?=
 =?utf-8?B?R2pWdXplTzdkNC83QVhDRTdWelZnQlR0b2JZUWwyQk93RDBXbnlKZlJWWGhr?=
 =?utf-8?B?K1JZWnVRWm91OTFRaXBZZHVCb0xnbW82KzcrUjUyZkNTaWtKLzJUbjcrbU1W?=
 =?utf-8?B?VzlLV3Y0c2krTmFTNGovbTFaanE3cE8xSnJnYkgvMjVjemR5QVMzWUlBN0xC?=
 =?utf-8?B?bjAyQjZMenFyeXZGUDl0VzNkR0R2clJmRGxra05CVkg1czVwMGN4ME9VdGVX?=
 =?utf-8?B?NlNqV3haaHhIRnVjcklMZnlEdHN4enJBN1Q4SUE3OWh2U1dURE1IMEVnMjJH?=
 =?utf-8?B?VGtKQjdWRTdDTE8xZ05UaEx2TVFZWkJBM3prb2ljSmN6bTZka05POFZyYkpE?=
 =?utf-8?B?SkVod2Z6UkV2VzB4QjBSWW9XU0gvbmRlcE5ISmlmWVZlNjlaNG00OEJpeUpj?=
 =?utf-8?B?QWtUMkcxMXV5clArWHBaNTV0U1ZKVW5lbmYvUlgyS1Y5R1N3RG1SaTFYOWNQ?=
 =?utf-8?B?WUlRSjkxTWtGalQwRWptMjRaMHJFaDliUDFaNW43K2FoM2cyUzY2VmJWeUFE?=
 =?utf-8?B?STZhWE9nenpvYmtTckNla3lxNnhQQXRRYUIzTmJ6YVVDaEp2dXBPdEcwckEx?=
 =?utf-8?B?a2JJa2paSjYrSk9DNEE5QlVoNE0xVW1lOHV4eFM4NUx0RExFL1hYcFptek53?=
 =?utf-8?Q?AFCJtvJsBM3bNSzhcrbm+wyJDVzPzbAH4/QQB?=
X-Exchange-RoutingPolicyChecked: Db4mWZ2Ju7gh1oD0bptcQNmPXaI8SfCndba+ZVRU6vYjyUfWQwjnRszjbThuZ5IbCJ4HU7YMuLcV+CWqh0s2i4gEPXIFVOhHdNPr48K6V6WXOe2pDu3CWdYfPGkTl810vBhHXX6IRSkNHKu8uIGCllZMitirVxcqxCyn1q6hNTd/KwxSaTEiImOiLpWV+a24u3qC9tkqjIYeHVtQ7vv85nOUNfMsWRCVx/zTW7gpzVrCWHHRMTFToS3PzLu1RExKTkbAuxnShv0MWzq6mfaFoKUzTfThEHgu+0PM6iXfp+WPkwASqvvItBO05ah04Cos6tU1qFRUDFdcLbUF1c2pYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 019ce0d9-edd3-4968-17f9-08dec145c1fb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:57:28.8889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFumrurty9rpKo353ZJ6otIa0/KccDbHMaDp+NTTvg4RleVhby/j6nrCMJampkoZZDZl/20EKQi/6cTsGhWCRk1Xog4Ou3KLE9r2YYPKewrc9/KVagDNNqryeBHxxbKj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8278
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

On 02.06.2026 10:02, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> 
> Avoid IDLEDLY timer programming lessthan 5 micro secs.
> Apply wa_14025941587 to Graphics Versions 20.01 to 35.11
> and Media Versions 13.01 to 35.03
> 
> v2: Use xe_rtp_match_not_sriov_vf, move to local variable
>     Remove warn and other knits            - Matt R
> 
> v3: Add verbose comment - Tejas
> 
> v4: Restore IDLE_DLY register on engine reset.
>     Add it to GUC save-restore list. -Vivek
> 
> v5: Extend WA to Media Versions 13.01 to 35.03 - Vinay
> 
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c  | 26 +++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  2 ++
>  3 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index c98454545a85..2080e0e650eb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -768,7 +768,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  		}
>  	}
>  
> -	if (XE_GT_WA(hwe->gt, 16023105232))
> +	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
>  		guc_mmio_regset_write_one(ads, regset_map,
>  					  RING_IDLEDLY(hwe->mmio_base),
>  					  count++);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 8c66ff6f3d3c..dd8eec098bdf 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -584,8 +584,12 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
>  	u32 maxcnt_units_ns = 640;
>  	bool inhibit_switch = 0;
> +	bool wa_applied = false;
> +
> +	if ((!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) ||
> +	    XE_GT_WA(gt, 14025941587)) {
> +		u32 mincnt_idledly_ns = 5000;
>  
> -	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
>  		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>  		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
>  
> @@ -595,8 +599,24 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
>  		maxcnt *= maxcnt_units_ns;
>  
> -		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
> -			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
> +		/* Wa_14025941587: applied prior to Wa_16023105232,
> +		 * as the latter has higher priority, although conflict
> +		 * is not expected.
> +		 */
> +		if (XE_GT_WA(gt, 14025941587) &&
> +		    idledly < mincnt_idledly_ns) {
> +			idledly = mincnt_idledly_ns;
> +			wa_applied = true;

If there would be a platform for which 14025941587 applies but not
16023105232, then the above condition would silently clear the
inhibit_switch (bit 31 of IDLEDLY register) though 14025941587 doesn't
explicitly asks for clearing it.
But idle delay timeout won't apply when inhibit_switch bit is set.
The WARN statement below for WA 16023105232, is helping to alert us when
we are clearing inhibit_switch bit though the WA is not asking for it
explicitly.

Therefore I would suggest we add a similar WARN statement checking for
idledly value and inhibit_switch even for 14025941587.

> +		}
> +
> +		if (XE_GT_WA(gt, 16023105232) &&
> +		    (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch))) {
> +			idledly = (maxcnt - 1);
> +			wa_applied = true;

Regards,
Bala

> +		}
> +
> +		if (wa_applied) {
> +			idledly = DIV_ROUND_CLOSEST((idledly * 1000),
>  						    idledly_units_ps);
>  			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index f8a185103b80..5d5041168fa8 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -65,3 +65,5 @@
>  
>  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>  		GRAPHICS_VERSION_RANGE(2004, 3005)
> +14025941587    GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
> +	       MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
> -- 
> 2.46.0
> 

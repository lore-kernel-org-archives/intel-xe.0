Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE40C61DB6
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 09:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B603810E998;
	Tue, 25 Aug 2026 09:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFPiaihF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3347B10E998
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787650797; x=1819186797;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fsBMTfOSkma4dRPbCbc69w537Wx7+lNZsQGJg3HG5Tg=;
 b=EFPiaihFfl11VNmAI9bat66S35gBWXKDU/KMFpNV9rIjoICfpUUj565y
 mz69oENQ+q8TR2yT5I1tJ2oKPqDObzHCGFiFVYdmub0YxTyGVFK1weinF
 vY+xjFmkTYnDHUHbePvKW5Pv1ZIUVAOpFrGMM3bJ5+lk71uTjK8LnpM0p
 IfFkF/nQKbQxT03bTmq3g0OpLX8b2HxuLIs6z0hpUpM2TVjCT1yegOMXl
 mxWBjskhBJp/t/JlT7B6ssQOk0M2g4gvNA45ptpqocBclWiY56UU300e4
 RYOYECmyALRt3wl8fN3JJpoBSPiX0/Z6uzSMciz8KCnRbYp+EePWLnjeO Q==;
X-CSE-ConnectionGUID: L3G5HkBKRr20ejRp8E4vmQ==
X-CSE-MsgGUID: sbqIHOnkSu68u61Yy9F/6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88130105"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88130105"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 02:39:56 -0700
X-CSE-ConnectionGUID: L8Voe4/uT360zDkXV/HeMw==
X-CSE-MsgGUID: q2xTWMoLQAao3nGTlPllUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263966650"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 02:39:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 02:39:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 02:39:55 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 02:39:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHeZAwNX8kqguzNxNswGKEXmwL1ij+oMKoP/0/aHkvJ9HOIBjcQjOpjxOIBpa9SJRuPyBVl+EXoNNFHe1lNoQUtSDjSxGbqYsgzvHnnc8QJD6J0mc4UgeIJ7k/oidvb9CWEMVDn6HtZqZq5ykqvD42gy2yhR3EwpYjk+KB4GaWBU9t08noPDaPvUoL9ZO8IiVgNh6acf/04ddH24TmgDAr8rf+vHcED3W7ZjDJLu7sx/Kyp0wr3PXz+AUNdLIba+yytVHsF1jdarfeGoJOSBdkQTzAFTVQmoajdBw/2hdW2PW1+EYu54RarPDLnkKfsqGJCZkpxugFxRESTLAI+BPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnfkkDJeIlJvMDzX1JHLfw6sSD5ZdY+MnA/HlhTfcEU=;
 b=x76B9qNC882yYdoyyMmW5Ey4YmQm6HCtizx5mLTgWZ41Ky6hNL2MJqLKMUrDPW5bQ3iyG6FR4UpI5m180+OSEFc/W5GExXw2mhK2N/2yXoqdZ/Fs0P2f4TzCFV0zyrOtJArSvoDH9F4Xib6cN2uwL37MA9WnI2llMMXUCvCn3CBilpg5uaK2Z4wGT0c0QW+ZGUhysmjaX3e4kZ2pby47Wk11kz8PFeTmZkVzsYQTR3bKjGS/5lqp0kVeIVYyUtavI3QD5/loP/gz1ciWMCkQkSQFJbDC2O8e8nUgL5SsaHgVfGDm7grkdytT87pKoKAOsp+jXtxm2IaYJDKfEGGang==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by DS0PR11MB7506.namprd11.prod.outlook.com (2603:10b6:8:151::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 09:39:48 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 09:39:48 +0000
Message-ID: <4ad586b1-14c5-4cd4-98aa-056cb47265a8@intel.com>
Date: Tue, 25 Aug 2026 11:39:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/guc: Allow GuC CT for wedged device
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>,
 <daniele.ceraolospurio@intel.com>, <sk.anirban@intel.com>
References: <20260821122114.567725-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260821122114.567725-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIXP296CA0002.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::12) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|DS0PR11MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: a7fbe3ee-b301-4b3d-0963-08df028ccde5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: vGaoHhhK/o4IsM5KgNVHvfqlgmA5gAXdls2libLS6EuzuHjJFqIbp2h5aggb9RttmmQ0d6TMj98qv7L7oPXDVv/Jjq7BcxvN9ifZjuJIxKuLitb6lwSywF9fV/+67yaw9hBHa/nStsMMTqCgbVtXQ7UqN9bWSd2vKPWQ2exXEWQLM0Gvctgi8/KF1l8wDS4djdo+oHoz0AHUa8d99DbenvhVCkKeJ87/mR37oFuM7K/4TS7Ct7r6uy7zZ7cVBX3dCNmEMzNEm56lJ3gm8ua9pAdQq7eQhMbx+KjYc1AmAYncJIjljXy3/KDZ83/EMFTaKQq9RCctgy58NqO0pMBnGws3Ossb6pQqCxNlH78gVo3pZRbZHm9QQ3wGbVkD1Q6tir4YjeiH2BaZjdDjVbVYtS6WBfowU9CDPnXN/VwOYx8aVDiyVPiTLS0N3ZFmsjsJzXkQEiUE88HbO6t6y6D1YgLoc5WO4rC6nYJZ8qP7rpk0wsisNmPhF7rK2Rppv9+TogMw2l+LyIEAeROu3TqMtjsHVVemdbs/AYR8BiPa9UIj/3v+0m1GYXbM+fI1dHU8HRAWsiFQSsyANHUSUt6o13TH5wm2FAlmDbzGTO4E745Ww6k2qo8fO4WRwuiXeT7gM77Zcb2xP5eCLO4e4NoTK/UlhT9MhEcbhxEdXHGFj1I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3d2Wm5LTjdzYmlDU095WDM5empna012OTlYZVRRQTlPYXpKbnE3U2xDRVNw?=
 =?utf-8?B?S2Q4c3c4WU4rWnRvOU90L3JpSDd4YTRVcTJlKzAzWWZVZkcyVHNrWFNKcG1q?=
 =?utf-8?B?NkE4cTA0U0hUTy94MWRNd3FDQXRabUtHZUtoS2R1YjBHZmZqZ1kwcTdESk1m?=
 =?utf-8?B?ek9FcUIyckY0SWdseW91Y1JPcHZvelpoS0NvT2lOdGFHOXFObk5MUURmbzBK?=
 =?utf-8?B?UXFZaE1lcXYwRHpNdk5BMTNUUGd6d0RPQjIzMlRHZU42MVhEcXhTMVdpQUIz?=
 =?utf-8?B?cTZrSGNReW9wNzdQSWtKRSt1UEJFSDA2clZUVElVSmhsSWZNakVjbXFBRE9I?=
 =?utf-8?B?UzFmRUZKZTZhTFdvbmg5WEpqb2lhZUYreVNYOEUwZXdCUHV4SDFGSmVRbUpl?=
 =?utf-8?B?ekNMRVhYNi9oYm9Ma2t3dlM3TEtvYmZBWi85blRzNXlVcjZISVYxY1lyTDdD?=
 =?utf-8?B?aHZqMERFSG5Oa0xnODJlb2VIb0ozd0RoaFBoOG81T21BRVREQ2dQV0paMEZU?=
 =?utf-8?B?dG9QdmVpYVBQcnhoVlhVbXdFNk9xcjNhNDF5OHNpb0xjRWpuOUpCTXFRSEZB?=
 =?utf-8?B?OGI1MktkNjk0K092L0l1SDlPbE9md0ladzE5SHJqWVMwMkhid091YW4zTDk4?=
 =?utf-8?B?N3drc3EzUVQ3MDh3NTNLeHZPdnNTeWhqTTNCWW9TaHFod0VkYUZyTjg5SXBt?=
 =?utf-8?B?dE9ENUhnZTdVSXBzaFN0OHFmQmszM0ExTjBlRi9WbGdPM1pHeWRWdTk5ZnZM?=
 =?utf-8?B?QkpmOCtoWk1XbmFzbzRFQ3ZFV3NPTFJ0b3IxMUVMMGp4WFovczJGQTFiaW1s?=
 =?utf-8?B?TWlUeFNod2xhSFdiNUtweEVkbXZSdW9aUmNFS0sxa3lhQlYwWnZ6bHJPOVp6?=
 =?utf-8?B?cEQwc25PVjB5dnhHRWkrMlhSNlhuTE5mUWZDbTR0U0hBTEZGTHZYZXA3bzc4?=
 =?utf-8?B?Wmhmb3QvQUZhTWlJM3FwVlhVb2FjdGU3a0FUMXJNbmc4bEtjaTdZMXZMT1dJ?=
 =?utf-8?B?SlJ5WjFKSmkyTElnUWZ4Zis5b2pmYUkyUEVuR0YwbFVmbGZvRDM4L2o0akIx?=
 =?utf-8?B?cm5kQyt0dEdaKzFtVEEwSVplRzlUNFVmSFJiZnFQd1haOE1wRUZtZDQvK3V0?=
 =?utf-8?B?ZmhzMlYxWS9UUGVJWVkwa1lrblB1R0l1M2U1b20wOEFvQ2FNSHNYUVF3ZnY4?=
 =?utf-8?B?RTIyQXBNQjBBdFI3RFh4Ky9vTGovQXlGWWtSZnRoTmlkTnIvVnNCc2ZxUHJY?=
 =?utf-8?B?Wmp0SlhFRndlUEVnRmFDUGNmMjJoamhYMWxPRGVwdFpMbk1JNlBqK2RrQVhG?=
 =?utf-8?B?aDNiRVZqbXQrbGVtenlNWVpZUDcveVBVWnlZYWNPSFBlUDFRbmM5aE9ZSXhG?=
 =?utf-8?B?SlJXUDUzeVVCKzFRSE1UZ1FyUWYvWUpCbisvV081cHlrMzIwbjdadlA4bkFj?=
 =?utf-8?B?dlZINUZJaUVJMFRhMXRMcXZuNGVhUS84K005MHdtcVpSZlFnTjVLV3Fad0dE?=
 =?utf-8?B?UGh1RXQxcmViQjhWLy8wdHBZbHNWMWU4YnlGV2IzSk5IOVlDZ052bmp3T0VC?=
 =?utf-8?B?WHNMVC9tODUxeWI5d0tmLzBPczBIT3Q2cHFJREl6Z1VIeGVqdCtuSVBGb1JF?=
 =?utf-8?B?YjRPV0pGUnZsdVl3SjIzdStjWlN4RXN5OG5KVTVGS3VPM1BHaXprYS81SDZu?=
 =?utf-8?B?NG5KemJwbS9odE4wUGZkb0oxOTFOUUljVi9SMWFSTS9FQjYxWDg0U3ZXcWVj?=
 =?utf-8?B?RHJhTUhzZUZJRHBxdS9WT1ZuTVcyR1hTZ29VeUVFckc2UHBRVWtsK2o2Wjh5?=
 =?utf-8?B?WXdSY1lpbzlhczlKbHpOTlNIT3MySGJuU3I3VndWcFRpOXBVcHZhbm96ZlY1?=
 =?utf-8?B?Y2NiQTJmak1ocnRWcnZ2ZEpwOHFjb01peWxBSXlic1l5eE9aUTBZMnMwWVpz?=
 =?utf-8?B?bFdzeXFDUE12SXRPTEJjdXhCcExtUUNGb2d5QkpIcnR1OUQwa0RnTWNrelc2?=
 =?utf-8?B?M2IrMDYxRmxrMkpraFJ0QjM2YXZmVERuOVdPaGFEYUUzNUsrN2pYd0VDT3Nr?=
 =?utf-8?B?TXpKSXhEOFh5RVg0QkJqRVhDQ0tnOFBzQlRiQkg1WEpKbU5QTW9oSDEwWnJK?=
 =?utf-8?B?UHQya1ZHaWdTVGpCMXZRQXRxUHN4Ti9NWWVueEtOY0MrOWJPNGQwbkVFaUVF?=
 =?utf-8?B?d0F0dXRYcEZJUWdlYnZueE9YREpMczRYRkx6Vm1FU0dGZHBCdy9ZSFU4RXB1?=
 =?utf-8?B?cFN4SWZKdkl4T2ZUaE5NR0JZbDE5V3ZvM1VLd3J3UFQ3Nk1OcWkwMHh5Szdr?=
 =?utf-8?B?ZlIyZm9pelhLS1QvZFJNWlBKNXhZWlFoNUpRY2VsMUFWUkRQMjlWUT09?=
X-Exchange-RoutingPolicyChecked: cojQgrRfRr3DPU2iP8UEGEM6JV5US5J3D6XoFyi8GicQFQoREs298S6nVozLsS6keRMMFkK0bnX/IBB0S5m9Nr2J4a/JSqUWmjHCpoyDLJ0Mi/Hzh3SptWiXCBwZI3vR1DcnmQ01l0bu9sowWzPqjefAShVVYTosz74Qv0gy6ska9TD5KKPD9/udY0LRkoeRVZdj8OgzC1H3SKL6FYQy6K9NiL+lWHMoU6kitoB5mJ3LojTE9GJeDu1m7EFmT9TbseZjnaJZjPw2d7rJsVbMgOdLoomyZx+i9oySBB8gyxn+w2eQQbxJWgPYLG/86W4v+8/hs/JB6SI/ULm3INqV/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: a7fbe3ee-b301-4b3d-0963-08df028ccde5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 09:39:48.5228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HVmvfmG4hCwPO0eY4tpFgesNPCyMD0K2vKNXdCX0AnrQDGDGuUxOql92WZPJMCDkBuRqMhN0Xm/cMt5cuJVGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7506
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


On 8/21/2026 14:21, Raag Jadav wrote:
> Commit 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable
> cancellation") introduced distinguishable error codes for g2h failure
> cases, but also blocked GuC CT for wedged device. This is problematic
> in cases where we want to prevent user from accessing the device but
> also keep GuC CT functioning on temporarily wedged device. First user
> of such requirement is PCIe FLR handling where we require uC firmware
> loading while the device is temporarily wedged.
>
> Fixes: 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable cancellation")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 8 --------
>   1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 5c4733da385c..97e38147effd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1062,11 +1062,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>   	xe_gt_assert(gt, g2h_len || !num_g2h);
>   	lockdep_assert_held(&ct->lock);
>   
> -	if (xe_device_wedged(ct_to_xe(ct))) {
> -		ret = -ENOTRECOVERABLE;
> -		goto out;
> -	}
> -
>   	if (unlikely(ct->ctbs.h2g.info.broken)) {
>   		ret = -EPIPE;
>   		goto out;
> @@ -1813,9 +1808,6 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>   	lockdep_assert_held(&ct->fast_lock);
>   
> -	if (xe_device_wedged(xe))
> -		return -ENOTRECOVERABLE;
> -
>   	if (ct->state == XE_GUC_CT_STATE_DISABLED)
>   		return -ENODEV;
>   

There's also third instance in guc_ct_send_recv().

Shouldn't we distinguish between temporary and permanent wedge here 
rather than removing the checks entirely?

And it looks like it should be a part of the FLR series. This patch 
doesn't make sense without this series, and FLR series doesn't work 
without it.
I'm also not sure if it deserves the fixes tag, it wasn't broken at the 
time.

Lukasz


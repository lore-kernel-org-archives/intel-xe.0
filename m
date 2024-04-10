Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF41CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 16:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1371310ED1E;
	Wed, 10 Apr 2024 16:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYw+l2Yq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61E1113402
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712764951; x=1744300951;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=603ZNaVncS6RvULp/MCeqJhRahRN/UoSFA5U7OIWqps=;
 b=hYw+l2Yq8cL+DV0kieqZdjUqYb03HrZ9dRQ3jjzNH9UAdzmGJeqhFMZe
 L/mBT9gJ72SDMlQpLvut3bBF0BkaT80TK0xBZQ+eNGlTEicP7Src2k2H3
 4up5wtrw0QK+JQyX7Wmroy2c0uT5OweL4L0tJJ23jXgsb1zf8AZkpV1z/
 7TvpS72ZSfCMzezk7V+xOCr6QOj2FExPvEts5F+OB7POOe2TOQKvtykad
 tXGS9vZtrFhOGvfns+4davCD7uPPqVToWaqTDgNe9A/nMpzO4/qVuokvb
 gGY3sdzur6qN7bA2IQ+pAP3GjsqbPTyz7xWRv94uObn51MXI42Sxm/wXf Q==;
X-CSE-ConnectionGUID: FwdRu+CoSrukjpHJ8uS4IA==
X-CSE-MsgGUID: XqqBqmVPSyaM/sClHo1Zmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11103138"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11103138"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 09:02:21 -0700
X-CSE-ConnectionGUID: 2En3F1qNSSa6Hy4tLmFDTA==
X-CSE-MsgGUID: 6gVvw0HXTX2cNN7d7vtMcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20637111"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 09:02:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 09:02:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 09:02:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 09:02:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4Jlma3SQGlFOyKngVBzBIW+F7k62QoBMnzAadx5Nj/tI8fmlQZhDRNMaHJbme+4b2ITlYQEwmnyoODZaprrwZlYzaBns/xNMTJjyobsf+sikQXLIgpvBausRkn0oyNBUgNyywtBiK5UZaCBfNzWZHfnXKWZBwteM+l9A7Gocih73+ep3VvWkFq4og9TogzCdq34P9BAs1j6FEM0VAI7XOH7/6OB/bW/vwpAM516BUsgurwjk/nkFJVBwwzSXPy/81GCyUUTeAe3Z7xQ54kNEIYDJnHZf68h6YiVDxyPESGoo3/ZSTET40gB0cy7HnizWBFCc6Ww2GeEwlsdOKjPfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LOUydxxhU5pE/pbqeF+rbLCrutB8Vfkl0+WaFFwr30=;
 b=LE7a4Xj643TklYvIXkU/U6R4kBvHlSeUH06iv8YsLo3OQdgOpO30ZYDwKZI2OcnlhWCNbKfMgGo3Dz9gUqSxHxrH8xaz4Rt7ksxix7BEJPNenOzINq6RIWNgE2kHt9qGZ54hMsfm+gdY/hwPkWIU21/L6Lm8Nye8q1Lc/Vj7nlmmTzpRx2mqZ4K7e/XAe+XBdKtDifj60zpmPQnOhq/g+e2FTmRYpHJ9E8X+rw4yTELlYX/ggooqYPTZhiyAzjCVSD+hlcZVoBDiUHuxjvyAR7+0sG1P7eaAsEPQ5AK3jjgkLlkYmmGs3pw+vcIT/aVncmwcvAqlq0N71KRijjyv6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB6855.namprd11.prod.outlook.com (2603:10b6:510:22c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 10 Apr
 2024 16:02:18 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 16:02:17 +0000
Date: Wed, 10 Apr 2024 18:02:15 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/xe/guc: Add PF2GUC_UPDATE_VGT_POLICY to ABI
Message-ID: <20240410160215.qsdso4wtzhvxpxr3@intel.com>
References: <20240410123125.1155-1-michal.wajdeczko@intel.com>
 <20240410123125.1155-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240410123125.1155-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB6855:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sAgjGib8pijSHMTJRgztdy0QuT5TKLM0nQZin3Y/fEeIALsWtpRjGZGe13dWco1ueAvWoKle2jO6C988Fm5Ji5PIxNpmvqKjCLXrewHP+cDADVrV4so9yZVd8IfmJXoh+PUKVD6AwnzpfJ7wIeHS0t77fYkA95ZGy28N4gpafcbRl0BmYn70LSA6KlYqdZeLJBwi+PrMI4tfZ2kd67XBoSKdVmPa4FnaidX3YzBWNm775gX5B+1TfD0/BMbEounCijnTwkWFdKhZ2Kl3CwM452KTfIPmi5yaRhATmjWZmhKYMad057lNFCYLyXAk36LeF2wpnp8CDDr7EEjEqB8rk4GiSa7Lxvqq90CizeSRbBFEHj8BIVAFqZoOs7VpWZeM9rvovzGhazzPNZx+uvI7PIgLKsG1KRzfGfVpXkIQhryyvXpn8PzHA4OX+NoHmk5tb0fE9el9yWEcXQrjfl9lz8v85U7ooKiJuRK9Im8wxVmC1ZCHL7D5bXWCXwnaHJr3SH54FlxrFzmpzZuHeSvnr0IBcRibLieRHwTis5H/KKAmsxTbGC8/H2guiSN4IRJNLEgkbxF9xw9DTNjr/9iapZ66LdycnLvlbcezPogHoXvBxRY2cEcG1pdd8z/RHT3fohvyyG1L8Tyw0NYfgevaKqhRkn+4fgzAFiQ1rXYn8ro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em41WUZqRno2c0d6YUN0bmxtYWlNKzhGTEk3azRvM2pobHdhNmV4ZmZBUDY1?=
 =?utf-8?B?Zkl0ZFhvNW5OMWZ1enRHZk1CVFdMVzZ0TXJsQVBBQ2pYOFk1ZnZqaU5HTjlK?=
 =?utf-8?B?OUNvVnUzcWFvc0JHTG9FOHFjNWtuMEZBVk0vazEzenJ5ZXJUcE41VGlHNXFG?=
 =?utf-8?B?SmlIVnNqZ3BMRkZtbTFPbTlIVjA1eStYL3hMd3poanpTMG1nTHdiY09tUEp1?=
 =?utf-8?B?c0NzNE84Uy9VR3NjRjBhWFI3VnpPSG9YZVRieVZtVGd1QmMzM0tFK2FITkdS?=
 =?utf-8?B?NjVnUCtqTGpqeU1KSTR5b0F5VDVGZkJtYlRMTFhTL05GRnQ0NzBXbHdtQnI3?=
 =?utf-8?B?VVZHYUNVdm5HYU9ZN0JTTGQvWjRWVHFLbTZqL0JmYkY1VjZ0eHBrT2RjVWhU?=
 =?utf-8?B?c1MyN2VBT29tUXViY09OcFN5ckpkWmhaK2RLRDlYWTdBeDFkbjFEeTRQSzJH?=
 =?utf-8?B?SVExMll0OXFqckFSTCtNTUtZTEdkVnZnWTJ4bUtlaDR4bDV4Q2ZEMVRSOVFL?=
 =?utf-8?B?bWdYZVU5eDFxTEdRbUtVOEQwZTVYTGZUY3YwSnBGUUM3RHEybEZQL254Nisz?=
 =?utf-8?B?Z2hrZDNUd1A0OCtYVVVjOTk5UDg4MlVmOTJSQ2NKZUJVRGttQmRyRGdGZXp4?=
 =?utf-8?B?VjdJQUhsRnZmSnhNQ3lnSWdwdXlLczY0SkhmWGJlb01WdjNFWHdHcUNUTzIx?=
 =?utf-8?B?L3BkZlFOVnJaSk9XV0hmQW4wWFNXRjZXeVl0Y3VPenpaRUJWWjRwREZxSUkx?=
 =?utf-8?B?cTNKN3hTWlE2Z1l5T2FWY2VtdnVWamIvTTllSjR6c2hNcVVsOG1kbTZSaE5x?=
 =?utf-8?B?RE8yeU5TSzZHaXJWR05yRWdBSjJ4UVBOU1FyUTRENG50UGJHRDk3WldWYTRI?=
 =?utf-8?B?azZxWk1QVTF4NUQ0emo1MkdoOXZjdmd0MlNEcWpyWDJNT2dCMGhyN2wrTlVB?=
 =?utf-8?B?VG96WlRvSHduQ2xXTkpPS21SQnBVK2RzUzg5T2huTFBFbW5wSWRHN1lGYXZi?=
 =?utf-8?B?YS9OZGN6dk5BdThKMFU0WnR5NXM1VVhESi80L1dCWitmT3UrbUoycVZmM3pO?=
 =?utf-8?B?eDJyM1FYYjN6ZjNieEp4SlpkME13NWRzdm1NZlA3dVVrVTZOZmZITCthZHox?=
 =?utf-8?B?N2h4YVUzU3Q2am9GZmt5QWdoYitwd1RWZFVDLy9zc0dDUHVBNUpsYWgvTGJv?=
 =?utf-8?B?QmYwU0puVGhseE9hcVphcUJSZlRoVDBNZmc1MXRrWXEvWDcxVnR5c21UWWp5?=
 =?utf-8?B?d2dNYU1ZeVhxaU5OSlQxOU91QjJKSGFDYThWSW56ZzJXYUZUU3ZhNjUyeG4v?=
 =?utf-8?B?andmSjBRU3ZwS0JsNVMvOU82V0M2b2tkRVRJRFNwRzdXa3VRL1pSYmhING9z?=
 =?utf-8?B?SUY4NFJvcWJibzhYdS9paG9tRCt5Y002NXBMSG40UmR5c1E2TUQ2blozejJP?=
 =?utf-8?B?Szd2endMK0FscnprNm9CajlDS0lBa2hCbm5qK0dSMVV0KzRIWnZPbVhSMXZa?=
 =?utf-8?B?VStRWVpEVG1EUXI5QVorOGk2WVlaZTA3VTloekZ0c1ptYjVQZHU2MmdSUkhX?=
 =?utf-8?B?aDlpYnJZbzJjSGxPemU4QmRYbDJzNTlxSnBuU0dmSFF4MFkyaGoxZloxTGlO?=
 =?utf-8?B?UkVGS20xd3JpcC9NQnd0SDhRWGVHVUlyWVFZQ0hoeVd3V2EwdlFTaTJzUWM4?=
 =?utf-8?B?Y2Z0Q0t5WkNkMS8ybTN4ZGd3TklRNEJuaEJ5LzNmTnlsbjJEblRDOXV0dGlo?=
 =?utf-8?B?NXk4OEQrSHl5QTNEc3ZRaGZLN0lmalM1MHJ3RlZ2b1hQSUZZSkZVWjZWNURj?=
 =?utf-8?B?L29xZEhlMGdyNFZBNEpHT1NWekxBUmJib0VNY1JhREVjRGM0VGtsMnBNR0kv?=
 =?utf-8?B?VENkWVhLSDhXK0Q0NzZZRFByT3o3WmVXendYQW1wYm9sRnVIUExWazd0cko0?=
 =?utf-8?B?RTY5MjdFNmx3bWZ5UndCZE1xc1R4Ump1bmNYOFRFZjZxZGQ4OWI5Q2RJM0Z3?=
 =?utf-8?B?MzlLTlFTMTc5US9BTlQyRGpXb3pnVG9pRUZFbTVhOGYvTXB0b2FaemJiVmV1?=
 =?utf-8?B?Nnh6dkxvWXIvczU3UjBWL1ZlMHpLaVJVbSszVGdsZWdSUTZ4WEFyYjJXZkZz?=
 =?utf-8?B?cFJNK2FZMTRuRlIzcGFUYUFCTGlDcGJDZkxGRzB6NVJ3aGJXQkdyVlpDbU5z?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da4799a-0ff6-4e66-e3cc-08dc597798a4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 16:02:17.7957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+/kqhDiI/SmC4mkcJ8mS3WmiWvd63BpCFwWD4HbsJeSnMwuOnHrD1eeVKy9W5DZbsiKPf4q6EJzYf0zWYIgEMuJvkuJWGs0UlvfkcMRDLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6855
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-kwi-10 14:31:23 +0200]:
> In upcoming patches the PF driver will add support to change GuC
> policies and will need to use PF2GUC_UPDATE_VGT_POLICY messages.
> Add necessary definitions to our GuC firmware ABI header.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index 12ee5e9e831f..5051e3b866df 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -213,6 +213,53 @@
>  #define   GUC_PF_NOTIFY_VF_PAUSE_DONE			3u
>  #define   GUC_PF_NOTIFY_VF_FIXUP_DONE			4u
>  
> +/**
> + * DOC: PF2GUC_UPDATE_VGT_POLICY
> + *
> + * This message is optionaly used by the PF to set `GuC VGT Policy KLVs`_.

typo

> + *
> + * This message must be sent as `CTB HXG Message`_.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | MBZ                                                          |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_PF2GUC_UPDATE_VGT_POLICY` = 0x5502     |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 | **CFG_ADDR_LO** - dword aligned GGTT offset that             |
> + *  |   |       | represents the start of `GuC VGT Policy KLVs`_ list.         |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 2 |  31:0 | **CFG_ADDR_HI** - upper 32 bits of above offset.             |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 3 |  31:0 | **CFG_SIZE** - size (in dwords) of the config buffer         |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | **COUNT** - number of KLVs successfully applied              |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_PF2GUC_UPDATE_VGT_POLICY			0x5502u
> +
> +#define PF2GUC_UPDATE_VGT_POLICY_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 3u)
> +#define PF2GUC_UPDATE_VGT_POLICY_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
> +#define PF2GUC_UPDATE_VGT_POLICY_REQUEST_MSG_1_CFG_ADDR_LO	GUC_HXG_REQUEST_MSG_n_DATAn
> +#define PF2GUC_UPDATE_VGT_POLICY_REQUEST_MSG_2_CFG_ADDR_HI	GUC_HXG_REQUEST_MSG_n_DATAn
> +#define PF2GUC_UPDATE_VGT_POLICY_REQUEST_MSG_3_CFG_SIZE		GUC_HXG_REQUEST_MSG_n_DATAn
> +
> +#define PF2GUC_UPDATE_VGT_POLICY_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define PF2GUC_UPDATE_VGT_POLICY_RESPONSE_MSG_0_COUNT		GUC_HXG_RESPONSE_MSG_0_DATA0
> +
>  /**
>   * DOC: PF2GUC_VF_CONTROL
>   *

one typo, the rest of the code looks ok:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 

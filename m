Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B45C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 09:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B9110F2EF;
	Mon, 15 Apr 2024 09:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TCPaAAz6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CD810F2EF
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 09:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713173396; x=1744709396;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CrIKmPMLOc1TGSR1cmQ9D1+W4QMP3Nivz61cjOYXL0o=;
 b=TCPaAAz6p/JDbxDToJBda6qH2aAo5q8sYhZyWAeI8iucfDNKet0idMD2
 e+f1Y8FkMTFGmpOLexzB+pJayVC9+9BhHOlT0En3xz74/aKFRMkHLH0sq
 Wh1rU652ujBw/UXsGj8MiDvsFavpwO73/xD00VB9Z4vpFxULmotke2vO+
 zP1Afy0gdClq0gkr/xpGXnXderc3h/9oyo2bYulSLvFYE30ZQ8HziveB7
 0x0KrloZGSbrbG/q1pDuHxuQM3Qg+DvlQhBzz86yYLbr2eewwXwqR0oYs
 aSdWnxCunxc6+JTHVIqrGaInaIqP33X4nItuMBVUxmasE0UaHiq6QrpVW w==;
X-CSE-ConnectionGUID: 4lqDhyLKS+CM3sekqXFLeA==
X-CSE-MsgGUID: OD8wkS3fQPSgJjNR/nVXZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="31032233"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="31032233"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 02:29:55 -0700
X-CSE-ConnectionGUID: Mo8VM+5VRJeYCRVGbbhezQ==
X-CSE-MsgGUID: 1G8WroE2RvaD3HFvoZ1vow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="26654344"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 02:29:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 02:29:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 02:29:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 02:29:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 02:29:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1Ws6VaR+fw/k53y37Y15syDLMD4LPOuXjlIl3uqz6xjo728iOWmOX0fpvctZU13ywsZRjLHsC41/DoBMsExBWnkDAIt7XsU69EeEpDeEYKAB+AZ3nKHGgdfsf2LiaoqOlv0lxO56k03Ej2MaQ2SfAPy4g82qoSzh56FXLutLgyp26Ehcl/HjwKtW7IYw+NlS9noXbeCpYjAFKOTYb+hx1oqVaaqRBepDy0iW7nFJFsuu1RuBrXFsQqhfNux7f4QqPztBKxzoxI9GrbN1mTBPUxnYtyWsFGMe4NICmoBPzWVcNftOkla2DN6mXllR6STOOSPhScl7XXO2HYzJb7Mmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4B2jCo88ttkG6lOs/ASZ/cVazIiJZyigge+eGIiQEM=;
 b=Q/T1w+FKbB0hgzVbMh3uz72A+jZvmOuc9/CVMTwWrKlo499MaWgJ5NX84zy6ADR4X06vDdLE89t/rFJHuHYlWuGQUxqnarmkRTntjHGBISJIAZ9HISE+W4g9ROU/65s7FqUto7oQ+yZE2QjEBH6yXJtNXq2WIJrcgbEG368heE3ICfs1t3bZLcIxJF8i38nDEsyhjx/OFsdle9rFT7Vctj08CxwXZl2SwYvnLsDCFY7ZSqxSaR5/y9djj/XzlJ5umAQff8y51JHSL43ZYySuksdxmCFVN0xNuwWkLGVjLe/CWbsHLgNulWFpagAAQPOvx0OE8+V6GyK8bDxEIJqaLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB6125.namprd11.prod.outlook.com (2603:10b6:8:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.43; Mon, 15 Apr
 2024 09:29:51 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 09:29:50 +0000
Date: Mon, 15 Apr 2024 11:29:48 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/6] drm/xe/guc: Add PF2GUC_UPDATE_VF_CFG to ABI
Message-ID: <20240415092948.uy5f654xlivf5wzm@intel.com>
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
 <20240414190137.1243-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240414190137.1243-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: PR1P264CA0121.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cd::15) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 6106bb3d-4c31-4e62-f48c-08dc5d2e999f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PgnjQ4bkKv1DJHSKnQKW4oB+3mp42NF5qTodim45K9oDzGbkEcZgxoUUC7EcJvPyp9Dro5EtZwTYrwHDIrP35yHFAkdK8LvT2JOkNZNsJBSC2XsId12qOphGNwT2bWya/Fkd3uH2Ki+UpNXugo+BVWj7/TOlqdF+rbN9pDRnCn6l/yaGwUcqVpm4Fp3RfvehNWAm/GbhfAT8QH5GHg7nlokII7Lkdy9qCpV4hJeJsgT9Sz6gHCDygaJMmzIhwC23RUQjO4emok7WT9uTqWYb48L48M/czUHDgCQTaH7GIHdgpBcJI4HJtGXCho8oEW6ogXXsNvmkPvzuRe5mvbVIvPbKsfTJ1nSymk36EYSWT5QoDWHgZs3rl5Q0NIhFKPR5NfdQoBMpzPJuP8UPG9xBA2iKTNokGiIjLxOQ++fj7UrsAPEjtweWlNm6HxWojZ/YS5Hk0/O7D4W+CYPmoHHasYEg71vYdNpEb7L2I67jUvPwfmvNlHyxl/e0hNuxHQ8Ca23vEn90uiSu2tssIr0pnqS4PYxpsMomupH4qZXRmmSCfIRS1vyaEbaAtmexvlgJGHlwfZsUpWGn4onEs9crXVWDwskZqrh5QR3ZIDjtLliKmbwAUVjdtnMcLr1pMCEX2VafqdqEuFVWJs7rAPimPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHBYVHRtWFBPNnJ4dGtONFpiMEEzSXMzdVVSSlkvTld3VlZZVVpBNUtydW9O?=
 =?utf-8?B?N2ZsVENFWlhTVjFDTnZFV0lmbGJkZ3h2cmxDVWUyZWZEWmttM0VNbXdVV3RG?=
 =?utf-8?B?T3NCNndCZE40T0dmZ3lwZEU3RzlvQXhTdTJ1U2hiRkNPaGlDQzdrcUF6ZDBj?=
 =?utf-8?B?U2pFbE1CWDNCZTZWK3BUTTR2K2RrTGdOaHFQaUM5WE9lV1BMZFRwNFBKM054?=
 =?utf-8?B?KzJtY2F3TjdNWGtZQm9CcHJWckVYOTNKSUREZ2krSU05elhmT3UwODVRcUUx?=
 =?utf-8?B?UW1YdVdmaHRJNG5kUm50SVJJekR6dXdMZ0hZMW9LUHRpZzZneURGRTBhaHJm?=
 =?utf-8?B?YkJFejlYSGpqYVRiSjExUjN3ZU5NWnFHZnRIcDBsYWtwazQ5VjkrN2lEQ083?=
 =?utf-8?B?WkJJR1Raa0UwMnVZQ1Vuc20yU09zdVhmK0psbTgzd0dHVmkwci90UEhheDlj?=
 =?utf-8?B?OFhYNCs3VmJPYTRpRFV1S2NkaktRR1l0OFJOTXRkVy9ZYjZ2ZWVhZlg3YXJn?=
 =?utf-8?B?UUVYcG9Oa2NXc0F2MGZHYjVPdnF4TDZHUTJTRFIxSnFkS2phbzhEb2lMa0Jh?=
 =?utf-8?B?eHVkRUg1RDJsTnhqQ25FYlRJdE14WXNZK09lVkovNjZUVll5c0QxekFYTG1Z?=
 =?utf-8?B?QnZsc1piaWg1bGdkQ1k5MjJ3Y1JUZ0VHcHZZYlhOSVJiaHVPa1k5dkQ2MjFs?=
 =?utf-8?B?enk0dnBMMURsaUtGYUhJdURiU0xGVG1YRU9aODRnSU9RMnhzUHBPc0RMeUFJ?=
 =?utf-8?B?cWprT1pDL0dPa0x1MUxzK3ZWUjdXaWFmU2h5V0NtVy9iZGZONTVlYUxJaDZB?=
 =?utf-8?B?TlVlcXpMTUtzSGo3UWNnRGtENHVFdElHZU1xVjU0aEV4d0Nha2VhNXp5Qklv?=
 =?utf-8?B?LzFWMnNLa0NoV0JJSzNHcVorMk5Kczh0UHhJY0RCL3NXZUFncFc0ZXFicVpO?=
 =?utf-8?B?SnNmT1RQYktBU29Ed05kcWVwZjlYekZDUXNJU0wyQUV6ck91NWVHRnIrbCtX?=
 =?utf-8?B?SFNGb2Y4czN4cVdOWG1SUWFhSzdmWW5OdDRONXRWTzN3MWtBUWFwelFFOUJO?=
 =?utf-8?B?Y0NnQ1VSR2dnZFVSU3lqRlZ0OVNTaHpiMlZwTVlhZ0xRSmVRWEtQb0ZQNHdj?=
 =?utf-8?B?aHkvNXNzMFJ1aDNMMTJzQi91QkxzQndpbmczRnBYV013dUZwQVFzNkRjMEFB?=
 =?utf-8?B?L1psaWJsV1A5UTJVWG5nM01uaktGU0hwUyt3ekFMN1Q5UGJaT2tzTVNBNXRM?=
 =?utf-8?B?eWRlUGFkM2FvUkxQcENhN3RqY1FHV3dub3N5R2dEM2NPbzUyZVB3Yy8vSmVo?=
 =?utf-8?B?eEZpc2NabXJxV2VjSjUycmhiN0R5NTl2SUZwKzdNV1VmVTRIL1pzcm9SRUwx?=
 =?utf-8?B?a3Rpd0pNYVlEZEtFWnlUVWVoYlE0TTh2OHlRZXRzSzRqd2EwblJpeWJLTjNo?=
 =?utf-8?B?YzR5R3lvUW1SSUFWWW9ZK0ZFMjFPNlU1dmJucVRCbUZRbkxwYzRzM1BlUHhH?=
 =?utf-8?B?MDdSSEwzem5YZWFrYy9ZZkJnOVZsUzhmOEJoSFBYc2podDlPei9iWlcrNkVt?=
 =?utf-8?B?V281WlRiMXdIeEJGbzJuUHhpWGhId2NYRmRHZHBLRTdKUEtjZFdiemVkRjd1?=
 =?utf-8?B?VEV2dnI1ZC9PRFRJZ05TcGVMQW5KbU5tUHYwbWFiWlVTMU5ZcmFoSW03Mllv?=
 =?utf-8?B?UXgrYzMzVUtYSS9EWVpSdEZpZ0x2TEVPTHRUWVpweG5nVWRqdVU1Y2c0YXBs?=
 =?utf-8?B?aUs1Uld5b0dqdm4xUlhMVEJBa2V3ayt2YWp3SmtTbTU3ZXQxMmdKQktVSTFT?=
 =?utf-8?B?OGRsR1dpalNuQWZISURKdmxhdVBrUzdDUityWkV0NnJoRk5WWHAwdFpGaFF4?=
 =?utf-8?B?RGozdVBjT2FwbzhJSWlQcTZISGhOQ3JvNm82MDJIdld4cXRNQjhCZ2hVNGxC?=
 =?utf-8?B?TkxxZUt3b0JiV1NXTlVZNmVUeXF2di92WjMvbWN2VHdrK2YvVUJUaDh2NUNs?=
 =?utf-8?B?VXZOVmJ1NUdZaU85cXBGejlJTG1weVhsTnE5UWlwRkwyVndVWjc4QlFjTU5R?=
 =?utf-8?B?NW9kZEtVVkxiZE9rZUlkOC9xTlNWVDZOcHhMcVVLNjQrOGxzc1FyUHZvOTc1?=
 =?utf-8?B?YUVZQ0xabkRyenZzR21Xa3U2dHVtRFlqMXhRaWt1SnJHSllodWhjQWN2M3dN?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6106bb3d-4c31-4e62-f48c-08dc5d2e999f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 09:29:50.8151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CuZ3SSCEn4F/sflroJmXnS7CPi08H4g4fZY17gY+3EH4eV+GwdLcBeTWD4CTZCkK4vP2pQu4eLAWzHUbJc16gAJ/u6kzrFnU+/Ph1K+3+DI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6125
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2024-kwi-14 21:01:35 +0200]:
> In upcoming patches the PF driver will add support to change VFs
> configuration and will need to use PF2GUC_UPDATE_VF_CFG messages.
> Add necessary definitions to our GuC firmware ABI header.
> 
> Definitions of the GuC VF Configuration KLVs used by this action
> are already present in abi/guc_klvs_abi.h
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index 2d829e812c61..c1ad09b36453 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -260,6 +260,61 @@
>  #define PF2GUC_UPDATE_VGT_POLICY_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>  #define PF2GUC_UPDATE_VGT_POLICY_RESPONSE_MSG_0_COUNT		GUC_HXG_RESPONSE_MSG_0_DATA0
>  
> +/**
> + * DOC: PF2GUC_UPDATE_VF_CFG
> + *
> + * The `PF2GUC_UPDATE_VF_CFG`_ message is used by PF to provision single VF in GuC.
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
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_PF2GUC_UPDATE_VF_CFG` = 0x5503         |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 | **VFID** - identifier of the VF that the KLV                 |
> + *  |   |       | configurations are being applied to                          |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 2 |  31:0 | **CFG_ADDR_LO** - dword aligned GGTT offset that represents  |
> + *  |   |       | the start of a list of virtualization related KLV configs    |
> + *  |   |       | that are to be applied to the VF.                            |
> + *  |   |       | If this parameter is zero, the list is not parsed.           |
> + *  |   |       | If full configs address parameter is zero and configs_size is|
> + *  |   |       | zero associated VF config shall be reset to its default state|
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 3 |  31:0 | **CFG_ADDR_HI** - upper 32 bits of configs address.          |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 4 |  31:0 | **CFG_SIZE** - size (in dwords) of the config buffer         |
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
> +#define GUC_ACTION_PF2GUC_UPDATE_VF_CFG			0x5503u
> +
> +#define PF2GUC_UPDATE_VF_CFG_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 4u)
> +#define PF2GUC_UPDATE_VF_CFG_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
> +#define PF2GUC_UPDATE_VF_CFG_REQUEST_MSG_1_VFID		GUC_HXG_REQUEST_MSG_n_DATAn
> +#define PF2GUC_UPDATE_VF_CFG_REQUEST_MSG_2_CFG_ADDR_LO	GUC_HXG_REQUEST_MSG_n_DATAn
> +#define PF2GUC_UPDATE_VF_CFG_REQUEST_MSG_3_CFG_ADDR_HI	GUC_HXG_REQUEST_MSG_n_DATAn
> +#define PF2GUC_UPDATE_VF_CFG_REQUEST_MSG_4_CFG_SIZE	GUC_HXG_REQUEST_MSG_n_DATAn
> +
> +#define PF2GUC_UPDATE_VF_CFG_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define PF2GUC_UPDATE_VF_CFG_RESPONSE_MSG_0_COUNT	GUC_HXG_RESPONSE_MSG_0_DATA0
> +


Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>  /**
>   * DOC: PF2GUC_VF_CONTROL
>   *
> -- 
> 2.43.0
> 

-- 

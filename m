Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E0AD1CA0E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 02:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00B310E2CA;
	Tue,  5 Nov 2024 02:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KH5Dq24Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3411C10E2CA
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 02:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730774778; x=1762310778;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4UOrKPkFwxJfQCioDlz49w22vJWg7llstBRJvWyaX4o=;
 b=KH5Dq24YiNo/mPGMDoCvVDGIEMjkvNIBhJc8heCrQ3loTmmcmYNaMmjx
 8DcuH+vq+RPRFmu9JTqMxkZvj/08n+7GtjKaNj24wgvK59xqggp7SDb1g
 PUy4nfvIaApGCZrtMN+5obKjFkC4n++BOMoUAXZ8ebcBiyGOGvi3FoIpt
 Vxy8Ln1W8MMWx2L8HPJR/ERmjebQ4+6ViNoyMR6quzQvmVDCEVo72n5Zx
 zxgFek7FToWVHjxBZXgNtE8nhBzM9Ha/DN23NkG9w/xhHvSkj23Xt1gvx
 w/WZFG7lwBBbV/GIgIoPWKnw7oTag2+SnFw36gMQh/KwDhjatUoUQPd7S g==;
X-CSE-ConnectionGUID: dz0d1lofTYO7Q3YOGFoDsA==
X-CSE-MsgGUID: 1ll41zOHRKG/OEX6a8ucgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="48009689"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="48009689"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 18:46:17 -0800
X-CSE-ConnectionGUID: x7ec7qyLS2+djSqnwfAaQQ==
X-CSE-MsgGUID: 9HyY6GXjTzi73gFF0mctHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="121330839"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 18:46:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 18:46:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 18:46:17 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 18:46:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfSu0QjViC3e3GxmIDSv4zmg7vQuN647v/aXajRh+C2jHtpe4I/0+93VZUwhfJEHCpU+MFYJK4/3fl+g6qzVCWupraJiVdZSgZn35waGSvoAXJWOmIAG8EvpCZdoc9DIha3mNt7vd/bBcHs5cOKlbnLYU4LyfEniVlo+6d97TZktTf8BT347Ul3NT8uplRwVFp2J7zPXzhVosIJKTcZF2PtiowtxmWQebzNyVXDyjiwQpt7UX7f9Y229bNtV2vw79Dvyp6Hri9jgvGmlkN6sUXwYFkrYTxj2mFIBiJlTbD2QxHTRoJ4VLiSvN7dWUbOM2Il7bcleVoumqY7Kqi/KMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukWCm6YbhGWRDhnV8ieRj10hYEPjBCicPnq5FnfqRpE=;
 b=jFUv/BMgHypC6ntMerLe1/tDx7ZikAw9WAuiADBEbN/wpMiiVrkPZ1o6UdWUjExvC+nTAtxRUUCdhW6BvgsmlyLjOWEZ+t3WNogaqoUqEsR9CzTzNAnP4VRV4P5MAv3+FUiwrFV4cHrFl2QD3J1D9j3loNSgtqZag/lquBXKe181mUY7yyfk65ue1VxWOTJuXKrERBw/pYOkKEywHNxk6PjYfdpwXbMeKszgMajw+85fcxVEpOXNozqZzHKby3iG1+WIHSLQKGrbxkgG3FFN9GXzACkVzZbXisw64NHQiM73gVsNB2h7iTiFxcLNmoZvoc2jGsSORgkc7GXJq1WvdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7800.namprd11.prod.outlook.com (2603:10b6:930:72::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 02:46:15 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Tue, 5 Nov 2024
 02:46:14 +0000
Date: Mon, 4 Nov 2024 21:46:11 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Drop VM dma-resv lock on
 xe_sync_in_fence_get failure in exec IOCTL
Message-ID: <ZymG839w8UP2eSpB@intel.com>
References: <20241105003832.4021758-1-matthew.brost@intel.com>
 <20241105003832.4021758-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105003832.4021758-3-matthew.brost@intel.com>
X-ClientProxiedBy: MW2PR16CA0062.namprd16.prod.outlook.com
 (2603:10b6:907:1::39) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: ee16758f-b249-4254-64a1-08dcfd4403cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2r/78z880xJW2w/vV3Lk6s8C8Hlz7JkHDwj2EJ9aULyZ7gZUugjFsvBHCglL?=
 =?us-ascii?Q?sE2wSva3csC8ye6h59nj50C7v3TlJmre/M5Ad83YVSXPUJvpDw1/45yBCkTx?=
 =?us-ascii?Q?LZ9duk7Jaa+ChEgfsNT28YK1KG6K18VncgffVJ+d2BSsHLD50ZgPTA30dCmF?=
 =?us-ascii?Q?kHjHAta+7dOpatUnseJs6x360GY3+LqgvkW0fH1s9UKaYc8KjxKW4EBV2bIm?=
 =?us-ascii?Q?bLgSuNu82iOnhHo0wYLOtAlJQhc13+PWv9vTE/BkMYXf3YJDisT25Y+cam5v?=
 =?us-ascii?Q?VYgEgL2bnGMs4LVpcGwgm6ugWG10fWNL5I9MMddZrlgkkslebfwb8s8PttL5?=
 =?us-ascii?Q?m9eyCYktO3Abb1x7BtPQw2Zv+kaL9n7uBiDJJEJFiFE8pK4cT3M7btGy1jgQ?=
 =?us-ascii?Q?HQOaFDcSw2L51zGPtrb2+KurFKr9zCYrhPMW4FELjHYlu8mBlpYfh4XEQ6GZ?=
 =?us-ascii?Q?pGHoD6qPIzk1jcLtn+fx7+aLpkCuDOOcZ4r6yYNGCRR7ikoatAlIhUH98kXr?=
 =?us-ascii?Q?c5eXQTAcnsV4s7UiIKb1odZcGOGCAdlHoWpQeSbqnZLxLNyA0Gv71Gi9DFxM?=
 =?us-ascii?Q?1aueck28aZU0IhA9ED0RgE+m8FHmLV9rMhIVVbBF3b7sOOtVZKO43154SVzC?=
 =?us-ascii?Q?i6f1pD40khFrWzkqDtSdse107Sakoen60AelovgajPQe7ShNis1ca6/Muokr?=
 =?us-ascii?Q?J+aPsuc1FwPLGkMg+1jOhxjyoeKZY7WM1UasT4ko0K5vpMOawrGFSzPHv2rh?=
 =?us-ascii?Q?KGphcoPK6IRe7CPbpoq3/OXYqokWwV2rpYKGHi0/V4/LZ6Y5FFK6SDzxWEAb?=
 =?us-ascii?Q?i7JF/NlKOtYIkc1rGEwHWMkbjklv1trdpfIXE50w78d6eU+VG7qAH28aI98s?=
 =?us-ascii?Q?/ErglGzcUOxRiCFi/YY5/3jWRYE20Mj5ZRETdG9Brf9YBh/DK+D4X0WU/5Mv?=
 =?us-ascii?Q?ArZYmbZrwvwwVMEIj/HNUAjZB5Sc1SNvqPjPUIvRONvStQg0pXnubN+o6/SR?=
 =?us-ascii?Q?4KExALieX0ClzcCPLUfac2Mdg9FhdUkFHNdt0quVb38levsNH+o82asdDp4G?=
 =?us-ascii?Q?Jbvh6jyzk5PuFJUUO45xDJ7pH4qmNN09uYs/BZ+JUxIoHqOpyfeqfOGhmHze?=
 =?us-ascii?Q?+eWGPHuFkT5rRPkdPgeyKUMz2Qee6ZSwalgGVMpCbAUcasFtu75YCu+UefQN?=
 =?us-ascii?Q?crIrmeliaXVQTXZ7uXLzb1l69j97MqJYmxJeC5w0znpjHlkgcy/R+lNp0ug1?=
 =?us-ascii?Q?z+njMWmfAaV6pR79Xz28/1jkIJa1muOcAOdVOezGGSZCFN5YF6DGBbye4Um9?=
 =?us-ascii?Q?rN4vTrqU+t40M08eJtTn3M9P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5MsCJs/+dXTUW/s4zmnjTWKjjHrQiisNspXErH9D3ZVZxP6BlTSlOB2Ugo26?=
 =?us-ascii?Q?AwhNpwA74ekubZeJ/9chnx0VcJbrmejGj8WSjlg6EoTKpon0xVsB0dchUjE8?=
 =?us-ascii?Q?EAsGmq8EAIHhTQ0X3vHw5hUD6bvjXlAKRYbpFWG4qMh0g22pRE6Wtm3NbSxm?=
 =?us-ascii?Q?WnUDp0fkKUkDYg3EmcVHpnw5Lvwo15bm8VSSWY/iZlzcj1em8I/htQZ9/sLH?=
 =?us-ascii?Q?neuXTC6qt9nkbvdwVvy8bgzughyf6k3I8FuRwVFHxC54Jzb9DrATM+yQiAnN?=
 =?us-ascii?Q?t/FppuD1WmM38Gqkn5idIOAqV2WZo2HkdN/BHyN8OP+Z6blpc9g8B8ktGG95?=
 =?us-ascii?Q?GBqw+GbPmxyR7HD/muOY/fAUVza1ReO/E5PNfYy2CD95nM7Q0YDx0J4r17DH?=
 =?us-ascii?Q?rDELiiDJCsj8ZDv+gtWgKMD16fVRCbJzGOI9H4ngXpErDAG35Ci9MJ3G21Nc?=
 =?us-ascii?Q?juwV2PW/H4Wq5/4UgkM/ejGXEorVcVVaZl2jZGog7cWTupd5h67wnPeChPg4?=
 =?us-ascii?Q?FJM2HkQj7uaNp0tKpDs4Y7yYT4O1JytEODtED7RiKRdZjyWqIkf79C8axStT?=
 =?us-ascii?Q?D5wHfkMTd7eLTx5BRmWCq9c0qx/f+FCJPv13NQ6CmxRYywLFgKaG2EoXzbMj?=
 =?us-ascii?Q?LxxlJyjxptxQkYdLzQhxbQcZIxA+SPKKxqL9kj8+amjtODp1PCOiqp8gS/dk?=
 =?us-ascii?Q?X9hZV9TMvlGR1A+iL2C81Dzq5ShkhD05e7j7pqxsGFsXeQqrQClG5YoVuMhm?=
 =?us-ascii?Q?vWbahyMA5NvzSi5rlBtXwjP4MExqouZLlSyZYKsM+pe7YqgeVOiO5DUp5uC3?=
 =?us-ascii?Q?pz6qNBAq0FYwXQJCuB0LPQ4kE/GfM7DnUxyj6O5mgezjQ6NecqLa+9h/FOH4?=
 =?us-ascii?Q?utatEGivTtB/N5JFi8UBl9SlIYjYDZJMHYPtTseRLB7CL7+yipURho5B/yhd?=
 =?us-ascii?Q?J+BDMA70o4OU9RBPmlrJh8eP/gSzjxiaOgeCuSqUbEQ0hEl87KBjx5er2bR1?=
 =?us-ascii?Q?YIJkHtzPSYTOZR9upZwa2VD8nfi/VwSuZF8/E37WWcE2WNnDZongN8HPrE6q?=
 =?us-ascii?Q?GA1nSRqFvaGG8zd44BvN4hdRA0Wz0IJ0ATezkoUwUjqNueWx/GEskzCVtUTy?=
 =?us-ascii?Q?5EylJwtmBK9TgE0TvZ/hMxRTloohnrdjP41XsuubGOJa1rQiTpt2DReT2f25?=
 =?us-ascii?Q?nhkcr0PNDMQMyZZRxgyTRWkoU+CWzX0+BH6eKpgaJMe1wTUu1nbpB7EfwGqO?=
 =?us-ascii?Q?0dL3rUzUqG9FMPyFsy2ksWuY8RHilPnfyt5lLx461y+JzxiCbIzd/b92gsn4?=
 =?us-ascii?Q?w6IOCY5bXR78AVT7gXRUulrZf4EyMxDt5n97+1Hx3NSRbv9ABgv9tQx4jUsy?=
 =?us-ascii?Q?PEr4G/40YjN0l0m9X/t8Egn3E2bjgn5wz05JIUpn63P/FY/tDIdvNsCqbRze?=
 =?us-ascii?Q?Ax0fmo4gsCBbYTMnxrrFn277UTkB7ZC8Bsn/2JidG6Z5cshNpumjpyeIAeKo?=
 =?us-ascii?Q?xDdcvnSdZNdL6P1QjOa4eQW51up6LsF2a794/RNb+zAKiO0tZoHzpLIRHc9A?=
 =?us-ascii?Q?4AtMtWYZJCE6s+oLFHJCRq4iUF2AvSGqRY8ODx8bg5vQs0QilKFpKLr5SQVX?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee16758f-b249-4254-64a1-08dcfd4403cd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 02:46:14.5912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwjTKgBo5rwXlP1fz4xMwMudHWYUg0EPdeyhZKDPSukoYgvJK6Ltgz6WUwoaqYxZRhFXHFKvaL2zyrNzcKBhAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7800
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

On Mon, Nov 04, 2024 at 04:38:31PM -0800, Matthew Brost wrote:
> Upon failure all locks need to be dropped before returning to the user.
> 
> Fixes: 58480c1c912f ("drm/xe: Skip VMAs pin when requesting signal to the last XE_EXEC")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 6de12f91b865..756b492f13b0 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -224,6 +224,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  			fence = xe_sync_in_fence_get(syncs, num_syncs, q, vm);
>  			if (IS_ERR(fence)) {
>  				err = PTR_ERR(fence);
> +				xe_vm_unlock(vm);
>  				goto err_unlock_list;
>  			}
>  			for (i = 0; i < num_syncs; i++)
> -- 
> 2.34.1
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF9BFF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 15:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA15610E3C5;
	Mon,  4 May 2026 15:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJrtm4te";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D3510E3C5
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777909614; x=1809445614;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dxe54J4qLMe5IT6x2rIkZkX9lMCk2M/yKwvyHK3fIoE=;
 b=WJrtm4tehaUAHvGLUgmsSc6CooIlUDoSBbQbMNN+ZHU1LBIQb9uud9Gg
 vmaAbYa/+mqmh7eX+hhs7RoFZhW7umJDHVaxpsVP8gyx8aKV7bkOyqHqh
 vkOd+4KT3ymq5gtpegvdRCGuc4nPAfnSGGYalqPdaf6fZbg56nQmKXfgP
 AQ9EFkwUovZ4L4jHNN5IhD+sKupMz9vn7WglDJNE06arP0xZ2t6UAyXyC
 EI/vnnNRrrpcYHBPS+tgZpG7cNhxVbVxypeFvX0gqUUt4vJSZ8KELbBXN
 6xwLruB4QJlNxI0riyJkvEQQT3itNVZnpVDI0FVPaUzoE4RbjfGxq7Kj+ g==;
X-CSE-ConnectionGUID: BMhhNI+qTMa9MUMeq0zujQ==
X-CSE-MsgGUID: 9USbTxx4QYGwJGsXPO/VxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78473227"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="78473227"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 08:46:53 -0700
X-CSE-ConnectionGUID: tGTIS82KRj6YMjgYj9CeKA==
X-CSE-MsgGUID: l3HT5zU0TOGeH6dUyPKwAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="239843717"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 08:46:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 08:46:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 08:46:52 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 08:46:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=heXF8gNqnp8y7nA3UkHmUPzNbqqiM3C5HseM0WT0YomX39R8ZMbafcw+4uto/DskZQWosZXMQLsA01zsapVZ7k7mSEi0I5M8vdnkBvQsS/yyi7EUKCHvjsbn5n2gzzXgAsixTK1ttgABnJdagmg/YXG5EQ1nBNrNtdyx3bjkTkvugtRYgxjaRPnt2w+AjF+4miaCGkKTqoVj7FSFaTd+94/vzKkWi+ZmPSBZlDCiSGVYR1EOdA2ShDmuA9fVv8Sf8YSxYg8cjGHBRdlU3FuZrBu2wTI98NbGBtaSfZLIUPO/OHCGM/EG72723tm+xU131LnAHPf5uEaSwoHabfE0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VNBmoGydVR4OzEFiiUg5clhM6Nrvkm2CHGXKxkjAgE=;
 b=dLmn1B5oeoWpDx7AYC4FHe/VLVFStmWJEBxuwenb5LfoUUaf8XSN71XONitThlc1znxO/9Ii6n1EbuNUs5nDz790WAfLqElbbKp7Nre8Glh2z6psteJQsW1JGlMoY3Byb3poroLLwCgCFxmVP/yzH87POyXBP523+fbAf3TAy2HzlboecjrnYl+dsdfulm/guz5ejoScrNoGHqmRQFXgq11coPO2a6pQgdme5PvXKawhG/k21KUB6Mc8ix16a5IM+0ukAl2zObzhQ+hAnAA1sMO8JV+HIVkNO1WKrAAiRlUOXC4dHJqt0j1C2CDtkW2SA5f2J1bkClo283HkRTFfRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF7C7D8332C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 15:46:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 15:46:40 +0000
Date: Mon, 4 May 2026 08:46:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/guc: Exclude indirect ring state page from
 ADS engine state size
Message-ID: <afi/XpbQb3aej8Tl@gsse-cloud1.jf.intel.com>
References: <20260504094924.3760713-3-satyanarayana.k.v.p@intel.com>
 <20260504094924.3760713-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260504094924.3760713-4-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR05CA0094.namprd05.prod.outlook.com
 (2603:10b6:a03:334::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF7C7D8332C:EE_
X-MS-Office365-Filtering-Correlation-Id: cfea3a0b-d357-4bb7-995c-08dea9f45571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: p3LSSViJNbDUXN4OWtK8rP4SNHpFnZU60QNy8gzOmNXjIy4dcbFnE6S97PSgU98t0U1UCheTf40zxJxTA6D2+nJtnmyPCcl+QIAgSndimGPA1kHbtF8i8/PohnWiZ84owa5BfESbTg9uzvNqL6NzM1XuZZI8rSJ1KBvefB9cqMJTx+P5KG8jIkN2Na94PoiPCFuiTFfzLj0nZxKmqVgDsQ0/DPYEBj/ImVP1CHyCh8Tt1FwyCCgNDvOE87NpTfpPIz1pfyDCbPb+UAKGdQFmBzVBucsIBJY8lcDh9q6Q6QRaQILsLxxpVOZVWKXflFYkUTqrA19y4hZduPKddn6k1eJV9CwEwvLFjb7ImjWiPslK8PzEBrJUFlWtqyFmROoeD03/tGmY/OaVHKXljn4sU417n0BPykQ0TbK3mS8kWIOiK3noiVJt8gDSXZEASx+cIkRzPU5SeRI9fs3ThX8oBQosp4Dzhe2dRXTKog/DZOgbQAjvF7e26dygRma1raxAeyAWLR41bpNT/iLosrxxprb4ZOBG+zBFYi20bhLhIFik31x2vIOFBDDBPNmDtw9FyecM7dc1CJOiMPcl+OA1mxLoWSJM4agyrfPJ2rPAD8FonEZuPs6o1ioffs5AsxOxmnP2SXiSBZJFA9bhHzFLgAWoyZOh1rTO5wRWZ6z8OdhSzKnsftFyxFqL2n9bTon1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ugA+obUpnjIzR1heeyVuRNM7PoUAOq6Wpm1pmxpfqlxpWMZqUZQvJzpDsWFM?=
 =?us-ascii?Q?MWlIiThA9lTh4YtVSGDEcna3XuAPVTvXSOni85OdkwVSxuGg8RUdxp+cjmMx?=
 =?us-ascii?Q?iUFJZVg3wiNfLeWfmB3Kaz+IvUBdck1KaP4n6EnZEtPLVtEAnC5dszHmLFJa?=
 =?us-ascii?Q?5H1FuCjt6QK8BGg6DQaz2qYZxGm+frbjszMe+/lAfJs2kEZU4JBuh85xaqRY?=
 =?us-ascii?Q?2Exy5nmzOjGpZgi5CyvvN2NyF6JkTD6yoGCugT3F3K5pVP10xZ+ofJDdlwL3?=
 =?us-ascii?Q?y8AN5T2ONcBAOe0iKKn42p1c4sdIkM4AZL9MzmLvJw/6KFlfVJRCa/5BluZN?=
 =?us-ascii?Q?LRDlhEPnx9dfslsgss66/NdxS4brsFakW3/LC6dcLqLx/k6dCKo+H9M7+GzJ?=
 =?us-ascii?Q?N5Y+Or0WZ5wMfq12rlteX7v1HyVCRF75+MntQNniGE0NtqR0z6wH9PH5XG68?=
 =?us-ascii?Q?H/ZExEO1CsDBY5RFEV9i+64KCU21F+4SwtmYWRYIUuodgHqLar8jlDp6llvu?=
 =?us-ascii?Q?wD4Wn6T95g7O4VRkGqabxee1UzQvdDzBR+we8ALcwmRbjs6kebguE0U+ry+h?=
 =?us-ascii?Q?g/7WrTKvvnSsPhlWldd24yGkdm25SQmhi/h2q82ElXQoZtZw4Bc2FCA04NLi?=
 =?us-ascii?Q?VyXZFEvy/gbdHClEjWln8TyWuCFedxrAPQD5FYCSHBN1ktDaGw2WFEMTBZZ3?=
 =?us-ascii?Q?UswIx06MjSPfuv4qDXbzPAZwuN7dUsQmjYg1ejuce9xsA6U0QExgMidv4mhf?=
 =?us-ascii?Q?g/yLOq9YgG/8uP7SI7Gr6WlW0vmowAVjanceJa5hPmvP5Y5IhV34J2CtClQ2?=
 =?us-ascii?Q?3RlisnOd2JNpokvmKhC+dBaULy7t4yh/Mm1FMZ8GH/oGuR1nQsu++CWnWnqW?=
 =?us-ascii?Q?ZyUQcNwIaRkFEHkZ7opX1ss+HmWmsrxP0a5bjmlkA9yzmX30AcyBaN+Qr4aJ?=
 =?us-ascii?Q?pXmso7xOZ0F7DuIDSvXeXi3rkOBEC5i4FB7sewdGN3aKB35NGXloTD8TqRjz?=
 =?us-ascii?Q?q+zxLdSe9TFiyRpnSrqVEEsaNNK9rOkQRk5SUK1W+O45a2t8sK8bc9UvFsOx?=
 =?us-ascii?Q?tH8Fm/mmQGBAuNO8zKO2V6gD/lpyo6fhabwNrxSfDk1HcM/47Czvg4uAlY6N?=
 =?us-ascii?Q?fbTVSvN+e8PE56lVIl3a71nHwF9qqd9edpELnGWfKLmANuyz9k0o/W3oAiy9?=
 =?us-ascii?Q?Gwft0zxKuReTHTRsjPl6CXr3BzQ3qjaAu50mVMKjyriFti2VfJ8w4nNjHIu4?=
 =?us-ascii?Q?02GpI2UAwiNZiu8JBkW+d2zyV1LuAfjjJj+jm0XO22zUF39kRMmCt5T1jT0d?=
 =?us-ascii?Q?z+XdxzXGwiuM4K0sQ1cvIaCNyuz0oCbiVL1g+WjCst/nhqm7TrADTeiuIjnI?=
 =?us-ascii?Q?zl6A8nzUkYBrhA7zDT++rgXa7DqAukQDOcwPqk//qFO2FfdZzIXTqKz/QGAs?=
 =?us-ascii?Q?gqNyEsLVwnkdv6MXdOzoq1PCAQN1KBEToVg3b4XPrPM446GXbjgQ/6GYWxiW?=
 =?us-ascii?Q?aSwkRc5Pq46sahuD/2tvf2zcbD7pJRcGe5ngI9jzO66Y2bYF1aZmiV78Clp2?=
 =?us-ascii?Q?Zro1clIIc52np3VLn3VfZ5/oDn548VGySw1x02bvHbdVM8YxYUpMy/OwzSnj?=
 =?us-ascii?Q?P+4drzUXFirCjhwIii5ER+nW668uPJHQlxFFWrhMbM98cWr1PQSIE9nqpRC7?=
 =?us-ascii?Q?xnK2iVjRrpLjkTLxrNx4qYJIJMG/fK+5ZpLceQp20v6Tm+aZ34gO5/GLjoq4?=
 =?us-ascii?Q?o4qVbwomZgRJITHw0oLzbiThtsqNmWQ=3D?=
X-Exchange-RoutingPolicyChecked: Yg0BIa6/BPZoLzJt61Wx/MRlkw5z2h26697izDsjI8fLsGjznkt0OQlelYKFOaOOciz1G4kGRb+QKsSPOiEoBCoSyIwhZmV7KH37mNT9WYBNVpks7ph1T5HbJGpjshjB7rPNFDLVnrewqQgYrKxbHwQHnl8/xu4OmjVUiDFQ1YjzP79iGjFBYDta4cpWODg7j17CYacbM0kfjlw8id9Sr2nnK2IBmh7KWYgdtMSjovYqWYRVoP/Nje0I4bbLfRjOUfXcs5TUVmOP0XytsLLr2HkbExsqQhwzMKF9J3OgsjPzQZw5BIZeJqS0CU5T1eQ3GieYtbw99hM8iSbo76Is9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: cfea3a0b-d357-4bb7-995c-08dea9f45571
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 15:46:40.6071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5svJUUyPHmfZOeEKk2HECLsw88zGUjMuFPyFkwdSAbuTEl07qaO88FpnJgka3D8ebqpQlj5EX7zJWi5q0uZug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7C7D8332C
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

On Mon, May 04, 2026 at 09:49:26AM +0000, Satyanarayana K V P wrote:
> The engine state size reported to GuC via ADS should only include the
> engine state portion and should not include the indirect ring state page
> that comes after it in the context image. The GuC uses this size to
> overwrite the engine state in the LRC on watchdog resets and we don't
> want it to overwrite the indirect ring state as well.
> 

I actually noticed this well over a year ago when looking at a indirect
ring state problem.

> Fixes: d6219e1cd5e3 ("drm/xe: Add Indirect Ring State support")
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

This looks right to me, so:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

But also since Daniele reviewed v1, ensure he doesn't have any other
comments before merging this.

Matt

> ---
> V1 -> V2:
> - Replaced xe_lrc_skip_size() with xe_lrc_engine_state_size().
> - Updated commit message (Daniel).
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c |  5 +----
>  drivers/gpu/drm/xe/xe_lrc.c     | 11 +++++++++--
>  drivers/gpu/drm/xe/xe_lrc.h     |  2 +-
>  3 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index ce651da6f318..b9bca6084a4f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -515,12 +515,9 @@ static void guc_golden_lrc_init(struct xe_guc_ads *ads)
>  		 * that starts after the execlists LRC registers. This is
>  		 * required to allow the GuC to restore just the engine state
>  		 * when a watchdog reset occurs.
> -		 * We calculate the engine state size by removing the size of
> -		 * what comes before it in the context image (which is identical
> -		 * on all engines).
>  		 */
>  		ads_blob_write(ads, ads.eng_state_size[guc_class],
> -			       real_size - xe_lrc_skip_size(xe));
> +			       xe_lrc_engine_state_size(gt, class));
>  		ads_blob_write(ads, ads.golden_context_lrca[guc_class],
>  			       addr_ggtt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 9db914584347..fdfe2ed5f683 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -727,9 +727,16 @@ size_t xe_lrc_reg_size(struct xe_device *xe)
>  		return 80 * sizeof(u32);
>  }
>  
> -size_t xe_lrc_skip_size(struct xe_device *xe)
> +/**
> + * xe_lrc_engine_state_size() - Get size of the engine state within LRC
> + * @gt: the &xe_gt struct instance
> + * @class: Hardware engine class
> + *
> + * Returns: Size of the engine state
> + */
> +size_t xe_lrc_engine_state_size(struct xe_gt *gt, enum xe_engine_class class)
>  {
> -	return LRC_PPHWSP_SIZE + xe_lrc_reg_size(xe);
> +	return xe_gt_lrc_hang_replay_size(gt, class) - xe_lrc_reg_size(gt_to_xe(gt));
>  }
>  
>  static inline u32 __xe_lrc_seqno_offset(struct xe_lrc *lrc)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index e7c975f9e2d9..5440663183f6 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -130,7 +130,7 @@ u32 xe_lrc_parallel_ggtt_addr(struct xe_lrc *lrc);
>  struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc);
>  
>  size_t xe_lrc_reg_size(struct xe_device *xe);
> -size_t xe_lrc_skip_size(struct xe_device *xe);
> +size_t xe_lrc_engine_state_size(struct xe_gt *gt, enum xe_engine_class class);
>  
>  void xe_lrc_dump_default(struct drm_printer *p,
>  			 struct xe_gt *gt,
> -- 
> 2.43.0
> 

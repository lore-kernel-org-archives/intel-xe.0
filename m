Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F37C46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 21:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3091110E2D5;
	Fri, 29 Dec 2023 21:09:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9E110E2D5
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 21:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703884156; x=1735420156;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pBtWU2E0Hq/CiFbFq9arMv3cD0LcGm2mhpLSq9e0Emg=;
 b=Zfk7ypT4iaSwD5I4/aJsVh0/vKLjQPQIyXgRwxHw5EeDZkDZlP1bwCCb
 lxb0Fw/9Wm0CwcgEqSar5MUD65Fa7oMUKCPemw1eDZqP/IpNufC/xP199
 Ke0OWTUsuCTPdCS3C0YTacMEGQ5mBRCPGIcIX8249I4nlotYxYoceGRxl
 YO/elvrWKbQPO6I1Vu+s+Qy8Nhv9ZLfhBX00mNMjvPt/M7Ia+vOI9qNZq
 8T3uheqH3TMmiUnmSm3uTdevtclqZk77qz1YA60sDR+ID4E6rAnUsld2G
 ZxKyfnj2QX9TxftxYz9xahubfDi8vYDLnJreJzKu0OtX/RssfOUP5/ClW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="396410360"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="396410360"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 13:09:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="13366749"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Dec 2023 13:09:16 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Dec 2023 13:09:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Dec 2023 13:09:15 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Dec 2023 13:09:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzD9ZI0PDtU9IFPakLk60fqBJ+t6I8vv34cmeB6zWnXz6xKfe8CcCRQd/3tRsSMeIxRBxPisRGdj/qW0w88rbExK9mkZHvD7doaJgfCatzGjPHk5VVVmyRl0SR11knmsTmv7hKxjWh43sQWVy+qgyRq+Fle/Klwf7wzrxEUgd+bG+kXEXr/rRUUnOc2Gzm+w6W1nv3mFg6cHbAR7FRny4pk33bFVMjEPtwud/abBVXRMpIgPDoTbhbMOqJhhGd7SnMaJNs37zLZVJ65wPfF7BGCwq302aiEbxo2G4SIDASkm6Ebvi9dRLE9Vx2vyIN+pGzmVnH0/C8qTSMTRcrNgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQ3gYjNbIyKXGuUgFg/O/kibbgmY+70lCV0Z2EtRZbA=;
 b=VpfshkQngfryv7zEFVMifMsow557KTbFnaHfmETHP/68/Xf7woC8tXuvcaiYrCfeNzkoZnFGXTOUuaLrNxt75aIL0AZXYfjEm6i6m2sUKMdvVQ7hfy06s2sCiXI4n/dmTUr/+DAgB01+RH0y0F6N3SWdwtU73RXDcOpA4xaUITwiTTUIRZQ7cbHq291qtXpdCDUvWHiuMGaXjcwSvcHB/fUKXhkOP4itBmbl6SQYIwT5slIMOdR7GjNQXT43zWi8nfpD4wMbODjeh4zs8Qb6Gdj8K88YF0ZgLmzsWPZeiZ3QSPCxMGD79sH8pRhGoqnN38vQKSBjTXZ7F4heHoBrVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA2PR11MB5179.namprd11.prod.outlook.com (2603:10b6:806:112::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.21; Fri, 29 Dec
 2023 21:09:12 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626%2]) with mapi id 15.20.7135.019; Fri, 29 Dec 2023
 21:09:12 +0000
Date: Fri, 29 Dec 2023 22:09:10 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 05/10] drm/xe/guc: Update few GuC CTB ABI definitions
Message-ID: <20231229210910.i7rx7oo42tamaidw@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
 <20231227235838.212-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227235838.212-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA2PR11MB5179:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2fe424-546f-48c7-0fec-08dc08b26850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kny9jVrTYSNt6Q757A7cLHn+krjz02qobva7B7xEY7sC/0CNWbN0Jz/W1FD76Ja0S5+EN3iF9KI0t+W0IQEN8M1USJ/odkMiaYSu6t3CYuF6NfnQi2jwDCsTsydZ+rElsVi3pOa3QWn4R/whHECzPdmG8at6h7Pup3nmzlidxQSyfpIjhJR8GwWO+cSpXtYBNdm+I+fzoY/VC0fvUdNYIjCnUNFScZ+w8d9i2LTmq8kIx560mLm5LkV5s8+kJaEJ5XMY+Yc2sZdFybYphFkwcOv6wS6SowdvE1tFyj+sABZdk+/yq1y/2fTVgQHb1RA2j6aWeQ6FnuQfIE2nupwCOLTMStw+1OIaoPaSIq3p7kaZl8Qh3cOWoQ6HxOBPDwfEVZqG52fWTaCeBZ+9pWCV9up8AXqbOSMZR1BZYv8fxjLwezaVKyCChfA7fV2w6Rtb2BwmFIK3qtL2uf7rw6zFjZsN0uQHZFLcCcM00L/5Ye+rF8nilV1PMAIDpW8hsr/9/wn/b/Lz9rC4IMTPZ6HwCg671kVYYoodHnXx5IBGT8eVwYTxBOlUyG0am9dN54rz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(396003)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(36756003)(1076003)(66476007)(66946007)(66556008)(6512007)(6506007)(86362001)(83380400001)(6862004)(82960400001)(38100700002)(6486002)(478600001)(2616005)(41300700001)(15650500001)(26005)(2906002)(37006003)(5660300002)(4326008)(6636002)(8936002)(66574015)(316002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHJ6UlY2dVdaeDlvcHdYQXlMVDVtUThSYjlFczE1aHVsSHgwZlkrb2FGV2lW?=
 =?utf-8?B?TmFEYXNlM2c5dE9ROHlxTE51ajV0bzhHbElCVFdZcnkyb1pud2JzVXh3RVVZ?=
 =?utf-8?B?VXQ5RlBKem5PT054WXJtendpVWkrdDBvWStaaUE1S3g2a3BpTm02SnZOb1dn?=
 =?utf-8?B?d3J5NDZjd2NhcmlpOWdoQkR2U0J3TnFLOVpVc1VWRnBuVExNUGxUMUkvR0l2?=
 =?utf-8?B?TTJRQVFXdEQzVU5Ca2xIU0NTekt6Q0l6d1p2L2J2NkE4ckE0SFVmQXdZZmph?=
 =?utf-8?B?WWE3WTZEVEViRmdNdjRYMS9YeHpoamd0UytERlF0Q2Z6Z0p0M0xZNHd0WThs?=
 =?utf-8?B?WGd6eWppWHhBZ2xiYUhQMmNYazBlREMxV2paTWxrcDY4RGFuVTZKYlJtMHhI?=
 =?utf-8?B?bmlBQXZhcysxUElaeVhDdElEVGM3R0l5SnBFcFR6TGc3V0RXY1NGZ3RKWUZY?=
 =?utf-8?B?VU1VWVhoM3g2MTBwNDFJV0wwS2xwNmFvdzFUNnRzZ3pIQ09oM21iVDNWZVEr?=
 =?utf-8?B?V21PRWhlYkZRV1ByZ3pSL3JGS0h5dk1vTUF6V1l6L0lVWDlBcGJTTjFBZ2xi?=
 =?utf-8?B?YjRvRENWdmJuNDhhdXhEZVlRZExsc1VVRDZKcTZ0Mm92elJhcnZJOEhQWlZa?=
 =?utf-8?B?U2Roc1BNdmh6ZHdjSEZ6amZpak1uZXBNdmRycmdiUjQ3WjF0UmxiMjJxanEz?=
 =?utf-8?B?am00Um9MZHBMWndmU0F5VlpnSzc0YVQ2TkIyY1NHNEhtallxbTZXbVEycTFR?=
 =?utf-8?B?ZjB5cnVaWXVkaDNGZVVLYWFZSEEzOFdZd3ZYakVZczdBTjJ1a2pxdDFZUzFW?=
 =?utf-8?B?UzZobDhCcjhGRVVPMkY4RmhWd2dmQ2hVVDIwWGkwdHgzWTI5MVIyR0lGbFJh?=
 =?utf-8?B?WHhYTHRBdzFBVHRXbkhOUTNDMk5md1pQUWw2dFJkQXlLSlpSWDBKOWpDV2d4?=
 =?utf-8?B?M2hzcWp6dDdrcEZFSXQzbnhOUWYvd2hXRHBKRGZNb1pHSjJzZTRCaVhXaUp0?=
 =?utf-8?B?OTY3di9zaVltSmdiVldVcElwUmtDUVR5U1FaaGJOK0NxYkprL0JmRU1NUHgz?=
 =?utf-8?B?R0Q2L2JOeExDT2F4RkFaUFhwdzBJekdmSEk5MUZMa253NU5RT041TEJCYmpF?=
 =?utf-8?B?cy9FanRXdjFlVlpkRnQvZU9Vakpkbk5jOWtFY0dLNStSQ0ZyOGU1VWhjcm5y?=
 =?utf-8?B?c2ptY2JvNVR3bk9EalcwYlhTYkRQUkVxQm5odjlMb0UxNGtZM20yY1pVN2U3?=
 =?utf-8?B?V3VnQmJzVzZVU1RXNENGeUlpdkF4aUwwaExFcXNBRUNlV0F5RlpOZXF3a3Br?=
 =?utf-8?B?aEM5UCtScWZLeGI5ZzRvL3dmTnNQZFBoWk5BemJ2UWQvdkcwYUxveXgzeEVZ?=
 =?utf-8?B?a1B1bnlWdDljN2EwTTVrbVl3ZTdEcytFaWw0cVdRM1k2NlVrcmpjNUxBSjJI?=
 =?utf-8?B?ZE82YWprTnJhakxKQ042NTNldFN2THpFbVBvdzlNbWVtYlpobXZmdlh2RUFz?=
 =?utf-8?B?dTJTbWNYb0xEb25uemQrMTNUWUp0MVRRcCtHZXk5VnhOM1ltV0tmYjE0d0lG?=
 =?utf-8?B?SHdLVFMwN0tTTjlCaFJaUGlxV0xOOTN4RjdEMmFJRlVQSkJFL0NPOTREZjJY?=
 =?utf-8?B?akJPM2pQc0MrZTA3cnd5WS91aWN5ZkFSNU8ydjhYSHVMY3l6eFRpVWs3aFBK?=
 =?utf-8?B?NUdTVWZ4dkJxbzI2QjZLRFRZT1NCNEI3cmVrL1dROGkyWkE1NlZweVU1Wmlo?=
 =?utf-8?B?R3pHNzJ3SWJDUkFxYm5EVjU2UGtwbTVJNVNIWVRXOWJVdDhHS3V0OEo4UGF0?=
 =?utf-8?B?YlhSWmFKYUxaVmxaU2Era05OVHU3eXZwcjNCWm91eVQ2NmdOdzd6RHZLaWpS?=
 =?utf-8?B?c2I3K0VOM0RLNGNMYnJRVGJqT1FHbVBzWHJTcmp0ZXlyL3pSMnV1alhYdEps?=
 =?utf-8?B?V29lVXF6dmJKb0N0S2tjWGFvdXI5RklrOWUxa1hRRkt1TytsVkZ5NmFRdUlT?=
 =?utf-8?B?OTRyMHRPMW44NllLTnFBTHp3NVUzRVhYZmtGNGVVNnpDa2ZOME16ekNmN0xQ?=
 =?utf-8?B?VVBzenhmb2tObGZUMU02UHBhcGRrNExWcFJ5OUZOR0JKZDY4UGdlZmdtSm41?=
 =?utf-8?B?SWZjQWNJS0p4QnF3Slp4MVdJYTNHYS8rVGxickpRTkFwbkJNY3VIL0F0NktI?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2fe424-546f-48c7-0fec-08dc08b26850
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2023 21:09:12.8033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46J7sjhhb0a9a4GUFC001YCYRSP0k8eTF30kVEj+q5MdYRMFfezNECCrvJpEvKM2QxVTNUvI1EAfdKDG4vTiOAQd4eOpD0Uc0BC8vpEt/Po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5179
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2023-gru-28 00:58:33 +0100]:
> In upcoming new GuC ABI definitions we will want to refer to max
> number of dwords that could fit into CTB HXG message. Add explicit
> definition named as GUC_CTB_MAX_DWORDS and start using it.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> ---
>  drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> index 3b83f907ece4..4aaed1cb4e12 100644
> --- a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
> @@ -81,12 +81,13 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
>  
>  #define GUC_CTB_HDR_LEN				1u
>  #define GUC_CTB_MSG_MIN_LEN			GUC_CTB_HDR_LEN
> -#define GUC_CTB_MSG_MAX_LEN			256u
> +#define GUC_CTB_MSG_MAX_LEN			(GUC_CTB_MSG_MIN_LEN + GUC_CTB_MAX_DWORDS)
>  #define GUC_CTB_MSG_0_FENCE			(0xffff << 16)
>  #define GUC_CTB_MSG_0_FORMAT			(0xf << 12)
>  #define   GUC_CTB_FORMAT_HXG			0u
>  #define GUC_CTB_MSG_0_RESERVED			(0xf << 8)
>  #define GUC_CTB_MSG_0_NUM_DWORDS		(0xff << 0)
> +#define   GUC_CTB_MAX_DWORDS			255
>  
>  /**
>   * DOC: CTB HXG Message
> -- 
> 2.25.1
> 

-- 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC1EEB64D9
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jul 2023 20:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED1B10E04E;
	Fri,  7 Jul 2023 20:06:48 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D7510E04E
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jul 2023 20:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688760406; x=1720296406;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WqqNpMtdapVdLqz34E+t9qVLC+/tjbFt0jiK6pE1pYE=;
 b=Phs4Y+j0YtS1E00lnGBnHQkUF9EPDypmxU5IURrRCG+DffvGZU/7XM4d
 7j1zu2geUiTyw7cnpEMIwX4i6Txj2l1dy52cyzP9icmE9Ui+/NRJBOkFt
 B3FFE6E0u+cvHROyeu+a+HkK0Ld1VfsGk8+h4K03dIMJS76JPogNrtYyV
 qbLDHuAPg2pLckqkhZyKP1rKUihIZoP2FvNmwtcdIiFUvQ2jkknvAOsn4
 s3nwkIwe6bI6KUwogfS+qNwMbJpbrZFNMVo4cJTpzwIYdmSA9pxUl0PIa
 BK1bR5nyBArxUxjk4rN1EjA1ibB9+0R8H1bYgwYB23eOJE1UDpp4rZsmQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="348769386"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="348769386"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 13:06:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="790092626"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="790092626"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 07 Jul 2023 13:06:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 13:06:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 7 Jul 2023 13:06:44 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 7 Jul 2023 13:06:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJQve/rrDtlrGPhHvd18u6rS1APJWKoHMPIksrGRpE6qVnftJ1s428hytdRJ5DJxaFXGzQNWm0eTa64LMWVGsZDQG499j6tvv/91YQEI6NIKElQw4rENktTEB2HcPjiZUaymuHS1lU3USA2+7AfQW16hwT1eu2nh+wA8qZKZkcm0axdQgsoG0C3wj+sh0zTGsukDJq11OYIU2pdf/nYR5CwWXYmbHwbkdfWLhB5w270LYSNZhRwbIRg93Q6HdKVg08OiEwz2YdEAkHhqqCKz/Z8HH5Uk8JGGctJ6O6hDg3wiKE2WHRtOfEbc3HnUM7PNNwPxnRAImfnP8GfNJvSw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+mQKR5ZHz8QzAY9GedzmbdJzM2b1ZKNE0letyTvSjU=;
 b=ahNavxgTeuTN3XFepsGVua5VFYTu0bf5vqI+fkXvxC1EG36MdzmRl7xdIuoZRRLQaTkDoSuXbYzRSZ7X9H15VHLLHYTjZ6pHJXgF+fS3frRPBtRszpyDwDBR+U1iFhiX7M198fHkNsDwwnOKwp2zKQI3Fe8w6MITVKyontRNY9TdHExCdC0b2vvy1OLHn16z+iAwj4FL4C9Ljmbk1nK20LGdALr6bBjfhpZV2Ig5sk81hcHa/hu4LwT9qF9fiQpNgsVu7aAylI2IQpIbIWJpKzPGni9pHqebId1xcJ2iJwmSbRPbQz+3kWU/gJlIVsPmLcy2NU/0zfd8fcKQKX95Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 20:06:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.019; Fri, 7 Jul 2023
 20:06:42 +0000
Date: Fri, 7 Jul 2023 20:05:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZKhwJqDP9ZcQtjXA@DUT025-TGLU.fm.intel.com>
References: <20230707171039.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230707171039.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cad00ad-58a3-47ea-9751-08db7f25ae4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bhmri0Yj9sLotnMd60MEtlaZOeuv8WdDjkWLjK1oQD7kO4uAzewauSeK+KZcD8juLCyhEwyY0EtPk6k2d1jReVixSAH7UFxM4jk+MtSZduuXTYu7c+3zfo9lBsp3GQd9/IAW1inNY3An2H/GG+xDlThzYflvWJAEOptqvB3qJEefG912OTDtkNMC3gkmMiovq2U5hniN65vvNXI+CfjEDVjQt06eVmY/w6aaz5ht6ySawLZMtUl+UR5viJuBfpJMG3AT0H75Uwkr6L8avKLgJqh7CGCtW86rrxNA7UjmOKld1ExBmdAaZ7Vqfu/vpkR+gUSzODTrM+vL97Xjy5d80/3f84O8A5HKtPpTIPJ1gGM5whu6/o5l3Koz1snFWTBfOE1iOhxQQ+Q0iQ6PBPzO8TPVZ0XjmVNCOuv8zwKEQH4dswKNdHNii9K26k7DXAGbXXb/arG7MeeqKOtiX6oKXmjAq5pbkVA7vhQMDu1UxV/N7DidjOaz4T+FRJ8E1J1at2CFanH0mzWChSH10mONULxjUXwBOeQRJgCkYqI4pQ2/Rvzzp0uB4Pg41x7GY1wb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199021)(478600001)(82960400001)(6486002)(186003)(66476007)(6512007)(6506007)(26005)(86362001)(6666004)(316002)(83380400001)(38100700002)(4326008)(66556008)(66946007)(5660300002)(8676002)(8936002)(44832011)(6862004)(6636002)(41300700001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CPoUKcgIe3fgEAI8z/5J1aMQljonoA3QAJqF3mmXs62V50BSsAaVSUfqTy?=
 =?iso-8859-1?Q?oQH/3TVr75ZwiLFR8pPXb17rvbbnB5CRlkjK5iLcv7TYCXzSv9k4InsW8P?=
 =?iso-8859-1?Q?yGamtxcWNUr7/Wygs7FRKJQ6w7u9k6mzrhdQkkKfHtc2LmWCAHixxLi+uU?=
 =?iso-8859-1?Q?6EisQSp9xeQ03bVMZvDSChdqgSUdHzKrGRM29/vDWRPZMTAeGLIr5O7Oxf?=
 =?iso-8859-1?Q?PbzaL5vnFGl+xGvP8hcrDN/eCJI0qG48BZupZNLAtcAFNHakSCYCxBK4W8?=
 =?iso-8859-1?Q?XQHG34FbzQuC8+E+Qk+jUtpLKEAN4PLC65jUFSP0DlDl+iplICi5uTXUmQ?=
 =?iso-8859-1?Q?G+FhFfekA59xoxktxyHHMh73AbWBqOpzh1yn0Hltx5J5vt8blRnISesw9F?=
 =?iso-8859-1?Q?ZCmOZDnMudk7Tpb7socR/v2whoDTnxXHn+92fGVVYDPUMTknZeyoCGFhkW?=
 =?iso-8859-1?Q?/j6o6o9kVyiMwpgP5IHPbUiXZffk5etm8NxnhiJtfC6+7MtFugLPQUI2Rs?=
 =?iso-8859-1?Q?mBZ1jI4W90WY9O0RDdt2j6EysoWxL5RdEGFnVqdmv0Ir1P3oR42KT5qd3/?=
 =?iso-8859-1?Q?kYjgo/wYeLuoQBV1n/yV4P6DNoRcIvHmKiHcunNJieW5F20e+dr9IYU2R7?=
 =?iso-8859-1?Q?m0kvJI9HRtnx0NCEm3vCS+GJx4zNGruCPLYt1VJtBvkI7BIdT1is9ps707?=
 =?iso-8859-1?Q?mUWnJlZpV6zkFg3QU8KSWw5AwJLhSTxNEGsgnEkGCqrFVY+zn6dndiQjgf?=
 =?iso-8859-1?Q?AFw4Vl/QxMQ7DX3b9+hfJD+dk6xJ5N9+N+D1P534KMtBmbMgUfAP4VOj/d?=
 =?iso-8859-1?Q?IwCk80OGGlKjKDK/32Cla9q05hjfepe+sNqmXbxj2HEoG4CbD/0+yl5GbI?=
 =?iso-8859-1?Q?bryqYA/jwOzwjzTVMaGIwPOwXu6dvNvD+VtoWIwUZUaMZZXjO+ElCzTQON?=
 =?iso-8859-1?Q?mfbqlLwuUzdAwOdXcTQrY44VteYLw2vMaJD2Mu/30bhpjJx/TlTpyKOAGP?=
 =?iso-8859-1?Q?GXZ+QGXI3McMvJ8nczLtzXXPDzkacu4abbfp3wrBVenhgzP3dyvznXgBrq?=
 =?iso-8859-1?Q?p6iYE0FBGMSmnBfCx4nQizH3jainzBwZuLkXjytRMIvkY/J8fOpsyfNXpU?=
 =?iso-8859-1?Q?dMvYISGoTgOqAnNOl9qxecJEfadJANRwCb6o6mp9OtKe5RXNmL18Ngfm05?=
 =?iso-8859-1?Q?y2c2EpvFkKRXGGNTLP4Fihe8FKXgEjyY/Q3WhFp+O2Tt74gUOPthy7OwGb?=
 =?iso-8859-1?Q?+CREgMJQNP6fMHfQBBHyba7qOXbywwSGYNj+Sq6UPl+FxAH67JOM2eH7rl?=
 =?iso-8859-1?Q?Ts+FsMiih/C0glHdMjA648JpjELYLBc5/nJ3/V3se76y+Nwix+irhfTnzr?=
 =?iso-8859-1?Q?NjaZYDAeQVLXY/q2u8BkFJ1E3B1rB7My+T3ZenOvqDiiiEnzBSueARuDhd?=
 =?iso-8859-1?Q?b0HSkLZu/QbNBvsRm1QGES5kmj5BLXuyySzx/xTYPrJdmHUcth2Oy/MAf9?=
 =?iso-8859-1?Q?QtAP9h05nVR6JcpgpZUbkhQjdk6bdjvFT4Ehzfgg2jhUAp8b1TK92CBp4I?=
 =?iso-8859-1?Q?NMgImJYSTdeHg2X+cT+pIwmc1dgU0+a9alO8JbtOfTKQyuLVecq6Q5kcv3?=
 =?iso-8859-1?Q?dmpQD1kzKOJfotgxUeClEeZcDoYq5ggEE9jHGU1VSLzotJLFds5ernag?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cad00ad-58a3-47ea-9751-08db7f25ae4c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 20:06:41.9689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tc3opswFIVXFuYoxXzaet0E7JhYdCETF1amPSBBxF7xDmteEpn3q/fxgL6zPqszwCcIX2UIhyT0pI22E5QnIFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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

On Fri, Jul 07, 2023 at 05:10:39PM +0000, Francois Dugast wrote:
> Fix the SPDX license string so that it can be picked by tools.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_trace.c | 2 +-
>  drivers/gpu/drm/xe/xe_trace.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_trace.c b/drivers/gpu/drm/xe/xe_trace.c
> index 1026fb37f75b..2570c0b859c4 100644
> --- a/drivers/gpu/drm/xe/xe_trace.c
> +++ b/drivers/gpu/drm/xe/xe_trace.c
> @@ -1,4 +1,4 @@
> -// SPDX-Liense-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright © 2022 Intel Corporation
>   */
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 02861c26e145..7fdbcec8c781 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -1,4 +1,4 @@
> -/* SPDX-Liense-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Copyright © 2022 Intel Corporation
>   */
> -- 
> 2.34.1
> 

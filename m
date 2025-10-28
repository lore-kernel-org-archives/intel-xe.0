Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB1ACCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 21:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9770E10E1DA;
	Tue, 28 Oct 2025 21:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5Pq8ZbU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421DB10E1DA
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 21:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761685216; x=1793221216;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=awr8OlNL99uBuKgY/pOAatIFsPq7Jh+sHT2GajXRlW8=;
 b=P5Pq8ZbUBP8xgcntXQkf3PcvdDoGKoqXBIcG2yi/6ZO9q2pbS6M/PCCn
 Vl3K2n+t6MNOa4oOomuU5q3phHqef4yQgdpRLtUYMDfmNaBOleqxnSqF4
 WP8s22BPZxXmvfxP5fMI11kz1rD0prJisWBKgX7UtjCn/3U4PI9dRujdU
 SMtE1QXhnoVldHu38JtqLs1O5BWoFr/qKEYz/p64AWKIOUV0E7mFlaWvN
 Cb3YDbKYF6VJIDqehMmSJZNBklyDsSRDEo0llShwsK4FMFE2bBLE3p+4d
 pvV2oRv+M7Wvzvj3OrAKU3h78hh9sYhIyQ1zhQxlhy+I6rRNVQM2q02qz g==;
X-CSE-ConnectionGUID: lj1SymyiTKWiBApa2bopYw==
X-CSE-MsgGUID: E0YEy9R+SCSd9dsCAd0FVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63684421"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="63684421"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 14:00:10 -0700
X-CSE-ConnectionGUID: 23OndaaXRQyzEHjhBjfCiA==
X-CSE-MsgGUID: 26qurkC+TpamidnjnDn+WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="216115923"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 14:00:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 14:00:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 14:00:09 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 14:00:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1yekGbX8bc9mgb2jvNgZWu7Hm/i5FfWuv4Y1K/Ga7Iav47jF9ZvBuoblWOk5xkVTS2XvDH3V60m30kH+SyJt/eKKBCEM6VRx30s2Nb2vio2QOXGZ9gSS5nP3gxXiqbBt8dmTF2NjXkyygymLO/7xxaWafmDl6SWFJnqpTWIcWFMHVhYWzDOMLCeFrbFX19hFlv35B+5RCYLmsXTwqZRxc0MNQP8mZI6n9MyGPFmKnUgfyWewGvsrXZIOewVt7CXOW/8lNPrZLmCMiJVVr5CVuteTmcr30PSrIQFvbHnEQQZAjEq/AXTeVw6FH0/LQ+uj8uCbs26jlBNQvt75i1EqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFERpsm0nsByFheOnoaNQ01fFHXAbjoEwzk/SUGkSLw=;
 b=T6atrdsss1fBuOyCSaO1wWBVnhnWscPpMZRxQDcqbSUCI+Ynz9g2nrl9fCY1i6gWcXs3trgOhbGF73wZHNSF2tx6SesqQuFGNFK8RMjNz/HCn1Z76dX5ibcrpqtsOHNAbKO580Ky7mtrKzhmchYRR/53fXzorhLH5ycehPVSPHsrT99EgshT6YnrAwLx1Ko4tO2VaPLIVHECxnTnNq7ADyY30cWiHdtXkXkWAw2O7JHVgVtR8Wlba/JKvriXRGJgSjiue2KO0gCX1omdv8eShKO5gl48jPFb8foLo8Rj2JIor12k5ChFvjL/18Vh7x1JIYhmzkUL1lTaPzokySEgkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 21:00:01 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 21:00:01 +0000
Date: Tue, 28 Oct 2025 13:59:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tapani =?iso-8859-1?Q?P=E4lli?= <tapani.palli@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tilak.tirumalesh.tangudu@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe3: Apply wa_14024997852
Message-ID: <20251028205958.GE5409@mdroper-desk1.amr.corp.intel.com>
References: <20251024235248.GN1207432@mdroper-desk1.amr.corp.intel.com>
 <20251026111538.10143-1-tapani.palli@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251026111538.10143-1-tapani.palli@intel.com>
X-ClientProxiedBy: BY3PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:217::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a9ea07-4b5b-4bdb-ef54-08de1664f5ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?905BTBtxuWshvXorQl5CCzNWUwTCijQTeSYUWOeO7H8IAeMrYWVoLaOVWY?=
 =?iso-8859-1?Q?qBKnlbQMF7wFuj6ptuFQxJ5AnxEnNU61x8zKcD8QzN1ooAcl4GBRsU6Xil?=
 =?iso-8859-1?Q?lluUtoYf8kBstIwcWTiDKKVSbiB8fF9g6HFiKYvUsNNbyFgpjDHvx6DGr5?=
 =?iso-8859-1?Q?ChBuDkeZN9twvQvL8Q0dKjh1zt8fp6Mk1x0VciNncD75BcSgRQ8AfIc0du?=
 =?iso-8859-1?Q?RUO4xY17tENeHAoIw4Rey0ZjDCYjz6igtBFVCcRcPghN0FMrhaPhum+68K?=
 =?iso-8859-1?Q?RDJ183IU+TPM9wBdj1MeQr31CKES90DsHjFWb06lm18WawXX57d1pbmqfl?=
 =?iso-8859-1?Q?iHa4mD5U40Ncj3Azkcyc0+rwJafM9v8u7tJUTr1zeGfHB6uhpKqaZAmXpE?=
 =?iso-8859-1?Q?tYOKrW+5CNjfIRmFVrBKJkwwTaUIGDmA1rzj6bOtc2cWvhsj/L7x8lQh+E?=
 =?iso-8859-1?Q?aZJICepxavM126+gFCqL8ISKwIQ/KmMtGW7DcjlMuoz+MyXcp7N1I3wHKQ?=
 =?iso-8859-1?Q?aQ6S6GiTNaisKl5I8Ub0sBTMmLEsnBqrok+UMkbeShYJ1piBcOtbMoTrsX?=
 =?iso-8859-1?Q?wbaNNfd8OQSBk4VfUYaVFuN0bRHcDCAPZiPIu89c+gXdmREAcHrUbhlKMC?=
 =?iso-8859-1?Q?WGyfAcwQ13zLafJMTKZuUUJpr79U+dB1N9aZAP9U7tkAixLtQ+Bhnp7OcY?=
 =?iso-8859-1?Q?AVDHbD2isrwqJVfduafnUANGlwmRlOVTS18V7/190hipNcgbxyayRNfygA?=
 =?iso-8859-1?Q?WjWNUC4GYKnljFLhX0JQiiErd1D2bdJCylVx93XAo3UWISw1ll44/nBlXu?=
 =?iso-8859-1?Q?bntynHescIVzdQBYjZuuF05BW/8HGAYPvQad9OkUusFPPjN44xB9UOT8GE?=
 =?iso-8859-1?Q?psJ8PXdQSpUeSvfVwaKQQBIn3TKmmmowlq8y61alK0kh6ZMxGAh6zyA2VI?=
 =?iso-8859-1?Q?pElBFYxT6bb24fs79DTUBmPgTb4IVhM3Xow4lkoLkJhkvLYkdxLV0O64Q+?=
 =?iso-8859-1?Q?3KDJ0gIq5rHUwR56KRiBOe/RMlXtUFDTwGVR58OqI24ID8FRBwYznKI3aR?=
 =?iso-8859-1?Q?2Po/AwbWKDlVFcNxspzQG5zAqDV5M0KTTyVc6/eisLtjLoJ1K9U3ZTWqM1?=
 =?iso-8859-1?Q?ie2oibbEdxFWTONgSc6iFXdRb4OD4WLrChd8Yj0lOaMwXPDrW7dZzBBMsX?=
 =?iso-8859-1?Q?uKEE/O4BhH+Pq7XM2/K9qR2a6K7V73ImT0PYWTk1Z7EijfIMX1VqSQVV3K?=
 =?iso-8859-1?Q?Tf8wQpo1P4MmsKkzq4dw6rmqu506lA3/04JYrCIhxUYr3Mq/fvxO2j31EF?=
 =?iso-8859-1?Q?s0qECS59GtXAILc+S6cMEBn+UPbuIVDjaswLKAwqAN6QjgJd29qArCAUjK?=
 =?iso-8859-1?Q?eJPgoPQrPfJC7PVw8C02IzSqmAz5KjEIVjAawXKFVyqHmvaRnsIfJrrWBi?=
 =?iso-8859-1?Q?7oHdiE03Rpx+KD7I4/kjkz5CwGvl6XUuZzGyrbEwt/eVNRlHxHk1OPjOQS?=
 =?iso-8859-1?Q?vuAeGM4F8lrF7p8sQwEm7u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?msvD+A5YTZzk8Qpf1XJqKWJ9rPG4lItOeSMkX76g696O3PADSMTuWqzb/U?=
 =?iso-8859-1?Q?gtRTjXvSFmJaha7mRDA0sqQcGvnAMuYWwvIW4B28hCv++qCuXkIMVCdrXL?=
 =?iso-8859-1?Q?WY5SIH8hRdUhD1RDrc0VyGvz1DrpuljcsSgD+oS0fvEcTsyg3z4UOKcqBB?=
 =?iso-8859-1?Q?cAmFoul/TpjN0QEAt/S6LLrQqU9Ie+YDgFGIANvtn5eLlcNQkd+5fh+5Cz?=
 =?iso-8859-1?Q?XvhWKjvV60eITpWJolK2P2BXRdfAGJb6AiFiYyfWOH+Bc8qNF6xyeNu1qL?=
 =?iso-8859-1?Q?syGRnR235YcfKjYQkKjL7Ow7dMAI1Sg5T5Ctg17rnm4nFkJmCotktSDD1b?=
 =?iso-8859-1?Q?UBZ5AkZ/wgb45sl4zpr912os8XgZbZNy70z2cHHjHvI3QhHX+T9apH8y1p?=
 =?iso-8859-1?Q?LbJjGBO1iF+1DAPpKP4CJjK8bALrPof88n6enXGAhDYgMNNltlCgxkRBt3?=
 =?iso-8859-1?Q?becKsb0O9LWoBYd8bXGsEiqbHD9ZSFODwiUb/NpoZrzqYcAHUVaH2tund1?=
 =?iso-8859-1?Q?2xOrHQP3rdGOLU+rZj7y61jlJ8rn5bvwvsIFkshxi36JgK697Y2YUQrNTd?=
 =?iso-8859-1?Q?6MMsKvNNIb9mC0T8ytkr6FceAnoakqJ28fniJZxdD8zEdpDiKz7DWiWUcp?=
 =?iso-8859-1?Q?OIbEhdzAYUTbFhTzrC0Jup4AE7cd7MfgNoYWFz1UuMEJdzcDph4uO6OTbl?=
 =?iso-8859-1?Q?CfPD0Pp8tahqizZK1yOLL939yohtphQm7llzH/tmzYqIUWy/XYrSd/mxYk?=
 =?iso-8859-1?Q?eTl0WcVZmtFagBM6MgLPgu1gWjhLuNYbj1F0s8KfczLisrTkYga2aGtJK4?=
 =?iso-8859-1?Q?a9OhoOMmfbzmoeu/DHxd3tm38PNbqhCFUPKi0vmlG/q3WeX4OqzLumxuPH?=
 =?iso-8859-1?Q?l/uUhjy7Ylusr4/V/vrzX1x5z7zCUV9elZkv3ViFrLNYH7YFvSt5cCyC/l?=
 =?iso-8859-1?Q?mjJyViOBHa/wI306FYyJ3q+x9pgQdCRjjQbd5x5FqYwyPVEgyGpMPviIGI?=
 =?iso-8859-1?Q?BpVd6d8Abnyg9isX5igq8w3wifHR4Aq4TWcEFqjwH/Cejud3XhxipIb+HQ?=
 =?iso-8859-1?Q?9qryoA2rrv11ikQpzcij3MqxnJKFpAu4L9VFQ9aWVzpJgfB66+kROxgbeS?=
 =?iso-8859-1?Q?G/EBdUBH8qtsgL2oax+Cmx4iT1SSKE1qVa6F5BKvN0o6l46DqEYnUp6pMR?=
 =?iso-8859-1?Q?iy4x3+xBYbnLbxYNZGqitvomC3kyXIgJnoh9Ld6qZVnM1xRAGGT5uGpoAu?=
 =?iso-8859-1?Q?Qp4vMuEpLHp0gGZVUgMf5xAyFU5zSOG3UknlbLib1LpyHqUGKfTYDwmJpS?=
 =?iso-8859-1?Q?ZMee+UJwItD158iiFVhJ2lJHbI70V9qg0W1+oSvNiXmxKViGdh1mcTt1Jq?=
 =?iso-8859-1?Q?7fgPyuubgbhHR5fcD8u6401yjHvkgwTXaSGUDwkHGiZ3o91LUO1kvYmaA9?=
 =?iso-8859-1?Q?139xRuvoXU+dHg64b5QTKoYOytFaYbVKAX0lG4hEos++mfaFKRQaGWKOy+?=
 =?iso-8859-1?Q?XRnsdt19FFRZY/CSOR2V1fpugVgOl6xnsxrP6xYU/rqDGfcw/eBv1wkwvI?=
 =?iso-8859-1?Q?DCc9sKgiNG4EV9BBWZyKdNeaIF+2kS50NSap3INNmKWZH2c3ouuixaltXf?=
 =?iso-8859-1?Q?bvO6UtUYGFrKDzfkoTaeJrhCBDHfxb0KHrv0xdEj1iFY8seM1WBX9dGA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a9ea07-4b5b-4bdb-ef54-08de1664f5ee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 21:00:01.3479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxyYK1fsG3lmYa2YnuFlmRCYUikiKFPdpGKC431Mm4sbcpy4kTOpSx5iBEDPdIAl7Cxg4900WBi3SsVYdBwhSEOJi4TzC9qO3+BIMz1hr24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7773
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

On Sun, Oct 26, 2025 at 01:15:38PM +0200, Tapani Pälli wrote:
> Whitelist registers needed for userspace to control autostrip on xe3.
> 
> v2: fix GRAPHICS_VERSION to match xe3 (Matt)
> 
> Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 690bc327a363..bb2e167f6872 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -89,6 +89,13 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>  				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
>  				   RING_FORCE_TO_NONPRIV_RANGE_4))
>  	},
> +	{ XE_RTP_NAME("14024997852"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3000), ENGINE_CLASS(RENDER)),

This will only apply to devices with version exactly 30.00.  According
to the workaround tool, it looks like this workaround is needed on
30.00, 30.01, 30.03, 30.04, and 30.05.  So you probably want to use
GRAPHICS_VERSION_RANGE(3000, 3005) to cover them all.

For regular (non-whitelist) workarounds, we'd usually break that out
into two separate entries from 3000..3001 and 3003..3005 since we
wouldn't want to overlook that the workaround might not apply to a 30.02
if that version ever showed up in the future.  But for a whitelist like
this I don't think that's a concern; the choice to apply/not apply the
workaround itself lives with userspace (so the burden is on them to
monitor that they handle it on the right platform(s)) and this is just
making sure it's accessible.  And since 30.02 would just be a minor
point release, if a 30.02 does show up, it's not going to include major
new security-sensitive bitfields or anything.


Matt

> +	  XE_RTP_ACTIONS(WHITELIST(FF_MODE,
> +				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
> +			 WHITELIST(VFLSKPD,
> +				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
> +	},
>  };
>  
>  static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

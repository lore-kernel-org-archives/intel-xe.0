Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D15CAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 15:22:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2C710E10D;
	Thu, 11 Sep 2025 15:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dX/cJEBd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CF610E10D
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 15:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757604161; x=1789140161;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ui4CsLE6y55Xo4He7dXRmybIa2csfc69FJhXIhkfC6w=;
 b=dX/cJEBdQdXfuGM1C/Hg+lEHD2VNLlgbuf0eB0uiR5hs3zln3wNqr3qh
 JfunKhXulHI8Vglqnwnv2z4vVkV7NIG13RJdl9wPjU4/DfIXLre2be77f
 +i7xpPC5+8CKKuraC+iXKb9UAEdO5s4BS09yuSG+luO15JH7BaeLw1hvW
 Qpw1l0npi7rO7o6H+uZcxwgq/eh2xcTxI+t6l/Ips/PlCczIvf1k94Kjl
 EpgEBW+IHBkYAUM9peIFZ5oQ0hw4knh0wJP8Wm+Hco9wuTl7zZ7v8Kf15
 DAjJqRcf0ZP6N2/dq94r4D8Zm9sy1L8cr2D2HMeZVBhFpWxQ3YMEegmM1 Q==;
X-CSE-ConnectionGUID: w1o2kMXxSpK/loMTte3CWQ==
X-CSE-MsgGUID: NHLjtrUdR8iVAYZOuwniGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59636473"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="59636473"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 08:22:41 -0700
X-CSE-ConnectionGUID: uJlz/GmBT1+ivlAOJoptrA==
X-CSE-MsgGUID: IDqVGKJiS62aLze+iOJRVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="172895520"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 08:22:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 08:22:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 08:22:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.70)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 08:22:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXfuzGnIoEw/7JVDZrI/fkBKIjdHACpMl6M9rMcHyKwHTwk/D2iWV0VEcAvE7Hw2RK6mQ2ZJRXlNofunzrGM3sQpWoVyjMKBwUzECuSFQT0czrWFzn+ADfQvT6SvgvG5mf7fm3To2U2DpyX7nxDZIjXpkzYPQNL/fQvL5xdPkax2DZFbsyESjswjxAd96IRwhVhaOfRoRLJPgfp7ZR7GpZIbsNozfOfP0eC/i0vydWyOM7CuxayT14EmH2x/CB8EkCSkI+8mHwYlZer12/nkbHJkwyzcjtxMJSLrpfqnFKgK0gx83RWyCC2pXcvvnkbNOi8l57YW1xlGL/u9BBnMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vl6E/hYfEsHFS4XTEAMxS1aVMIvIAHf4Vdbh0wJZ6+g=;
 b=hfwpFnu22Hz0mvN2DQhHmU5Xozx4qMgvaorgP4SblXusZ5Kd/gVoDuDze7b2XpYH+oTIkxtBi+MEyuXb4ENVekh4Jn8RlZfDkZs2Q9ovTY4clZtPDLcL3+1Lkqu/XD2BrePbMuOnuhMSOzRN56dvFb/SD015xcX0XeyAz6nfyhBg5mh72+pJGj+sNK+VAUfWeZUlLXecin0iGWqRV9ltNt0XS07fIbpVXMPwoxSGmgEiKAdFl9s9eCSHnONIKMC9itjfv96HxCcSECZX5lFPBMkQaOimTBq4CUCTyVA/Vrow1udWVPK3L+MBY0RG/HIjhXTr3ZDvd83IGwLookTsGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8567.namprd11.prod.outlook.com (2603:10b6:a03:568::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 15:22:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 15:22:37 +0000
Date: Thu, 11 Sep 2025 10:22:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe: defer free of NVM auxiliary container to device
 release callback
Message-ID: <w7efa26dmfkclz5su6nsl7c2hk7sky7pjydhzh6swv5tydx6df@vfzrpzgrqqmh>
References: <20250911052823.226696-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250911052823.226696-1-nitin.r.gote@intel.com>
X-ClientProxiedBy: BY5PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:180::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: 680c022e-1bcb-4ee2-ac71-08ddf1470a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3/U6AxQErsJMeo9RHwLMvHfCXcL8JkMquqaxztCEfih8dUD0o5ao6lkjN46h?=
 =?us-ascii?Q?fgCJn4Y9GXaRg9yqZLmgkt89w10jAGcDEPfIXAJE8qo8tduxohTUo0/H6Avf?=
 =?us-ascii?Q?76RtoH/PvBpr8iTjx6YxNHZNTgiuIj+4uJIdHQmLNDkhXFoFv2nb9xOl1ZNW?=
 =?us-ascii?Q?uErrzj6KYh8cHB3BHfMPp/jf/PEa3IsyvJhcJ0ukK4awA0wO1rar9uvF8msU?=
 =?us-ascii?Q?HBLrBnT7jxqDokwfuHyVaXL+Q1SFsElFyNj8KiPHwTqU6J1/0XZbCuvUq7e9?=
 =?us-ascii?Q?biP8+8sqdO9kWSGIhRSs7QGhjuNJFWuswygTObeBlJU17BUpgk/KzdtMsgMU?=
 =?us-ascii?Q?IRcx1W4ziHLBMxpQLVRw6KXNlDqNdToWFUQ4txp/3RMrk5HUg5VzLFBljnH3?=
 =?us-ascii?Q?nuXKrBpJkBDVi6VwTKRERuUosA5Loz++woo1Kqnii01GmioDuMasJuootlGK?=
 =?us-ascii?Q?7yIX68mU1zEn0jfv1/MkQnrZosI3WtTykH82RAs/Q0Q1z94opMLR3hPq8NU5?=
 =?us-ascii?Q?nCpMV9OxJef1aKiM+e0RXRzSjHU4c/i8BPYW9f26UC92M8g9gAq9pZrxVEZS?=
 =?us-ascii?Q?14M7GUpcusXhNZp+1yZ440apgIMFwwQLjF2hD8g7Vb0nfUyCwSLfap1UZNRr?=
 =?us-ascii?Q?zR2ItYlLtAzqOjkANqNst31V2g0Xfr7Dzo03h1UYy2IWE/0VEOgsqVUDnVGO?=
 =?us-ascii?Q?iQ+n52QrWDuqLXRjNil0uqrbcibdyyplN6no/mogtQd/wfTY//fiKjfE7mOY?=
 =?us-ascii?Q?aqU/aECuWkfKZr4TNKcbe9quospJrHgoVZvSOwTUllVptOWYA+wVYOwOdyw6?=
 =?us-ascii?Q?kMHMl3NldJ8umQwMNVHSmm4BeR/amtosZ2hsOQRfaf96DvGwiUD+zNOinj1Q?=
 =?us-ascii?Q?YfyuG8n9aGNmly3+Dyexdew4f0OBsRlk9sjxGxScmcALU/MDT+qJ4CSn0MpE?=
 =?us-ascii?Q?z4I5SmqzJo3Xf+FTor5kC5YiCxasOWx7wFocR1Axf4mEPTzohm7cPK+QvyBI?=
 =?us-ascii?Q?OcU1vlliIVc31mnVReUd5pIWzV0Z8ba8yvffiiLNe+FJ1yCFJRFrH4OivFqE?=
 =?us-ascii?Q?6r1//nr6TGx4h0Qei7NL+xLyy8/NTmQWLY4xjrLznxjyARyIahx0Ab3G8RAn?=
 =?us-ascii?Q?YqNJL0sFTyr7fokyTJOGX2qv0CCBsH1s3lHSm5PzNubUjLbCS/Nwpq3LsweC?=
 =?us-ascii?Q?zZAsaCUTmEZtmYj1KdSkfI3Q1Q8IrFXqC+XAidpDjaWCu6BH1gzEYIiv2y8m?=
 =?us-ascii?Q?2FV8mCDU9jSG83C7d77HLHGFl1M84oLrqLZKu7fqGRz3YcEGBtvr6ykA2xf1?=
 =?us-ascii?Q?/JDtFr5UbgdF9Stxt23rfRxytJgZmA9WAn5FfT40pAgaWErCdDlc9M3ZdAPa?=
 =?us-ascii?Q?CTkSX3m2GJOk0m37PDFnTi2aaq4v45dCU2p6mUvnCJRdgm9NsOinOOd1mE56?=
 =?us-ascii?Q?HjYJ4PEIvPYEGSFGdAGaYDhgvTELsx7qz+YnTOVVWkPXnASYiwQ1Og=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tp8TRmhUYLufVSWefmdMNmGdW+9WJVWlE0m+wChZ/s+9GR1zzV8zDMuMc9mQ?=
 =?us-ascii?Q?d80V7hWkjr9nCpEJu1eo2EOBi+gCLN1xlt7YBC6GVBiSSy1VglMYMjUXovcu?=
 =?us-ascii?Q?lwmKk8qAE+7GezDFeqQTmCfXrzLFZ3VQF2DIwsNHGTXUYM3IjN023QqOlDxN?=
 =?us-ascii?Q?PiFq9Xnn1oxva7KG2oK+Ndxn9SvpQtRVAkpKrdJWplDMb0907M7cA/aQxdK/?=
 =?us-ascii?Q?2FASO7IANifhMeWa6SIvG45lZ0JIqnNZuSudfOZ7j/lE+WPinLkVc5izM/R4?=
 =?us-ascii?Q?Fn4xaoNCFGAwxV59Wmsmom01Dm8lJ7QaBS7A0BStIas4KD6Ne6d4Abzc2vgD?=
 =?us-ascii?Q?PvJjoHnFFGTLT5qrR5Crd6M7+MjedUAXs7InL0DLObwNKmrgEgZfIT5CFCfk?=
 =?us-ascii?Q?fdXIJzj1yuoeRf5pu3tBKM4DiGJ2iQ9WSVxku4hLnqm7C/mcTJIhAnvwDvGh?=
 =?us-ascii?Q?eI9E+zHxglxtbYFijrQF3Eq7n6etDA0m8Lw2Qdi/ea4Yr9XRYYcji5H0xqZd?=
 =?us-ascii?Q?PHWSoNFLirmV9V3rj0pkxQBD9q9XoRnKBooi5d3Hh7bc7lMnl+s/sMr9IgVB?=
 =?us-ascii?Q?mg7ehWtlz1wHhtODa85ckAoLu/9NVu5cQu1xQyA2lH7gYp1W7rtlP86JkcK4?=
 =?us-ascii?Q?6ssGLzw6f6ea1B1BxRhzBgWMd2BXuEflkPE2jAkl7YWfy4o2h9Q463c+cFKF?=
 =?us-ascii?Q?BFLkP4uW5SCKDR22p4EejSzd72KT+KWnXzbmqRpcYJDihDUE229zZz5YJGNP?=
 =?us-ascii?Q?Z7ICd4kgf6yApyIbsiFJP5M+zhvQYqES4xgRl7wwM9i7hwQORbqELdur4ADd?=
 =?us-ascii?Q?i/e+2CPenRcLNNn3iPp3H1uFFSb5lWU6zmEb48a9fZQSE8OBbq9mliIFt6N1?=
 =?us-ascii?Q?SAh7/gdpOlpbreN5HiMZr+tEiY+z9AzhD52N69iZn8Mihv4lMIDhRiUqWeFv?=
 =?us-ascii?Q?j6wS7ky4sOD0ZiqWDFF21jZhyfcCGdgtGiXV3ULPazelrGsPN27lh+OnKyWA?=
 =?us-ascii?Q?gyiaOjA7byMy3nLh2fLQKtqeoMP38NGQcH30R5EC8s6SeVl/AxDCwDVP08Iu?=
 =?us-ascii?Q?stR2LNJ1bE9MsbclRfjYo49zTxmzyNxxGNf8qy6ObHVIjiaVYcFI3KwCz5XW?=
 =?us-ascii?Q?WITUwb7yKhfC8vPUU06oUpFoBYmqW0k+sw5yWzmSfq8ScynzZ3dBAdloxi3d?=
 =?us-ascii?Q?6hyWUtS/YAkPWHNQU50bugGGGAwnFCmyQ7gEQAwjqQufRHa+Xg0ZYfXhI3Jt?=
 =?us-ascii?Q?XoI4jX3f1VqYd6yh5kPPMatJz/zARhdb0rJb2wKxBhuGsRZshOMW0vvZ5RDx?=
 =?us-ascii?Q?K92fJ7k7B3U6/N3lgwz7ei62bnuFeKGKXWgemye+Jwqb3XAro2mQIto0jWVE?=
 =?us-ascii?Q?d79h5HNsw46iqCjIijnOe9fP89E8wSHGuEK2deC4HRasQPoz+Fd2MfeQePgB?=
 =?us-ascii?Q?yUT4BCzAefKYnYiUFUDG6WJqeVQMyZ188w4KG5QdFiAwZfdR8mxUYBtUT5cK?=
 =?us-ascii?Q?A3RQMAOG/3M5090C3iyjcy/Ai7VmzvgnFQNiTQtxhwuc8CQ+85BEh538nR9Z?=
 =?us-ascii?Q?wc5L2CRLTS/kwKstT0D8eCkOaIrvRpBwSPX3tz8zIUqziQz5p86+53DAgDoV?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 680c022e-1bcb-4ee2-ac71-08ddf1470a61
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 15:22:37.8591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f85NAYuC8Igpj//E9eP/OvEd/BJUIw58N0qf4Ok2MQ/6c+9uNW4i0d3zp+nax6vB6KjuL7iai0nM+6y1GIBzXAhFwoyGzABHdKbQQ1Z5REA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8567
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

On Thu, Sep 11, 2025 at 10:58:23AM +0530, Nitin Gote wrote:
>Do not kfree the intel_dg_nvm_dev in xe_nvm_fini() right after
>auxiliary_device_delete/uninit. The auxiliary_device embeds the
>device/kobject (and its name); freeing it too early can race
>with asynchronous device_del/udev processing and cause a use-after-free.
>
>Set aux_dev->dev.release = xe_nvm_release_dev and free the nvm

this releae hook setting was already done, not something new in this
patch. I'd just remove this paragraph from the commit message.

>container in that release callback. xe_nvm_fini() should only
>unregister the auxiliary device and clear xe->nvm.
>
>Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
>---
> drivers/gpu/drm/xe/xe_nvm.c | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
>index 9ca4a5ae1693..cc8d7c6cf69a 100644
>--- a/drivers/gpu/drm/xe/xe_nvm.c
>+++ b/drivers/gpu/drm/xe/xe_nvm.c
>@@ -35,6 +35,11 @@ static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
>
> static void xe_nvm_release_dev(struct device *dev)
> {
>+	struct auxiliary_device *aux = container_of(dev, struct auxiliary_device, dev);
>+	struct intel_dg_nvm_dev *nvm = container_of(aux, struct intel_dg_nvm_dev, aux_dev);
>+
>+	/* safe to free the whole container here; aux is embedded */

no need for this comment. This is the same pattern that we have
in e.g. drivers/gpu/drm/xe/xe_heci_gsc.c

Other than that (I can tweak it while merging),


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


thanks
Lucas De Marchi


>+	kfree(nvm);
> }
>
> static bool xe_nvm_non_posted_erase(struct xe_device *xe)
>@@ -162,6 +167,5 @@ void xe_nvm_fini(struct xe_device *xe)
>
> 	auxiliary_device_delete(&nvm->aux_dev);
> 	auxiliary_device_uninit(&nvm->aux_dev);
>-	kfree(nvm);
> 	xe->nvm = NULL;
> }
>-- 
>2.25.1
>

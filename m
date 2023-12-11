Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFADAC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 14:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857E010E10B;
	Mon, 11 Dec 2023 14:40:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9757E10E10B
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 14:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702305647; x=1733841647;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I1RQHekU9brjWI4N2dDIVVWaGFNlMqZmpUDIQYgsWGA=;
 b=AE4D6EeXhhqiJDnNC4//T4v3BhW+v/nAoemoWY7lMDHsLP4SaUllub5U
 lhMFNHgCh6Fn7Ab3fHBHLJWWInCeO/QwNefQmtIhiP9cSwOCnQ9LIV9/V
 1PJDoiX4TY3OYTjEK22xeWgt+e5O3PDHkkxJQXSQpGZ6v02xgoIkBR8yf
 fwDOt82q0iXB066CpqY+jqr/D+2Cu4HVN1uOMltTyriQ4bwj8SeP6n+N6
 hbAUwSwK9/AINOTApI4dYLiLQIQQk/R15eYW5uFz9dV4Gs004vBNc328Q
 feP3zeyo34ELgfPoB0/NAIoou+saWYDBWK4ddSSAvLLEH+nQe5lBSBOW6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8009878"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="8009878"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 06:40:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104487432"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="1104487432"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 06:40:46 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 06:40:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 06:40:45 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 06:40:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hi+pGzaBOxD6X9EIj7mwawkaawvMZp2KT28SVd/aGosguw036cJsoULIGVOxlwRJElOm3hpWtty5Io8XnNQA7QRUcYlmD4i9a31LO/JU+xi5c53tbEni135YVw8+YF2+5qsLgW9Q0B/yPymwV/GH8HAgEDY9YBk7X6ldJ7MznTkBmXVAgBpm9CbXsB5JEZX+qsCIiupaw1+XuDmUAKY3jB2+UC1n6436WnrIylf9X/PO3SEqPNqquCmXlwbFhVGznAWhhGoY2+wpcxkG22AxBuo+nCenLH3etG2yjmRjsVoZmSgcJFBwaevX4XYRhzleeW9XMis9mToyIgzUrs/Edg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoxVCYvLc9n0wckOijwRVooJX/naozmLXJp2Rn6di2A=;
 b=ONTbtB+R1Ah1uzrokMylO4/GxtLGSRB7hy3sbBaQktP84aNhPcagk4/Sdotw8ysZpjaHJg6kXEqvNplAT8pQog+u1FfKSnBMtqPGcii7VCg0mJkUt3IBHPVXNPiIeSRWpQfzFskFVB4uAzgkqTJCLD/n85AjWwayb7X/B1rXbDCSC/IXtBwGksyz1PQTSXfopqLX7+7zlcc79D1FHTk7T4/TaPQ+OfJgBVy3gTmNoSfa8c6dR3FjkBzckIHLa+BYeaW2R+VQMtojVHDkOTlUVGlWujaQ2sWtmqoCdKUccFF2tQMcTp4GQ/blCoNxHgN2KAh3l9/s74STi+ndkdzLVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6075.namprd11.prod.outlook.com (2603:10b6:208:3d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 14:40:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 14:40:42 +0000
Date: Mon, 11 Dec 2023 08:40:39 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/3] Revert "drm/xe/pvc: Add pci ids for PVC"
Message-ID: <ivd4pov7oay3b75vnma5xbxsaen7d5snpujn6v23hdt2pm5po3@qrenyjgepjyg>
References: <20231208171316.901795-1-rodrigo.vivi@intel.com>
 <20231208171316.901795-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231208171316.901795-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BY3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:254::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb499ac-9328-43a6-c666-08dbfa57269f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vqETNXUPc6rQKkuI265N61fX+UcnWsxCoHtziyNfmkm6IT+nrRzh0pvBGdemIsuJw01lHdROnh5u/btoVsF6P2p1qWHGujv+cA5Erk3ejf6tvYvw01OTMvKY07sBGiqwEGhLI47JJ+HRmXr3pNqDj//u5Rsi0zuvFtWfAU6yQdEG66Z8tCjSgBIAEvb1lW7AvEJjjpNYAlzQCu/YxQ590xiwp9UJCmxDYKqBpxyZ//9466BI5PCP/a+qYnu1UTHEfSmtlgP4bkDIpovVhPsFdRAs4R4n0fuRFzNgXptGZWjXYZdwqNiY2do701rrTpnbmeVr2njfsYamEfrsa9e+xkbFs79stcvrNqUlqhdgsik/QVntS5KlTImFv5DHboPldx31DPaEPeHar2SEUsnat+2pSqpNhiCg4lhp403iR1y11S1Z4martc5gmmUb988kgK01qDugPg7MJIAjBr6A2Khb5Ek1bB4U+VOmaI6A0tzcamLmqOff5kIN3LCNbEASZsxdnUvxpgbXK5TZuTF08ggVTujyTmVCaJHTHYgz9SzLpdZfU8yiBNwTIv3hh6Om1AQEUUP4kZdtS6V24L+YjjUNgoLPc5WzP0Xkeqa6SqU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(376002)(136003)(396003)(366004)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(6506007)(6666004)(6512007)(9686003)(83380400001)(5660300002)(4744005)(41300700001)(33716001)(2906002)(4326008)(478600001)(6486002)(6862004)(8676002)(8936002)(66946007)(66556008)(316002)(6636002)(66476007)(82960400001)(86362001)(38100700002)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7CqEzPQJwd8I1/q9Jjh0LwG2+sbWKtTMnc2HTS/ZGso7Edifwykbr5GSQvG+?=
 =?us-ascii?Q?l6lYQF3qvco0BTYG0KmLfb/jGPOcUs6BKZRNUsOs2YSEj95dElvQq/UjjEgv?=
 =?us-ascii?Q?NzuYmqM+kKc1oQH1fW8OJsimjmsB3S9DrrIc1qYdYabkcZz8dOiiZkuH9niw?=
 =?us-ascii?Q?w36qPen+Dq2TXXsxxKxHT7c4D0337F/m5+a3rtZ6XsfY7SQP5n9F53JL79on?=
 =?us-ascii?Q?KwWgbBPLQG/fqFQJNhPC9HW5lP7fl34FfoD8gr56oTev0iHejsZcQuVV1qVO?=
 =?us-ascii?Q?3QFlVpdSHPcpryh3vRNrj6WG8DtkxoK3NEZpm1KnyeUTJppwnw2AML/RupGo?=
 =?us-ascii?Q?B8V7rxTvRu6qjrK0VRpMOALBearclbEjkYX6MuIJi7PY47GS06JPbnpoaAEh?=
 =?us-ascii?Q?33psn4+u5wm7MY+PqSTRLobEvKP+vO+6Zx9Zhkbs2ESKKlhsqfTQJaPWQ0Q+?=
 =?us-ascii?Q?hLJjUpzpzwrDj0dXpAsmiYk6t5oxqqPNRJNF8UQ3gXAI6E67BsWDYfG7DzJF?=
 =?us-ascii?Q?4ZXLjoCUenuCRBbfqWlQsHXnEraZDtKbq5dKa7BvgWblVNx4p5YvTfMRDNKr?=
 =?us-ascii?Q?uIP5hw2x0x+6FQdbiRjpG+HfJM8W+bRfhOfpz83iC6qLvP0H+FVv/pYofVv5?=
 =?us-ascii?Q?p15qyJQpUkNm5FTRp4wW/ahpN4gGcDonI2z1c/6zsvLvlMjDNoWiGC/r2hrJ?=
 =?us-ascii?Q?xPUcX3mR5W+Xy4AU+LtpThZYJCpK3cgDn/SmrlRy23mH8VwCz6fhWYmJupyc?=
 =?us-ascii?Q?aFkW3AGwG6XLSQEiWxgHkvYkol9lyIX1mAOhsmv3CMiBiiu8U6cYfWPKItjS?=
 =?us-ascii?Q?gPiCsFOJ9Il4UGuHnAEd2B4+J+wbCGhzZHlKHRNjX6sWHqjrlnq6lHZqoSAo?=
 =?us-ascii?Q?jVcPUATim8z6ZEG3vmMYtG5yom2mJqUXW/P+PZROr1fWXOYgX/UrEaWqx785?=
 =?us-ascii?Q?+d0aEkrg7rnLbl0d5Ea/ViYpBnVOar+bXKJP73PLT2e9PFeM8wQElP04Elee?=
 =?us-ascii?Q?y867iXGRx8jNYVTl6/O0iIZZUajut4bqAELKLspGxWGYkL3N1dJ2LkvUSseU?=
 =?us-ascii?Q?sLDjPBpj9AJcifk7sMqj2J52ude2DCa6UPUgc1yC+UjmnYchuoVFXh/XRj6n?=
 =?us-ascii?Q?D2thoOKViLytu9z2offQ0lGFjd3BxEHHx8Wto5Dn5ojkpNn9rxox+4t/EqKp?=
 =?us-ascii?Q?Qf22xqo1b4lNr+Svcc+wrVRV1p0mYBgKOB+YYe+osohVbGzVyHneuzYvhye/?=
 =?us-ascii?Q?tr91J4T0n0lnsjjlnGEaUOaea+QefpxwB4S9nj7LfUrMdBl+dkN8YQPz035P?=
 =?us-ascii?Q?QLitXSFAe9d55KbIRo7u4xDLNm8Flu2tP9XXt+3vu/epqjvMCj/flR0oxnuh?=
 =?us-ascii?Q?vTef6B8E/1BA5hDsg6Wa1+YctF5mC7xvkxmunqAAHTN/ivI0o1hSO8gWuuMR?=
 =?us-ascii?Q?xo6G11DlbWdww8LGORWXdxT4OTpSust3Q5zYuQDL81x4ESWmnBdVtRIyt++s?=
 =?us-ascii?Q?3EHaHZaXr66RgMC3Sx7TPSo9/tUGDPQrC7UnQ+pNH/GsHsnd8wT7LaZLyb/n?=
 =?us-ascii?Q?VrVBqVWyNR6k2BUhy5MYtUMq9IBwPFEuWOaMZKUh2xlUBxasOp0qLFtVXBeT?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb499ac-9328-43a6-c666-08dbfa57269f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 14:40:42.2155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6FmUbgV5W5h8V6dk8R+TFt60bKJ/e7hnq+1BKrxKbxWjSVULwjyhCn4mXOwoxKD2V61Sx+JDl1rEV95kgg7f5IJ6kNvLcqzvibTO/5+7cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6075
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
Cc: intel-xe@lists.freedesktop.org, daniel.vetter@ffwll.ch
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 08, 2023 at 12:11:04PM -0500, Rodrigo Vivi wrote:
>This reverts commit fe2e5f2eed85acbbf03f411a4830ce6cbbaaf179.
>
>Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> include/drm/xe_pciids.h | 2 --
> 1 file changed, 2 deletions(-)
>
>diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
>index 3011d99a05c5..b1b4e50f5e0e 100644
>--- a/include/drm/xe_pciids.h
>+++ b/include/drm/xe_pciids.h
>@@ -184,8 +184,6 @@
>
> /* PVC */
> #define XE_PVC_IDS(MACRO__, ...)		\
>-	MACRO__(0x0B69, ## __VA_ARGS__),	\
>-	MACRO__(0x0B6E, ## __VA_ARGS__),	\
> 	MACRO__(0x0BD5, ## __VA_ARGS__),	\
> 	MACRO__(0x0BD6, ## __VA_ARGS__),	\
> 	MACRO__(0x0BD7, ## __VA_ARGS__),	\
>-- 
>2.43.0
>

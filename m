Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9BBC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 14:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E5010E608;
	Wed, 29 Nov 2023 14:23:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B863710E543
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 14:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701267833; x=1732803833;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=w/gDgV6dDDh/qd+/Jw6qQ6ah1JFQFcUchOOsj8AYzgo=;
 b=MtupyslQFh6qIbtLg/lu+DDWp51XtwjtkDwsB/1PfKykfEp8X/76otIA
 biXC6fdaWdy1G0oItaqX7yRd+a3wPWllidYTjJfaDHsCydlnSrG8+dyid
 AcuWxTqRqh2djJuP2JT575eLquMox2zFg/ktX4HwtgajbeXFFCvPHSa5K
 QqXubjIRAJ1yk4wjnxD8ndBU0ml1wRBOVyMTY+ISHeHCWYKAeIqIAlTcw
 Kcdl+lsQLjTY3ATmJy9njoGnyimD9YlhWxB5OJUH1fB7Gy+jsA2d9wtyu
 Pygtbb27ltgL3dSn6l+X2tl+hd9krdJkX07kqvgZ/ED9DgM6OJuwnWjtr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="424313772"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="424313772"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 06:23:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="839442132"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="839442132"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 06:23:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 06:23:52 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 06:23:52 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 06:23:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSVGRgwIOCRBOFJMXVV7wNyEeO5gfh57q7fYFYepOyFmrnlgumG3xX7Td3/Cwp6P44U/BzLpH3AdQNdC3vh5cj33szL1g675s3478u9p7hqOE/xzch8HDeHt6j7FlDkWZSlkOxvuOLMuYbw28eHW2Gg+ku8gaCOz1BhcHv950e4ah561UVax4b8/8Dpnzux8CAPklB9BP88+zRVq7OLLzYEHCqaJrsB8Ovqianq1xeb4Gwg9EatBOSmnx34oB4tM0rZa53hW476wxePeS8DH+NdpRUIiMOfB71L9LEDs69wBfrZRYPAOFy5yjWljVMzaIsz7zKUFUwNj91atf1ynIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/W+faG4Es2hdew/dZi/NIMNwPrHejQXKSO+GtOLh8qQ=;
 b=SAAe7G8ShgQHwwYKvfpEDVau7EVneRku3nfesr0AQXv/xMCZ5OO+tNSWoriT1WbW3vw/zfhyVtCebrZZcCV0Wjl/32tp9jUznAGLN8a6fpL2Lu362vZ8BrPYwKLw5ibNHX/7owWbOj+44P+UgvlW4IFTDgvYFDFM58gPxhnPBDg6Un1H5UuxESbECOwqiFQ53NqyG4smOcVqC6m+eWuTYkTkwT5+jVnSaPuaS0aCX3E84mY8yuReeRNZuYAtva9WUMG2Dl6aWkgtZXuCVGlKWWDQMQXqqCAQWLC+flodvg1N3KScAbOvBmw1uonUAB674P6Y/aNFSqDiBR07vE87ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 14:23:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 14:23:49 +0000
Date: Wed, 29 Nov 2023 08:23:45 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <35mnocmwt5dndybrnrqd4jtpicd6jvdvfctwifm4wv2cl5haq2@4rbouy46wvs5>
References: <20231129103706.329056-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231129103706.329056-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4952:EE_
X-MS-Office365-Filtering-Correlation-Id: f66d6cff-96e7-4431-c510-08dbf0e6ce19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A6DwyXIO3B82C1uusXvZXKPSCNID8BsZyOwm6wPGhZ9ctcD0vAsy902RRVuxAGfzXNZBTiQL9nHCFmllXI47anu19//n1cWazaLwo7HugVtMh1EELittab/eHDecnXt9pKJXqSqK7+QJQ6lw9OMeOdd8tz+aq8gFmXkMuhyua1nNLuKitZGzXlNn+dtCG+0/9oP46F5E1FEVtoUCX1ziio88wPzx3H6GKU/rzQ1biYYdKpuHkq4XGxESuy/0b3hHWbODK81VDPX6GyjW9Mw4hObsBLyM/0JGfhKr5Bti15hc7WC9aACCsnLD5FtgSTPEF/RMJlHQUMrDwljD6MT7XiMDh3oYJZJohPwMxLaUNYv1TgzEbyno8l/Qs27ava5iNX2+gEPjZYeK1NxJ5RQvEUePGr2xp5JzSTKbjOATqUtwNBFyDmhM/538nKpZePw93CVEZH3Z6t1oEeFF5mjWhquYWgsHKmUFVp/4uv7KgXo1qrSGCJSeVWWteKRF5TasP59RFzNNK2s0W/l3tN1KQsJK+9CUIf9BVBRsV2F3+iT/2/hEfiTZn52p0sW8Sin7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(366004)(39860400002)(396003)(346002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(26005)(107886003)(33716001)(66476007)(15650500001)(66946007)(66556008)(316002)(6636002)(2906002)(4326008)(6862004)(8676002)(8936002)(5660300002)(86362001)(41300700001)(6506007)(6666004)(9686003)(6512007)(478600001)(6486002)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DOdX+GSoKL+aM03G2/wcjw3RNT+GS8nfFN6nhAmsvWfXf92BfTbMKDcmvgYc?=
 =?us-ascii?Q?ykFtnk2LY0exr80FFxYceN+Ibd1ClLTXeHECDNi+zvpIMbktT4VinxWOoJNM?=
 =?us-ascii?Q?3hhjj/l0q3PE8DpahWSltRRVJa5YMrL5nfTiYgzTAOuDUFcJi3zSNtNfFBoU?=
 =?us-ascii?Q?RxL7nfHvEWNpFLTmcNykcoNHk3p6+B5ENnYY+1CtK6yzsS+5ax4v1qFympCl?=
 =?us-ascii?Q?qIpK/ZHF1aHTG1BGATvsvkUowb+dAYVEi/SURQXIwxzRk0f7xAb4m0rVaDJm?=
 =?us-ascii?Q?nuYHG4oPtwTdzKQMxldaKzn4yX3FOfi2BOtlMyAZKpdkfaM/NQQnusAE1dBe?=
 =?us-ascii?Q?jxprM2NiOeKspR7ZYeZ32IdnsPk+QWGOCZDVaYVlFP29OFVR2S4+TLfUhr2p?=
 =?us-ascii?Q?DGFX77sYq8RADByZM9CwV6JnIvJcHkWh33F+j/WClZFyRdtZM0yYatlTLNRN?=
 =?us-ascii?Q?VLI0N4J3Uco9a2fzoE4iMSt5RD0H7/5w5Lcua0DKxVQBjsnw7SfnGFFynZJ9?=
 =?us-ascii?Q?8BRrSzzznCqL7Gaf1lj/JKLw/cqQo+cXUnBjwutz23qvB5WTc5IY5dFr8EFc?=
 =?us-ascii?Q?clXjD1jnJKS0R1lclw7yqDxA3UqPialjzd4oD5yRupWxMD4p6i4guIoQOT1M?=
 =?us-ascii?Q?vabPBngXTuubVrnQhfCv8qsVXGuOaUx6aBAuuQVJmaoVXhByMTrWYTmCAuz8?=
 =?us-ascii?Q?Gsx4S/x18Hxd9BHYO6R2KgyX4+Du4JTh7o6XTkQSy1ZzdR+7ZmJAbNu587b3?=
 =?us-ascii?Q?IlLHz90Am19saQgcb82A6+Ix9ky+FXmhJf0uXTyungN9j50fCRioZdHYxkfp?=
 =?us-ascii?Q?EcK7lPDkrKQEi78rlI4fpwO3MHe6NBRs3at9HvyBSj3sMOqWERpvmJBDTruK?=
 =?us-ascii?Q?N8YYYzJ1/uio9SdCBUKBkqrvzNDmIDyOj0DUO8556ILddke6hsQk3Kn5/rT6?=
 =?us-ascii?Q?k06Ts0CHyxsyT6zhUw3sOKvcZyNlscs5Pd4r71J22gGffSi/IDzVZsjMwzPn?=
 =?us-ascii?Q?qEwlmrSa2XSBk6MFPL7kxzAANhmRMSJ27F67VujZ3NVANtPSIdluwp7Tgc14?=
 =?us-ascii?Q?gnGv8xASq6qpYi50LtbNq238YCYyAecSefeArhLbX+cFljBBR/PQ32bTM2MB?=
 =?us-ascii?Q?ETP0BYLUw2kdVQpPZtWCoev1RGwRf0YnPLs3CoxJgJayqabj9bmgeEpslibG?=
 =?us-ascii?Q?fMBhIUSdeKagW6pZlyE1qU0yBt3IiWd7ax7i1mp7yXLkqP4XzXKtsiA3JqhO?=
 =?us-ascii?Q?AfF0AsRwax6V/F54i3582TdJR8AQCEtCak6Ksw2ij3owV1XddyWpWzKYfnCz?=
 =?us-ascii?Q?i12NXodilsrePclIHZpxvXWorIOlGQ7zYLAEUZimh/XC1ncEJLgyZIsT7KwY?=
 =?us-ascii?Q?NlEUJXCZfL4b0P/DZv9n5yDNmlGnNEDZay7mA+vkTsqfZimDKu20NDHL37TY?=
 =?us-ascii?Q?r4iMmVpXMqyYamALRkJgmzjEdLubwMFIWoNBX9gK3afZOBKwRNuNIaA80vec?=
 =?us-ascii?Q?KH19DIpGhdFzZiefJZYDD9/fkLMYN8T6hmZdLcZ0I1dvOZLFNgTx8NIFQIw1?=
 =?us-ascii?Q?oMZtuhwD2uNkAtWygGoi7ov2yS1C3J+Eapz0oMJzncArXLFMuKl0qK6dvkYw?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f66d6cff-96e7-4431-c510-08dbf0e6ce19
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 14:23:49.6256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmJkswnRgLiswbGaLf5sardeU9T7dFW7aLQGKkJj5y2D502tfAhVRIN1LWmFbtgxL0eZ+IUjss4xULntreBMPcKvXTphkD/0QdY9armCmF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4952
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mocs: update MOCS table for xe2
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 10:37:07AM +0000, Matthew Auld wrote:
>Looks like there were some changes at some point here for preferring L4
>uncached for some of the indexes. Triple checked the PAT settings also,
>but that looks all correct as per current BSpec.
>
>BSpec: 71582
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>

That looks right... when we changed the table to follow the new bspec
values for PAT it seems like we missed the updated values for mocs as
well.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_mocs.c | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>index 12a6d39fcd4a..ef79552e4f2f 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/xe_mocs.c
>@@ -366,9 +366,9 @@ static const struct xe_mocs_entry mtl_mocs_desc[] = {
>
> static const struct xe_mocs_entry xe2_mocs_table[] = {
> 	/* Defer to PAT */
>-	MOCS_ENTRY(0, XE2_L3_0_WB | L4_0_WB, 0),
>-	/* Cached L3 + L4 */
>-	MOCS_ENTRY(1, IG_PAT | XE2_L3_0_WB | L4_0_WB, 0),
>+	MOCS_ENTRY(0, XE2_L3_0_WB | L4_3_UC, 0),
>+	/* Cached L3, Uncached L4 */
>+	MOCS_ENTRY(1, IG_PAT | XE2_L3_0_WB | L4_3_UC, 0),
> 	/* Uncached L3, Cached L4 */
> 	MOCS_ENTRY(2, IG_PAT | XE2_L3_3_UC | L4_0_WB, 0),
> 	/* Uncached L3 + L4 */
>@@ -390,8 +390,8 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
> 		info->table = xe2_mocs_table;
> 		info->n_entries = XE2_NUM_MOCS_ENTRIES;
> 		info->uc_index = 3;
>-		info->wb_index = 1;
>-		info->unused_entries_index = 1;
>+		info->wb_index = 4;
>+		info->unused_entries_index = 4;
> 		break;
> 	case XE_PVC:
> 		info->size = ARRAY_SIZE(pvc_mocs_desc);
>-- 
>2.43.0
>

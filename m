Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08809CCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 19:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C178110E550;
	Mon, 27 Oct 2025 19:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njzNQ1tg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FC410E550
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 19:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761591827; x=1793127827;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mbaUQlKYO3+n10tgVU7y8AFMpSoQLg+xRBpEaxLS9qU=;
 b=njzNQ1tgIQlfNe8/EQeCeBqCjLYGekip454r/+FQPYT5uAKpZrKBdLBK
 Gq9dyEkajdjaBp9GF53DPOPlXpYiOhzYq9FA88YDAduLY9gSz972aix4C
 9YBQEMpJUx8e4S8doQ2/Usxm8WQoQ9TA5q8DIpmEN92k+tfxkrf7439C8
 dBlIRA/PKeXRCh3UpmxBbzvZtiuvjvWJ337tSBG2fcjTRQgk7NM+oveW9
 k16llmWLHoq/PgZSIymjtCdHHac70GG6fyHLU2uiJNPqlGWhnNb3wzCeD
 xAf2+TWABfjw1ft8EisXGOwV4PxPtjUuusdVyrpQHP1BWyIYrBZjiE4x0 A==;
X-CSE-ConnectionGUID: i9g7R8/BTDa11y4caX3xGw==
X-CSE-MsgGUID: JaiSvV8aS32vWzTOsJCgMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74802956"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="74802956"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 12:03:46 -0700
X-CSE-ConnectionGUID: mjbd2qkERlSvE9TGgr0vDw==
X-CSE-MsgGUID: ho6RmbIYQnWOBHW0TiNwdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184358274"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 12:03:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 12:03:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 12:03:45 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 12:03:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUh0MTCxKyS4RwksHS8c+N8gvMoAr6HCA3r5/8P1p87y1iV9XLJ7EL5C2KnBelGUVBAJ3roT9cNarME08Hiuf/oKHzgdyicz/hhicvXOg3SeR0kcMQ58EePdO8wBLbK5QzwPx/7IrurS2neDrI0baEF/c9QMM1DKhqrJdt7IbPxZmCvCVZ7X2/xp8iHz41DKaUIQri0b38QMy/TCPOsM6D8wEmAoGSOkk4z7udm7Q9qpp5tQQtGTAYLgAs/WScjGHDngFBaJkHyOhPvVoyP3ScusQw9pGzvbuVbAYqZXvumIaKpzuffn+ufUAqxxDHr34EaiQaMX9XZyDZ5tx4qRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2LxMGDpZfv+8S5aWn6Eb0vZ4+/Go3clWaJxP8dh/74=;
 b=UvYwe9ZTv4kG8YpOMvt1zvSyoY9V2HYN51O9zQFKeZ2zYd359YD8JuYsIhqn9dcO5OlQ5NsXRP5Za3HdCk8mr5+BECYGFRJDOArv9pKANs8fgtSmZzCgHdsk1O5+E5uj9wXCi7q2Efue//xQNqPXgIY2ibvlvsmhYSC0Z57dUB6w3x9qhwypXoZDzP5hZ5o3ur/7eEd7XS6XFy4YpHwflIw4O0CcRGV8xOEkfDf9qZ1zKHa4PiVwi32XEvX/SbH4rW5SsDWflv/1C8dP9tK11Uj3iIdytZXfIjOPN+l/Cg/BYfe96qzzkpcNLu4dMAfhCOZWnScrDYXVy0hy6OrIeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4866.namprd11.prod.outlook.com (2603:10b6:303:91::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 19:03:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 19:03:41 +0000
Date: Mon, 27 Oct 2025 14:03:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 05/14] drm/xe/pf: Add functions to bulk configure EQ/PT
 on GT
Message-ID: <i5dgkgqu5paensngw45gstdxgdpjaqukuoi3ygioimw4vyia74@vj3vegarb4qb>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251020182414.576-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0282.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4866:EE_
X-MS-Office365-Filtering-Correlation-Id: 1032c378-5bef-4cdd-b086-08de158b8ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6VUnmfJKT4HGJeIIhERp0WBye8iXIFs0q3qM+kl2qWd3HkDExN7h3kwiuM0T?=
 =?us-ascii?Q?KuE9/k35HnyruqTJGQQj+kz+zJls0G6Zy8EIZnKzgWny3T823W5aY2hP1JEQ?=
 =?us-ascii?Q?d8//BH8KhZWsW05ggGYh/q+cye0RQDbiIg3eiNURPIpKw13kFMVwZDwd0C0G?=
 =?us-ascii?Q?RdcBBGj9YDE3N05OWzaAM1VCJPG7BFiQmGRrjS59NyeP4d5fmrTbQ41HUkIt?=
 =?us-ascii?Q?g6sKgAjVTWwbnzUEwD8xi5R+cI81xw8WVrNzxdakyRWOlnySQQrv3konrMN9?=
 =?us-ascii?Q?4bugFKZy7EUo3BaFE8soCIzg7aYfhc82D7L9eWNKyqgt/vXeHthPnv3/PJyT?=
 =?us-ascii?Q?KbJn29hswzMVUTYZTiBNZ/riHhrovdYJtSk2qKf6hD5neuvTyNyGbrMqKYHO?=
 =?us-ascii?Q?/Xu4o6xRQPF8dM9wNd785m2+tmhavQQzkEmlvM570P0b6EVdn6gNJ2lJoPnn?=
 =?us-ascii?Q?DedAiQbmJosp7qRSNNQd4yyH3vn8M7wilCdaJ2U3J/Xa/QNKwdHfCRzn9ax6?=
 =?us-ascii?Q?sS48t8GTHqbX1PGKkjLWR1XBa4JemZn60quofRVqh3KpBxJ5Dl3JdeO7HbhC?=
 =?us-ascii?Q?C8V9rKYQh1ISf0uwNyvJ/HQGYJSuo6JjsqH+fOdfSZzr8dQxU7WQXePyZ38t?=
 =?us-ascii?Q?RMgVv0A8XhRsHzVANtk5NzZihXXpgzDfQXCsM0YQE0sKcUxRIjrDipvZmJC5?=
 =?us-ascii?Q?h2f4ZceJAn9JwP4K5GpuT8wHZ7LF+jRwK/Wnc8fG4iuF73eX5O32qp7qqNQx?=
 =?us-ascii?Q?oL4Mms1HNIQ3kQFgvTxjx1i8+tz2L/fNZbhVoEjANnm+nmBgS3KLghS07cfP?=
 =?us-ascii?Q?kjxiAGDWMA7vwggwfZd8BwCMpi0BdF+ZSB/2mZooBZxPGnPYw9BusQUDl/0z?=
 =?us-ascii?Q?PaD7eypI4JTgsfdS1Oq+z7jmc+sOPw8qNcRBfZvkpUZmeEP7L6KszT5CUoag?=
 =?us-ascii?Q?ZncnWd73UcplplWwuSeQwHyxzHAblrKGuJ76nlxkvDPQy0gZb4U6fnc5mBld?=
 =?us-ascii?Q?3kx4Gx0AHz8I1IWXPgm2sHChe6Kk1hjvpXC8Pf+I8ge/815HsvotLCb3c5yU?=
 =?us-ascii?Q?CeMU9fMFvHOD1/FjxrT1x6pSuUmiTSPnI0pZzrE5tfFDx/Jrhv3eLUMYYspH?=
 =?us-ascii?Q?DKgV5lfM9atAHCF/OxyoF+W/s0Ll+nCSQwyEiJ8/e8FDUfKNEMOLRVv465KB?=
 =?us-ascii?Q?kL4tVd2g7pn+1UzmXeMs+yfoSMLbgLU9fO7VCCYo90iksi8vdnprfQVrcITz?=
 =?us-ascii?Q?HmxRZZAO+EyBG7YSPWLwXFRA1L4rELQZYoz/7+J3a6ZFDf/qdTje9Zxo+Izr?=
 =?us-ascii?Q?YcaYY5ontRREeVBQpIY9UxYpFtJ4YCDMgFLVJpBkJoq2o9xtAza9sMxbYDK0?=
 =?us-ascii?Q?ndQMzDVdlHFrPqQe0qEt7chtMgCnRKZXdJ+8fm9sXNDTVxU38Bidpe60bojI?=
 =?us-ascii?Q?PCicmkYXlg+GdgQyO7nbjyoiBtrm4tF5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X1qeQS9JrDpNjctRPnQexlb2eNWdHnryQIIZEG8rFPsKbu6IhrrBJE6inMK+?=
 =?us-ascii?Q?5D7JEtP5ar2M2b951W0kzTOrKdlnjloRtBSurlh+X9jVEDDK0MQjG9vtxxCy?=
 =?us-ascii?Q?yf2/AfohlXF1p7jvPJxn2SC4cX6JznOWQ7IcG8qP87UpAyMbXAdlGA9TSiGb?=
 =?us-ascii?Q?d4m/kA2xsCoka2WggsPSkctLcrjk1w3LKK1YwUBWvgJlA+5RU7CWzKSD8eaK?=
 =?us-ascii?Q?Fte+bHIs3cprSvUu7rsP86SD36aoopAVVAujWvgeEkYi86z544MOFt/I/fpb?=
 =?us-ascii?Q?OzO48YVbhNtk35sW6ZLTRigdWDIM9rtDFl22lYOgdEYYCgWjIgusa0mmePgZ?=
 =?us-ascii?Q?VVuKF7pAZzlx+tovEz85NxOl2Y8ylATCrGd+8enqLjhh+B67Nu4RJzMeE4EE?=
 =?us-ascii?Q?7BPjmlHu6nfyvAVl2qxwdDT+vlQoEcnUksRO8JsZPjB0sJtKdFSsFVND5CVe?=
 =?us-ascii?Q?UnZVb3RX8qXSmTbKUZG4Fc90iR20tzAJOBs82XfnRFbB2T8byGg1Jfg2a3tb?=
 =?us-ascii?Q?e3PEGLqS0IMQe0hzeuijhfvvlliGpwq3CaZcm1V64MlWdoovtKCrgRJez47C?=
 =?us-ascii?Q?RBenaK/08tGTPjVAQ+iMR96yFE2UtiODmZcLWEY/xQlwrAuzjdJpcAxoMaCo?=
 =?us-ascii?Q?Hnz6hu6bW90DSltLoJqYqvwrpqFoY++Tgg9oWuxOrq/SgRgs9YsU+GVjhQy1?=
 =?us-ascii?Q?c05umv8lv1bhxJX0XYjOeLpE/FZWS3WQ0MXnXnj2GXDbpIoO2bzgSyT+tFJR?=
 =?us-ascii?Q?RswYPZ6II9dPL5qcse75udMjNYDDsD/I2p/AMO6xXaDhOWL8sBMbTfw4PoMR?=
 =?us-ascii?Q?/QB30XrboxtOSybS+fKDbJcpruHY/7/eEB1T11o3mLHy0zWyDspWLo2eMGk/?=
 =?us-ascii?Q?AdcGIvsaOvyMGjrUhUoI0q8yn6g0YpXsDH/aY55mBIcznSETvEJXBon/b6bU?=
 =?us-ascii?Q?g+8yxoO9YHN9BZ55Nxpb6s6BInCMwKGsndzoqo/Akn6stIUEegDncE9ndZwc?=
 =?us-ascii?Q?3t092A8Uh3hpbvcFM8+/60qYMIx0ffKz0rZ2Ij8XuWcgpXH3RZbG07nBlJV8?=
 =?us-ascii?Q?8VZNxSA/z5wNepshn2WLtOZG4XKa/FKyYGTZCae2u3eZGTi43G2uj46PXGzu?=
 =?us-ascii?Q?FB3prD7ENiQipypYGqPhlmMMtixHJbPy7YzQrfJiNkdo84NdNEOcB0DQ3fCu?=
 =?us-ascii?Q?PrxTeF4bWbsgs0j80yPF3qVDIdaWSyaWLDm+JB5KvHTV28bhbBd6EtQQOXX0?=
 =?us-ascii?Q?91SIQvvWIPw7vR/H8ApnrtljiQ4trONHWGzdJocikxIRGXC3BV3Ag8LZ/LaE?=
 =?us-ascii?Q?4J2d1LfRzXCC3aG7DimD73SuOrdU2aSfmyryCJqZlmh4HwooJj8kS2B5FcG1?=
 =?us-ascii?Q?OG4ShUsOeF0/081g+FahYSCuRSb4BxbusezlhA7z5gAUbwaVhRrD4bmJEUqz?=
 =?us-ascii?Q?5aKckkmubLIl+zUNi/hPP/xv7ZJfLw+Ntu54j8BQEx70v26gCYUEyQYJsqMR?=
 =?us-ascii?Q?uaeH8ojR+3C6tkWdXkAx7+BO1u+EImNprQVklaFloCI9YFTSgLgBLsmYCygc?=
 =?us-ascii?Q?/pZY6QR3lrmoRfOdBjqYSSmVI432MFVGkjeJluxbrp2jKZstdeHVU6P9oFZ7?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1032c378-5bef-4cdd-b086-08de158b8ae0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 19:03:40.9734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOaNtW8zvpoMojM8gomX8V5j6CHpP+ytwTJaSYKpq58J2wwyyLPpPm4I3F32nlgGrfr6YfhaEr0xuUmQaFfVrJOgHnG82fEXky8T3UdWJfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4866
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

On Mon, Oct 20, 2025 at 08:24:05PM +0200, Michal Wajdeczko wrote:
>We already have functions to bulk configure 'hard' resources like
>GGTT, LMEM or GuC context/doorbells IDs. Now add functions for the
>'soft' scheduling parameters, as we will need them soon in the
>upcoming patches.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 56 ++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 +
> 2 files changed, 58 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>index 0a591b86d94e..99d5fb68174c 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>@@ -1778,6 +1778,34 @@ u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
> 	return exec_quantum;
> }
>
>+/**
>+ * xe_gt_sriov_pf_config_bulk_set_exec_quantum() - Configure execution quantum for PF and VFs.
>+ * @gt: the &xe_gt to configure
>+ * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
>+ *
>+ * This function can only be called on PF.
>+ *
>+ * Return: 0 on success or a negative error code on failure.
>+ */
>+int xe_gt_sriov_pf_config_bulk_set_exec_quantum(struct xe_gt *gt, u32 exec_quantum)
>+{
>+	unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
>+	unsigned int n;
>+	int err = 0;
>+
>+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>+	for (n = 0; n <= totalvfs; n++) {
>+		err = pf_provision_exec_quantum(gt, VFID(n), exec_quantum);

Given now the function accepts PFID, it's weird to pass VFID(n).
Any advantage on using that nop macro?


Lucas De Marchi

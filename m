Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BE2C04FEE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1962A10E542;
	Wed, 20 Sep 2023 19:31:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801CE10E549
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238280; x=1726774280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uiUSBvziLono7eIWS1JIY6NCFGKnypFg5/RBQdWbCZY=;
 b=A8oSbgG+HibVB2dQcJgijTdixq3z5kQ45nP4svg8eprUCnsbvydUO5U1
 OSJ5qy6b5U+msNMIyKXIrlwwO0SKSjaItt87vJSfcYLraJ0P5EcT/Z6jC
 keB0EeYcNjPeA/CaWNuc4qjp8Z23zAfGvARfQr1ibZbZEBGkJ12KdHHCG
 qQk1bS5H7EP9/XjPub1s6Yk0zhUF/xOaBnK8rD0dn8NAvINj5UDdpMQzV
 1nHgvpG0WNhdXy38CJm30yfEq97sNeIkWMWM+MsxgIzxpfQgqRQDHFNi5
 B9bOMAAeU2bFLK6grGXts/2z1OYC5Yi63S/f7zuhzsvtF0colv2VUNbYa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359701435"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="359701435"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870498884"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="870498884"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:44 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIfi6tAee3ePkz5mPs4ovqm/cEc/Dcq9Kdb/utKKHdXDKO1i/ImgBq+Q5+B6U0T8mMMXNp0FiU4Zn9xRIP9b9YQ8OYr/G1Olo+w8px1IzTK00CGcTMdF8d3lJhSxclo0UUXW2s5R3h2vhMg2TSRecJ83Uyyceo0U889ifyIenBrn25dPEBKaAQS9GQVWpsZASaqaiIRekcmGYtv62vuc6VVVXa1kyluG+dLbM4WcfXmVOI2yKw5cIFk3v2EehT5eLGzxpths6LHdSCeXDs1UzvDABwBQexYHf0TRRXMYMUTDwzBYa71M/BJT3Yro9kbk/jmytiGyAww54iWKpSDyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9BNzbsv+oEE47BtcLXW2LKkhl51MSLq29G/kIc2kI4=;
 b=CTyGyVZyLdHpNcxCgOwCd7DMZg00wb8nI8f5mj644xsgHwu9L/YehTOAAdeN+VLEzcQCvGiabo3ELZ2Z2zMc/lqymQJGIlnpMZBYODJ361SQs4gFLLjj8E6wTGzuKnuT9NoN14yj9JU+1GWJavYuJhjac0WwDRvhw0HdiPMZ4/oQJQR2rfFZEk4Mt0cqh5TV33IEzrPI8TSAoG+lB2WJvjKZetqH3+NJF6aDsfkokGYWJ1RdB/j4VExfxJoLtJobUTmjI5S24FL1UyLSFg12xSj1HXjrwx/dzV5HCDtAE7GpVSP9XdLpwrBh+2UQnyUO4oEgEooXsN6vtHD7Gy0SlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:30:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:30:42 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:35 -0400
Message-ID: <20230920192940.135004-16-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: 225e6155-3cd3-4c34-ec22-08dbba101432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l1RG4+Pnpxp+foLLjdQWd+DVrqih/IPTQW0VUh+V5z7KvFQVkt1urjyh9djL/O7ehsfv3JRL5EGGuNVDEUGJPwPXvC74mmxMEasWfl7d0DDC2GXdSuW/HOkKmYF4PPQLF7R+NK8YWjw7nWH5HXm9qtXCOPFPJEmoGZfP/PT02hrQyZFm8GO7UPoA4bSeKjc1MBPI1Ab2+53ip8rjr2hWEwY8bYsewguj0Twh1EaZABSAWMEbJeuiTfzn3fKXoYbeB7KF5Og5tL6tqLKR3vpMFGJuhUkY9JIK60tF3gc4qeblfa1e6wZpRGbsko/K0Oyq4ehk7vRYwZR1dSEirNfRfAWcFRVh9VVAg808T4xZ9/p3UiiJKIFbRvgWleeQzQ+GvysdXBCj3LSQWRruu8PhBuKGUt9yV1hqqKQJLdN1VIHSElD1m1veISpxVwPN9PdbUo7+5kd+uBsRfEPRiY3g1Zl7LDm9r38ynnl8//FmBru9zrHslsWFIgtPA2+E58BjiEGAR7EZWpyHcHHxl4sKrynD8mxQAid+Wq/BXYT49iJpQBC+eCXqaUvj5JWtbjLQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199024)(1800799009)(186009)(6512007)(6486002)(6506007)(36756003)(82960400001)(6666004)(83380400001)(38100700002)(86362001)(107886003)(2616005)(26005)(1076003)(66946007)(54906003)(66556008)(66476007)(316002)(4744005)(6916009)(41300700001)(2906002)(5660300002)(44832011)(4326008)(8676002)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B/qRdKyTaVOFM+w2fBzUOBEfMVMP+b2WBalEGToTyaS//GZuj3fsITmIT92o?=
 =?us-ascii?Q?e22Vf1zWyR1FdzidKjhQlcjiYpyfvVNeENiH/GfzMCWE/2ofZ0QsSdO437CJ?=
 =?us-ascii?Q?oek1BwpukzcQFZU6/xfwJ88sRQl8KSF/R5Qfk8MJbJC+5ZQ0QIOtg9oD/Ym+?=
 =?us-ascii?Q?W/07NGrjViky7GD4q6VSp3nPOI9u23rJOuDN9Ofaysv6Ql6WWsljli9dBAOs?=
 =?us-ascii?Q?CZIqWw0PQJuzrawSmpu3n6baJRI6n0rtl3VkmONwUL5ShgyNv2KiCPFT/zkD?=
 =?us-ascii?Q?Q7xtAqlhM/lnp1Akav0g0Uq+EOJXPhSxnWK6gs51j8OJvFqSRomHq497JSnw?=
 =?us-ascii?Q?/O6RZ6AUP5EZMZ8puCc5OAIqPn7LG4OMXrMK2tIPGpHHYpo+QHlRpJdlKENb?=
 =?us-ascii?Q?9TZ/bh9YVUR8E81eggnMab8J/Et2gzRR65q4JHCzlueVDkeX8dPXOr22ssCF?=
 =?us-ascii?Q?gqlMXsw2Gpb//L5TChviLs24De3oTixZQavhdlaQxq7ntlKkNLIjRKTHQOC3?=
 =?us-ascii?Q?pkKiOmhIlDBwWBpntEiKzZv2Jluh5QeUM3lVHu4AwQvYIsf00roe5EXqMI+W?=
 =?us-ascii?Q?ddeTQ7R51oaZn2VaDJNFwqtar0d/Se52fQGIx0Ie1XUZlU8lietJY/KxG47j?=
 =?us-ascii?Q?C0aXJ2ikiNM+O6hys39KfdhlcQ0HXw/4vYfqpawmAk+tVqpDORF4STGsHUQC?=
 =?us-ascii?Q?+o4jrq4P6oAAFdZxbhz7+c0+K1WAi1/89GGG8aVIQtPcU4pBHg7Sn8PLB9zT?=
 =?us-ascii?Q?84rTFh4ijtkcAQ+IFoesxSxUwtj7R3hRrsgSaWIANrtTOwMDlmX1k6QfiYHt?=
 =?us-ascii?Q?egBp8jsygsDAYuuLhncm5XrI8X4iRYNCmzdFn2XnY8uukTfM3vyiu9PJ8DUz?=
 =?us-ascii?Q?34he2Jfs84/C2IHloqvKZIuRmQ2TAWcOXuif0C+/4KQhd4bTPe64MEcF6CBo?=
 =?us-ascii?Q?lAsnmSLH+mTOHa//M7q3fye6WVovOpSaRmbDqGgspY00211/hLwdHRanCea0?=
 =?us-ascii?Q?wZfEtAjP9+a+BpbroqWWqPLEZxWXuGOXYgHqAyjGTKRBV77XyZA+Th1QZhYc?=
 =?us-ascii?Q?eHhOiSfJ/lZ3uChyO1dcoy+aVxFjmfwo/WuwekV0ZN/YIlBER0XfGcC/ASue?=
 =?us-ascii?Q?S94R0PkQLiaSZzHYBcL5ZIGd5svBcg4KB+Pj7mqqkfDfq2KnXkl4q5mbNMb3?=
 =?us-ascii?Q?Vd5vekjF0g70Ihsf1QQnp1YnrDqTD3c5UOCEnGF/jea3Y8DIWrCN12OvLv1R?=
 =?us-ascii?Q?srRV02ZwcTA6CmFJCof4YbWYNdGGh6JOBvyc1+q1y9rmvH0pPdgo2+AXBT2G?=
 =?us-ascii?Q?bLpL/EeB/CHTxTWR47+8fWcg+daz1xQyLnu26zpYq7aiNMYwP6ZFSIwoie3o?=
 =?us-ascii?Q?340E2qXjzE7NSQVIRLexy7+4Tnr5L8FOp6owKOg8PXKEuDEoC2eiJdlLcV86?=
 =?us-ascii?Q?HIkV6klHzQDoczV+qrkJRHbcEiATFfqmw/G2XJ6NQMWmaByFdwuawm7a0yYS?=
 =?us-ascii?Q?Z1a2UqXsuercP0v5Pb9GkQsuNzpAwASWyaXL+cU5j/wmBPz08leMZuhpW21J?=
 =?us-ascii?Q?LWy4UV5Dw5ywFqgrpx17yuiHnsb1fiju3hDHQ3tni6v24XSV7/TSQ9OIy25J?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 225e6155-3cd3-4c34-ec22-08dbba101432
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:30:42.6503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHJYRwJdaZTpWzsA+94BrrQPNiKumZdEngkC3K/SMRYNmKMBz0gjm53pauS/8v+F8y71AumpNlKyUytKAEAtVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 15/20] drm/xe/uapi: Remove unused field of
 drm_xe_query_gt
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We already have many bits reserved at the end already.
Let's kill the unused ones.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ca93b43fe3c9..7db4cafd4651 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -354,8 +354,6 @@ struct drm_xe_query_gt {
 	__u16 gt_id;
 	/** @clock_freq: A clock frequency for timestamp */
 	__u32 clock_freq;
-	/** @features: Reserved for future information about GT features */
-	__u64 features;
 	/**
 	 * @native_mem_regions: Bit mask of instances from
 	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
-- 
2.41.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FCCC7619A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 07:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A775E10E4C8;
	Tue, 11 Apr 2023 07:01:21 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EF810E4C8
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 07:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681196480; x=1712732480;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+TmglI0R2EUpDB+uMZ2eTFukuI9e9r5vj/8RG5o6Bqo=;
 b=dcJUqs2lxBoA9c6CI1M0waxX7qRlg3zsZQN0hHo8cMJfadhsu9ltYDFm
 Y2xwIlW+6P9+q226cRNapxvnj9lX62x7ex9QQRcK0UMNH82p5Yn3+kumL
 fhj4NdgwBJjbuIzNZkFCZag2ZH3xcM2PIOMxJ4MeykU1R2ZV4wuxz5l0h
 NOpKcIyssAlahDo1Mhdfo66OyNQhUyOGEGSD5nw2cVz3ENLbsbgrKh3+A
 lfldEDYMViaBzHto4NpFU1fTsFdPYcJGsADQQ7igYonQ7syElsEv3NsSt
 D88GKLLO6VPlv4E+2dWQzaIPfeWF8AVALBAqqtheSqxLCw2KGyuyoil/x g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="341031025"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="341031025"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 00:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="1018258593"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="1018258593"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2023 00:01:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 00:01:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 00:01:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 00:01:19 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 11 Apr 2023 00:01:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3OMTU+xIShlFj/wXmHM0UwalT5SVniIjQRpVMVl365MsfQvn7NCn15/JQLlGEeu4UZdbfigRizFt5ZfEMIEcCe6CKf/XesgtgvQ/scLZ/0tLcXopWtmcal5TzpDDYE47jo/t/Ee9V7c6KHNBygIViUdqZORR6SLgJRIh6wt3ZBwBSn4VBFE++vePKyp2GWiXGU0mbtZcYUT3urxHxecjJt/an4u5b4qRau46I0XHEPH6AqTFNhchnneCFm8rFrhddN5bDwitk+EdkX/Ud4aekCcPrRq6YUUCvNixaG8qjH1ieJdd6eiTHH2lu5BWuaFRyYT69RsA3Tddgh1n9cdBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGQnIPdf4+Bv3fcDW182aWUv+D1YMM1YuIH0eWTvoMY=;
 b=e4LUvzDnH/KPfK7H6WTNk2VVH03y3ExCGX312MVDugqJpARhN75gyXghaAUNGtX8V0p1CUM/6p3iKcVoD5ud6NlwJBVPUtTE8fHytEuwdX4JcBI7LXrsPLKRCT9wutH7D4R1v/YEVPM8soCBzQJ/kB8Xd1D1SwoZwR3o+02dQW3FBb3t8+NyIN2i5fao0xxgwCDSc37cK/6hxj2sa+QC99O1c/eV/Avg0sPl88Oo/fJrlhISR++eTw4xijDRjMqxp15K0c9dyQaPAWh5REIfv1kjhJUUSAIXHtt47ORq4H4lnpyFNMOr4NBXgOixfGW7xsauLH6El/HM+jSGrWZ3qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Tue, 11 Apr
 2023 07:01:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 07:01:17 +0000
Date: Tue, 11 Apr 2023 00:01:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230411070115.dh7mja46rleguff3@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230410183910.2696628-1-matthew.d.roper@intel.com>
 <20230410183910.2696628-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230410183910.2696628-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: df4f7eb1-bf69-41a1-ef04-08db3a5a8bf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pDGkwc9Y5JvLd+Fv30XCN9gyO+3mHFA8rikeLmOrdC0qgqFX+qhHlA5BY3IUrJ7xuWSiex5j3Iyqqs6aKVJaO7RATI5lQpYK2kONRVpDStBjzV5QXp/bzpH5FgzBxqR6AH/xV1Fiz0WlgcA03r3bHzDOtjP6Kapf7bKbGExK8jx1kZg22UshAA92SB7O9x8gusgzNvz9D2MP8Yt8Cda2RpDsgJv71EAUy8viCmx739liT4WHdwpFCpuu00EuC8cQLxpI4+NiC9CzvYZutFGuwY5/ZzekIcGSC8qmMr6vu24anLS0U0vEDo6zeLcm5l+kaJluGIobmmSEYUldNeeL4NDYs2IPd/JzAZ7IeZXChXfpRuEtCt2CZ4S+ucIxNhKd83O8bb6zgAKmuQdDQXcLY7KIGlJEkIw3YlsWJUZ6kNZp6UlGBnddcTaKOTUfRv7BMP1xyA+IgQuViBEN0POif3/oofNdtRQAxsgoKQOInWv++PgvABbYSMBirYtbL/iz+W3BcfHd34K1xX/A/+YUgVuwu85Mqq+Z2gDdglHU+m4jeIueFO9ZtS9bEbYzwzjZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199021)(8936002)(6862004)(86362001)(66556008)(66946007)(4326008)(66476007)(8676002)(6486002)(82960400001)(38100700002)(478600001)(316002)(6636002)(83380400001)(41300700001)(36756003)(186003)(9686003)(6512007)(2906002)(6506007)(1076003)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5mrd4QPiREbifmY1tjNyQHA/fKLBpRH3jA8X8g/af/3hWvXAwsk75C0UM8S7?=
 =?us-ascii?Q?+/ufyjpCWwcGsGEoCUZfZscx4PaBhVvZUu4EBM1OAtoKamD7/5weluxFD1ma?=
 =?us-ascii?Q?vfTLvIOM9QnpvGx0aI0XMdjDXo5mAmJPgMEMCO4n4uFxgG0lKdi4JD/Jlixl?=
 =?us-ascii?Q?Ui83jWvA0LKsYcipz7ycLqJdNdkoPfokZHk7tUo+me9PX63zdc2w8ETm3A5J?=
 =?us-ascii?Q?+ayG0X/QBJJ08GcJ0wyC0L8qLFk7oTjtbRXm2x8OJEdCG4JAP75SmA/BC1D7?=
 =?us-ascii?Q?TAKX+ok5y5I6XHdOOnEIG0dTmYRbM276a0Z1uAfKlRPrP5uGb5fbY5IubDTg?=
 =?us-ascii?Q?aOB5CbFqyuqpbMMpomJw9KTX7EuCeefKWpWdOW3/4KgfhaVSBCEyvcfEOoid?=
 =?us-ascii?Q?/NJp6enY53U69rGDXYKYe7AVIj0PtCZ+//6l3Z9j6Mto63qyUl1W5vOPKQ1T?=
 =?us-ascii?Q?zp8u1IFKTAC3PfKsLAzyAF5mHYE/kzoGRVUKixDFz40fKaDrFw2AnTWGAnJO?=
 =?us-ascii?Q?JrzyaYO96p8egnSPxQxpHbjBDH2kbog8jO8HLBPdwOw0WdWs5bew5uJKZGIh?=
 =?us-ascii?Q?la9c2prUipiLZs5N4ah4phzgteIGPhl4pQrgXRx5uwXoxM+b/fLxmcAuTL3C?=
 =?us-ascii?Q?yycc1qRASuzKifa5P+uOECbnenHDuG+9TSyvWdKRU1ZskuNjRz9LFnsZPvoY?=
 =?us-ascii?Q?oFCjKercsd8kadJme/Xp9F7tLmpSjLsLfD43NfHy5gtwanjs6SfxnkcLnwAj?=
 =?us-ascii?Q?3+3cInKU6fiqyn+76/MPE/fNoA8WS0EhbVAMI7Flbaz9p7hivDlKkSUpYRmc?=
 =?us-ascii?Q?ZAFFgR+ydBNDY8HGkppBM1+8M3GAEAaum64otNNyqtdhzuoQlXRovdpmqabS?=
 =?us-ascii?Q?oV4C1XyNDZ/WpR5ZgZGORqCHCJARqfLVXbAgjyavmtseHEfMBK/FvF+UOQLg?=
 =?us-ascii?Q?ePMc/yxqgfEwAkQhOe6qUwy5mLFLzQ3PyL1n3U55azRnYeJfj5W1K0/USEhE?=
 =?us-ascii?Q?A/xwqlV5xzx+IfGsIYwVuuYxRfafMsTpgRGlGrPrBOURZPUyaEBT4XMVNE4c?=
 =?us-ascii?Q?QQJBbUq0HlDyJPKiMTDbbnqaru4IUtfF6WBY4l/wWHcauDraod/tZw2Vp9/g?=
 =?us-ascii?Q?Dy5lnKDgaxZxWZYkue87ao6K4KeE7x2GmGFMDVpnY4DJ8zKEwSoxhKyiKPzN?=
 =?us-ascii?Q?ic2rQ3pl6WcKpPi3KSgoM2UuiXfQUFGHdaX+3GedqxnVUtVozsDmxKGVKDDs?=
 =?us-ascii?Q?2v3WTwVke6PJke0EY5jWn2fI2a/3x6pqIjmLnMMagWq5D7Cthn3Y1NIMoA34?=
 =?us-ascii?Q?VpxaBvBT3eCWIOeed71AAY0gOXNjMllzTpXo+JAleRH00YAQSJc8XSQpoRYc?=
 =?us-ascii?Q?cwoJmZMaV3nacG9z6R8egDPUrxZg6bhxcJ9KU9FbexEhUXRZm4ErGkh9JSRE?=
 =?us-ascii?Q?ugs1hWOs0hoaznlTEsDmkTQAv5NPDAQox1J60ePxEG2SdqTsTDn1HhF9I56n?=
 =?us-ascii?Q?FvxqG1GntptKc5DqJjBxr3E909TXKo0M3p8AgoVSJ6bhp37nhiwTuqvGwXqu?=
 =?us-ascii?Q?EsGv30551vqQHrX+VwZ3cBxkhZmP+GSAcpFGACPARMe4dO8YaOmaz8IxTjSa?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df4f7eb1-bf69-41a1-ef04-08db3a5a8bf1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 07:01:17.4334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gk/UkurQRw9F8mDD4+DcJ6lw/uLp9EcCn2kPilDv2R317uJ/hGencUsxSs5z6FSpVfQd/33tWzBI0ko4v7j/HIntt8B+hopeyjzByRWGxNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6570
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Only request
 PCODE_WRITE_MIN_FREQ_TABLE on LLC platforms
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

On Mon, Apr 10, 2023 at 11:39:10AM -0700, Matt Roper wrote:
>PCODE_WRITE_MIN_FREQ_TABLE is only applicable to platforms with an LLC.
>Change the discrete GPU check to an LLC check instead; this take care of
>skipping not only the discrete platforms, but also integrated platforms
>like MTL that do not have an LLC.
>
>Fixes MTL dmesg error:
>
>  xe 0000:00:02.0: [drm] *ERROR* PCODE Mailbox failed: 1 Illegal Command
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pcode.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>index fb1ce2d49bec..99bb730684ed 100644
>--- a/drivers/gpu/drm/xe/xe_pcode.c
>+++ b/drivers/gpu/drm/xe/xe_pcode.c
>@@ -210,7 +210,7 @@ int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
> 	int ret;
> 	u32 freq;
>
>-	if (IS_DGFX(gt_to_xe(gt)))
>+	if (!gt_to_xe(gt)->info.has_llc)
> 		return 0;
>
> 	if (max_gt_freq <= min_gt_freq)
>-- 
>2.39.2
>

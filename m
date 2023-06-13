Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70AEEB64D0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 18:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678A910E350;
	Tue, 13 Jun 2023 18:00:21 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CBB10E350
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686679219; x=1718215219;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=91OiBkzsz3rAaCXMZ8sGMhDXqmBiJ2GeiiysLVWj+ew=;
 b=ZzvfSLkWas4ZmFe2lDJ11igORL8JQsk/l1XmjE4ceFkPAN3xJHl6gZf3
 Ngx3nMs27uzNy0+PDLtE/6+M16UAhk2kgs0AS7RW2YWI1Iac2gijB8LUK
 l7Q1iAgfjRhmWPc1Ge1MqkBn4Zw/19osDSi/WvJwJu511Mtz0NpDibLtA
 NxR2VCOUU51D2ZYYiKWYbhwX6MgimkidmKJi6ftvjmnmLtuxKkiGZuxqW
 td8CRDc0UkK80VqTD/doZy6njkwCf5a97ZT29Idp/EIh+KaYO1p9GFzj0
 x4NLc62VYT1OjHgkEIuUdZ5LWwGQRKH9jf5meiNDgE1OufEjIvpv0je6u Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="361784393"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="361784393"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 11:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="776925033"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="776925033"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jun 2023 11:00:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 11:00:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 11:00:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 13 Jun 2023 11:00:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 13 Jun 2023 11:00:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCbxw+PkBb1q5BrIkGijMAFq/0viCvANwSfHdv8695LttoRo6xUsqhzjG8FMC/xt2rGMXVf8DUMQ6D1I0u1Soz8Vs7LP3SvYeG1HpKDjMPtvjBMaIMhsVF9c/Tt9jJxP6PLm5rQUFQY5w06wk0T2+W7OncXeOg2aIS41C3HWzXVjKIBCDA80KHP8tARs8DdVW1lD9Bnkn10hs+r382PKacSEqdbmi1ZKU4FSyt20ZK0ZpjdhTuLGlWCy3NKGoi4Ws0tVtT53xfjQEZb/YcgJa+gAQtYXhoEgcroam/dZyNdTo6eiA5GkU81ut2qswFy0+JC8jmgPgHB+jMnhSH0PsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eSgfcnZSo2TOkzm/GYgf/0YpgxTmVFBuzQiQtsRX8I=;
 b=Pm4vPnBrSxMAoM2mkIHpUvrJisJBfGhuGyd3fB+FdsRqU+/3KmUI1UDYfg3kLsar6JOJfqp7pcoYNV8htNrSE/WGUwYc2Am3/fh7yDg5XBe0z0gKQi8aXhlpPKTTWOid7E3oUzG0xhStSaDXZaRJRhxBAIpWpxujYLIKGue3kRzdv7qT7t5ZrOtmdEKfoz56fipUpGTsfjBjkfo90oj4RODadbldKmvhA+QvEWOa5zAtKkqwXhp7nB1FxHRTlHeWShcuBNpF7FA8NfpTBoakki9lH99drJz9oek+EI+UGKmONPmNviZaOoOfnUUD/saxcToqefT+ltMocXiwkJAcrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8479.namprd11.prod.outlook.com (2603:10b6:510:30c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 18:00:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%6]) with mapi id 15.20.6455.037; Tue, 13 Jun 2023
 18:00:13 +0000
Date: Tue, 13 Jun 2023 11:00:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <r5u2yo6rdvq2cnrefe5n2xtub4lsd2e66brdgktbc5hfafjm5i@agvekhrsuj7b>
References: <20230613174740.786041-1-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230613174740.786041-1-anusha.srivatsa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8479:EE_
X-MS-Office365-Filtering-Correlation-Id: b6942751-47c2-4e6b-e1ca-08db6c380994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A/2jti6pLJ8+84miB81Wy2FcCoW8m0tr+3TIS/6Xk5r+quNAMziDuGoQDG1fZtuse8aEN3hnaX4MvAhIILlMtrFj2DDKoNmaN5r0oRkXirQE4kCPuF1DcIWgDtsczLy8XcFOspe4tt+Ouw04WrB78ATQq2M0cPRXTbTirYhqatg+F4exqWWxezIMqeqbcz/LcqHbKrZJikluQYwOswxF7IJ0THQAoWiPLgc4rfARQz5z2bxiAJs5LIaFYsq5hAYnToN6ep5sKezfkd8g6S26U3RgZy+GKZ9OLmxUoH+witY5A7ju/zfeUqIIJ0z5HvzCPx3nLI7p285lyjPrXADcuvTBem38ydhyEY9a3PQZBpyo+Eo2jopWU2tCzqDmFloLVRn/KN5ghkz2P36jPuBDaI5/AULw9W63LGwoeUu7iLri+Lh+SLa1fdcD6FVMBrDYB2Vt8MhuusH2dieez0LJ65nflKMcUu/rR9+r7sR/WjbzKeLp1jj5l052EnRBFQlh/82Ebc+wORgLqr/uHYNdvGlH7kjLQ2IncmSgHpv4pJQ+mmIxRxirFS1nRQnlaXzP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199021)(5660300002)(38100700002)(8676002)(6862004)(8936002)(2906002)(33716001)(41300700001)(316002)(4326008)(82960400001)(66946007)(66476007)(6636002)(66556008)(478600001)(186003)(9686003)(26005)(6506007)(6512007)(83380400001)(86362001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fpAdttxzjEgPHWozRx/ahMBZ6/zHZ+YiOqTIW/BmLXeMoncRsf03O7cGiIbl?=
 =?us-ascii?Q?dXPLo7VzlVYHphenX3Qw9zCGEy4jZ1UwMBPW7a763xUAYZloh1FO3JqWobCq?=
 =?us-ascii?Q?5RgTDogxf4XPrRTo1Hi2BUqT23Y0XpSyaM4cBlL4HWlW8mEhyxIF2vdDCv1R?=
 =?us-ascii?Q?HB4c1AOzMsnUNCm3N7vbaIJcMRhb9GN5UDJkrhK6COJR3+HPI90JX+6t29ow?=
 =?us-ascii?Q?XfrkYySGHB5mD685G0S7pwrMDDBv1Kqjj2396EmqRnG2nU/QNZyY72kbgRKh?=
 =?us-ascii?Q?oz0YoEv+RyUhUBCKZ+dhqlxWjc9nDXOePejFBQS/8Tww08gbYRSCE+F1R+ZV?=
 =?us-ascii?Q?deuGdvXVMo9/iMl/qOdHZRG0TAKsTye2EXFOp1VjYzI3Yo80FgL/zHqrBRFX?=
 =?us-ascii?Q?5m54o1kWhYOAKz+sd3Y0Bi2+r7bOzYk1x+mYPk2rZIGV0H3liYQRMzAOoCYb?=
 =?us-ascii?Q?msBWH7iz5Qid+K/lNrvIjefh/elAsUaY/9enowwYJZkVBQTfKRo+yiiypHlk?=
 =?us-ascii?Q?rcnkiK8BNwdXHUadx387WMCCiX8/gDxJiL2w0dqlsOp5v4SrG8QxHEmJ8IvH?=
 =?us-ascii?Q?6cs+J58H1SfT7Yi1uwHV8IKhdHnK69gGW897FjmmFi5uVP+Z8qrL6n+ByiMV?=
 =?us-ascii?Q?PXtLQbM3RKpaCnk6T9fd77QWWUrPrNpeIqqta2/sDQVEIYU7tal7oiKun8BX?=
 =?us-ascii?Q?Jjbzlal9kctXv7aSkf2V2r9qvHlluUB0Ie6LSXIoVwkgKZO3uvcAId30iKZC?=
 =?us-ascii?Q?ByMi+QK10yZPTqcPjvidqRJ6hC3Iau0IsFIVof1JcmnFL747/TFRadxSKe6U?=
 =?us-ascii?Q?iDNZi2s8zGrG6LKkqadW8Wdy/y6rgiJRmdYIZZWpPHNg9d20ZS+PeJm2LZDm?=
 =?us-ascii?Q?YgEi8MNopSdqWgyAdokdufPKNfETfKSnxQtSkqIfPkrxFbFJwqMmmqivHpH6?=
 =?us-ascii?Q?xvKRxabe7yJwZg7tPD3V+oE/SBJvAfh6VWn30BiQooUw38PIo0cms0PARzny?=
 =?us-ascii?Q?OyUNSA95kqTz7PFuCrTd9HjXMuQXXtnH+SXlC/8F+Wv+jCnNit3ZSizGvsqr?=
 =?us-ascii?Q?nEFNJPoRH+8YEGfDjuV/3DIwWNPEcoOG+IKP3mOHcUnTbk5/ZmGB88C3Xp18?=
 =?us-ascii?Q?agmAdTbtFH06/L1t3RleXO9ciBZpyFKgHlcJOtN7QOsLjN+BmvPT8hBtDQB0?=
 =?us-ascii?Q?MicMbFCIrYISO1VpoH13jmX69xR5tRqbbaNBZsZ5b15iMudjJrYwmSggKsI8?=
 =?us-ascii?Q?DsTosdOb+Pd+bnTkTDQEzl+MJpZdJbnhbeb7/gw8ZhSQWX06YtUrtd1E8U/6?=
 =?us-ascii?Q?pU7nr0y4R0ZTVvUKK9ToTJgi6i3yD+joYYrNIJj4C/ouB2Dj/xy6c1ApoJqW?=
 =?us-ascii?Q?4dn+x4uWHYuJlcn0xW0qRDRR7qeU/engXxSmba5EgQp2dlnu/szQroQH9fXP?=
 =?us-ascii?Q?JjJ5BlaZIu+RAEmsOsPFuoK+ANK9XXDcWgH0j1H4LbX4LWu8qoXnk3me0/Mv?=
 =?us-ascii?Q?xKEZ/E4KHw56rWRD9/A89fTS6eu6W3eN0Q10PHSdC3GvtTkjF0terMkOEu3B?=
 =?us-ascii?Q?wuseAK1B+ZZRkkg4W3Ta+qQ8sep8mMmsTir/ilbDsMkv/X7knB99wqt7MNnC?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6942751-47c2-4e6b-e1ca-08db6c380994
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 18:00:13.9124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ersXUMcW+cMwju/AePh4Rqd+vu0iMf/ZwMrfuW82m+TE25LS/6YW4XU9B9kGEhnfeuH3twKggyVCHqL9NYtI4MWCXwAVjNkt4Na84wAWLmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8479
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/kunit: Handle fake device
 creation for all platform/subplatform cases
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

On Tue, Jun 13, 2023 at 10:47:39AM -0700, Anusha Srivatsa wrote:
>For platform like Alderlake P there are subplatforms and
>just Alderlake P. Unlike DG2 in which every flavour is
>either a G10,G11 or G12 variant. In this case(Alderlake P/S),
>the Kunit test evaluates the subplatform to NONE and is
>unable to create a fake device. Removing the condition
>in xe_pci_fake_device_init() to support this corner case
>so driver can proceed with the unit testing.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/tests/xe_pci.c | 3 ---
> 1 file changed, 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index 2178ad71c0da..a40879da2fbe 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -139,9 +139,6 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
> 		if (subplatform_desc->subplatform == subplatform)
> 			break;
>
>-	if (subplatform == XE_SUBPLATFORM_NONE && subplatform_desc)
>-		return -ENODEV;
>-
> 	if (subplatform != XE_SUBPLATFORM_NONE && !subplatform_desc)
> 		return -ENODEV;
>
>-- 
>2.25.1
>

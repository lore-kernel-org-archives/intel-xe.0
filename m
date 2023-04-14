Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CA7C77B72
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 17:50:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F3F10ED89;
	Fri, 14 Apr 2023 17:50:04 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAC310ED89
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 17:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681494601; x=1713030601;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K/r6yCxxCQpgid8Vg+3lIUPqWMDqhJK3a1GZCaleZEc=;
 b=MNrQ1dH3en6Mg5lA7VDced4l95Hr6xku9EFxo0N1QISy0xYZgZvhc0ZC
 YylYApPNkzSSUcSBIkWdX4B2ZhPEYbGgAnkTxB/0EK5oaf9y/t8AXHHmo
 jBCVxDnh8gjE9mOCgVtt6QazrfO16h/DpJdGRPuOU1fJxJlMzb+rF6jXu
 amo4Vcc3Cu8S2ZdjaLgZ3ZLj4UIn7HJuPqps//cT4b9bKGLRV7OrtgCT/
 vuEOxx/tlkDuK93IE/OMRGXKULA0SEiN9wi+MmxyQP3FSEAZUWPFQ6eor
 j2eC8mrSxXhR9tVszrJKmUf2/INWFCvPBm/G/V2Np56P1rwFFo478kpjm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="430817446"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="430817446"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 10:50:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="1019657075"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="1019657075"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 14 Apr 2023 10:50:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 10:50:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 10:50:00 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 10:50:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVDVqBZS63R+iIKZJTtcZlfHam+BT61/xEE4xa67GeN50AuFqOsAkhOKvUPZ0HR8AQ1IFr3SU7TqG+LZGVwLY53OiWXxvFN0YdKBROwUGJEqBDou2ySLFFAJTrArdEAlXoOcQD8OHDKyHjC0Up9SSSkKrZ7Pvt5MF9E5+Vs+yDdlqJQFmwrzJ4fkTmsDobKmnz+NtVV9aNWrkipn4L9Jhiq8O78Ok5+A8QNcuQM/+sDr/YtaY7jT/yS/VmQClYZCYQ7n0bxqz7Xwfz5NCKA1p/2K7hw2IcEA4BOyXhtMNZCCEpGUZmGt6CtsJnPGwawvyFsRtNnqgv45T6hgkV90Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuAhu1ijsP8Pmj8ig+BY57CGNVVmWgR98208Z3XplAA=;
 b=ATOuWsU8KnyPMwpABlayfpYZsguWDvr3icnXltw77X1/1YpWXjZFfME17KpqDdFNRZNYA790qoLpQpKrFlSUo55hhLpsWzWY+HM0UWqy+cwqkg+nC7DYmxTcAZH73VofhIKTp23dnpyrY2/Jca3tGSQspaeoVAx/kzh4RLExhEQWl7eau84duhK6h4545ZZngni6Zi5RgrYFBFC7w24zGZNZGFgzJEMH7ED/4j65/itbc3m6bsPgynUNJS/h5lklzJFUXS7RIGHukMG5HANd+OVikzvOd49zbVKiW90al9QSBwAH5hrzk3+sdHJQwHs02/jDfqg3Wc/U+y1Jg8gluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6288.namprd11.prod.outlook.com (2603:10b6:8:a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.47; Fri, 14 Apr
 2023 17:49:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 17:49:58 +0000
Date: Fri, 14 Apr 2023 10:49:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <tfcumckcfwaffujsiuacevhbhr5gwdk3jrd656kiyuhjttsiuz@lxghpncl7bme>
References: <20230414150025.492558-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230414150025.492558-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: 692a8f74-4404-4c88-949d-08db3d10a9e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJq1CExYP16mGesXRe2s/XTvZQyfNT1ytJf1qa3PXw6aYx1/6StCUdu/7hh4hvC63WiJ7d5mJA+D8wV6AVzpCPVD1InUgspUGIu1VmRxloR5V/xfss112S+PeOOkfUJFBXGjTsyCjYqiMRHR6SNK/2YOyinOBCWYiQ/nvPXLG9leNbLntQHD1QWf1fMrjjjW1X0eGnRAxuxtle4dyWROrfS1fLhpwSWoTH78yXNChfh0TqPvtKfCCWU3ut6kBEbbQe4fB/CZzo8fmsI0dIa5YYv9Q/2BUzx0ZqVqchI2fRFWtUeB5JbiTbzbDkobLzae2yzkusuucbAilT/6LGxhM/uR/lvf09wmyIBJs2hYrBlvBQf4tEVMlhcXuqq2X04DEId88AjHG22EARxALePCXd/tq9jjb1qbZ0FMJnUdyrdfa57hlTA8JTXyOKUz/VyQfli+Ja1MHhluDlgkpocdK+3TnyhD2gnnnyicDLArXeVAZSM1nW0EAXHZHRbTnH0j4+c2OrcEn34WG9Lo1dlo/t8H8l0masLRO8bf4wOnlceJ+uVrf8uHnP6wW4fYOCSP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199021)(186003)(6666004)(83380400001)(26005)(9686003)(6512007)(6506007)(66899021)(6486002)(8936002)(5660300002)(86362001)(41300700001)(38100700002)(478600001)(6916009)(82960400001)(66946007)(316002)(66556008)(66476007)(2906002)(33716001)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hY+j3g8roui9DhlqdaJXuJjLJoYjWwqAYAtdEsSqoQtlA3oQs/u7hTn7y1ec?=
 =?us-ascii?Q?Oc4194EoZbuzZaFAOdT5ks1wArcxxkVKlgmYALxDQgeI7LMucf8xzmZnmrj3?=
 =?us-ascii?Q?UrP9ZM7mokovD99lOG3JkhTL8LqpotXECUoY7Gwbpdfh/Qx5Qm/vY93jZeJr?=
 =?us-ascii?Q?NQ1QM+91u5LpKhcS7VeOPxOK69hkAbxt5oiyiLKj4Cs8aDaNKqWoxqeCwtvQ?=
 =?us-ascii?Q?E0r5kPTygymbT1+GI4uqKgNAqt/CATHBvBWUBDGb3ziTVwFbsE3GdiNCy8Pj?=
 =?us-ascii?Q?rnaBAU1B5jc925M5WF+m76BFNH5qv+s82Z9u4ZJKOGL1WLIfWU4qwiA2jFjm?=
 =?us-ascii?Q?GI3C+/OnPwdW4bcEa7Ai4CgLZh6ciB6kFvkjwC0n5EtYJ55GGtwXLg3K4AGY?=
 =?us-ascii?Q?mHBEwrS711ByjAd2dmUJp3g8lYAUilbzXQxbb4UkcGioJlAIK2ZLW6yeOXBR?=
 =?us-ascii?Q?aNiLtvmyyweoiDl0mKahkg/LPXSuwHcU6491uaUInbrdrKKUaPd+kl//fVaq?=
 =?us-ascii?Q?hhr5F7xrNnOR/lNQJ3Q3qhT6G6EJ/m5Bn/mkvhgQmV3DjekvibwniYPjGpVZ?=
 =?us-ascii?Q?XwSUUc3nk8iEOCnxZdy7u/YfZYP++U6E3UJV6cmfZ/xpilTU6mRsFm1aXDPI?=
 =?us-ascii?Q?dSCM5rUco1FDRCBkJMvOwvt06utyg6y9hU39Ib9gxj8l9r11/MT/GlUKOmhK?=
 =?us-ascii?Q?aaAgtV0Itt5/+KhGTi1YzyRkAYPcXVHkXvZo+bjnb+SV3i5BrcmZDLV0pyr2?=
 =?us-ascii?Q?zQlZqD60tiYLNYNQ6dNITTT/tYOv5DMU4gI8btPNJGKXLffEsho2XR9kk3lt?=
 =?us-ascii?Q?O+3MXPqq2Bmhy3axPf26Va5aIyo2HhAbVGfwRB8EWEEvcAB0oYyHGYwSHInS?=
 =?us-ascii?Q?Pd5sHGXwBgjlayXOpyuwGTXXVRfStr0KeDvdtzWY62kEibSHlFs6KCaF6qgO?=
 =?us-ascii?Q?wK2xDBMCWqUpXPEByrE+ifmH2I3lFLRfSZv9ZJLA1YUE2YyBt4vmjz9JacM0?=
 =?us-ascii?Q?5adC0yTFqjlYkq3sN6FBl4fotsFStcKb6Lkvh0RyeugfIH8QHhO7vvmeHOeE?=
 =?us-ascii?Q?Xaje7Hd4qocsgV3/zEVnWkMNviCywTiyzP3Kh9uv+GSYBi5kwSOhh5f7+kPN?=
 =?us-ascii?Q?zUpQYsn3zEXaNZUM2TZIyvDQ7Rt/g2dQAvMPdBKMjWm0ANtJhFGA/hFIA3Hq?=
 =?us-ascii?Q?hAkwZ0hzDRyUcidvXkAi1k7MXpaLtJL/v9K4pqYXyIa5HqjjZMorizbpgRYD?=
 =?us-ascii?Q?igWCaTJG60Y+Q/DBVNesYURaV8Om+yWJbvjv9aUG69PPkdu16WdBu9qMZthg?=
 =?us-ascii?Q?asTyC8Ws9+LgBJP5y5jL+aKvbZ0mObYI7kNMSS+bApAtgOxJ5I2uUCTen66V?=
 =?us-ascii?Q?nbEHZzTf+jenr3jh0XW/8MWAK/ZCfYt8ywtwKQQSEWv3x0Y+JqUqb+impzec?=
 =?us-ascii?Q?i3rw/C0LvuZyz4f9FvSlaJ/MAAsmbZjG0qtvD37oBWSmqu79PJOgKtmgLYcY?=
 =?us-ascii?Q?onBaNuPHYisDGg0NJ27Dzw9SPL5ibRdg1t1U0PbAyMf9K42g1Taaw1lw5vtC?=
 =?us-ascii?Q?dJ5SmPn43RSAW6NykEmC0vDKN0YcBhPJl6tEgXZEuOMrbAMHRYN8qHFUeIGH?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 692a8f74-4404-4c88-949d-08db3d10a9e9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 17:49:58.5965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQMbtBgPBxtMRQlOuvR9Vm9lDLnXoKedDzwVV9xgBCjPrgUnFSOxSB/XoZYK907JKgsybGeil1VRDg3sFabutpHAtxuEGUiTefQpqXCWo7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6288
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add missing spin_lock_inits for
 display
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

On Fri, Apr 14, 2023 at 05:00:25PM +0200, Maarten Lankhorst wrote:
>We have gained 2 locks, better init those.

should be a fixup to the original commit adding display. When we rebase
we will have conflicts since the locks were moved around, but I don't
think we have much option other than fixing the conflicts when they
happen. It's a downside of the rebasing branch.

Ideally in the final state when the i915 side of the refactors is
completed, we will just not have to init any lock here as it would be
as part of the display init on the i915 side.

Lucas De Marchi

>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_display.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>index aae362f27c77..719a64005e29 100644
>--- a/drivers/gpu/drm/xe/xe_display.c
>+++ b/drivers/gpu/drm/xe/xe_display.c
>@@ -91,6 +91,8 @@ int xe_display_create(struct xe_device *xe)
> 	int err;
>
> 	spin_lock_init(&xe->display.fb_tracking.lock);
>+	spin_lock_init(&xe->display.dkl.phy_lock);
>+	spin_lock_init(&xe->display.wm.dsparb_lock);
>
> 	xe->display.hotplug.dp_wq = alloc_ordered_workqueue("xe-dp", 0);
>
>-- 
>2.34.1
>

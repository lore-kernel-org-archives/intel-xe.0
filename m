Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E058E743FE
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 09:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6F510E0F0;
	Fri, 29 Sep 2023 09:07:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F87810E0F0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695978422; x=1727514422;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3SDqTls7i31Sr8/P5h5ZdB9rByiBi3pko7ICYs7u7wM=;
 b=CXOlC+i8qilJ3VaJQ9Sazc+Hp1QVEUOYWIeqA0X0g3YEzTNV6Oqja2lZ
 M59dn5TGGPIsSB0hG8QwXR7oFH3cIVgXaoS3CQGk6ks+Vpzmkm109tiJX
 ghMaNRj8WHywi7zA/TAQZasZ0VTvg0wdT5S0rN+SCgn1N6HUZyYP2nqgQ
 Kk8QGs2OZOpIGDF70zLw3V03bGNj5viP2NIMjYXfxL+UmHEuzsc0yrONp
 Sn4lk5AzDy07SOPXUxUqTUA2Qv7quXypuHvEeYaAplvaVfMlJmdAIGEBq
 zmnY8aDEnSOyybWHj7bjAx+V62TsKcfi2JTAbzLZIVznN+E6MohTmYMui A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="385078960"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="385078960"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 02:07:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="749904823"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="749904823"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 02:07:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 02:07:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 02:07:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 02:07:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 02:07:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuCqa8XbEUwmFlmB1CuXsLnM242ZOmaQRofgu+8gkohzfWA5dcXsdiO5R6ev7lsdxciJ6GpHiZt7rh1tU5mHVRIgP00oK0rsDIDRIZ4lPIKpfTfN6jfyT5HO0XOMRG7Gs9hNVQF6oAi63UaYyLN2fa8yR6Lsj2ab2qctBgDY+8GKHo/OOzTr26eemz/tDmJ2bcD8WdHECE128JJwh/r/6syjazARVpokOS9HJOUwtn3xXl/VJzYFUobOg2ILK6KrfIjoXArHJrsU2p2dvYkMOGBQ8mBYfSmUAQlOApiInduaVgDZ8+n/wD5YXtJ9EU3gpMjrG5u+7CujmiQvVrdieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uVxrD+3enVK+Lgrxux04KgtA41WcQ99OZ0pkfh2sEQ=;
 b=KsFwZ5DY6HLr8m2Pzg+gSlA+2TpE7/NC6oRv3FLiwJaCjb81qN2wm215Ils0rf183JIA29wgCxBC2JLeAiQCXIzqAOU0lwaKwaf1gDvizatkw4NywOxL2vVatvCIoqSOIFU6BROQYzP2RnBBO6Xgr2BlS8EDpQWz8nM5vnv7U9J/4DM4raFt0PqhgVndXE3U0x+LE8/uUTGFtaW4q8SFfeYAzq8ACK6ceCdB+YSxXMdDcIgwF9iVMf6iNA6JsfNt07aSB7uoSifztmJe6o1kmYS1JsvXSss1xo1pyZc+Qp7XIW0/uUizi5Z+K0mUSuZvbpAfco7oKPJ19Iz0zRfudA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB8448.namprd11.prod.outlook.com (2603:10b6:806:3a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 09:06:58 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 09:06:58 +0000
Date: Fri, 29 Sep 2023 11:06:53 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <ZRaTrQ6qqa9wIO9n@fdugast-desk.home>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-27-francois.dugast@intel.com>
 <ZRYcFy97svJ8Z4NS@unerlige-ril>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZRYcFy97svJ8Z4NS@unerlige-ril>
Organization: Intel Corporation
X-ClientProxiedBy: DB8PR09CA0035.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::48) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ab1183-e6a2-4fbc-1b22-08dbc0cb6f5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3w5nirKzfVZ+eJDBtzTzSE4LyXuorZJzryG9yYS511q7G44bTO9wFyLQqdHvYJxyjjKMJo8TE7/MqJdl3/xxj0xioC/zyrn4SItnju5lmwurOvnLE+g1cnbMSHvlopd9FUQ6DV+QEjPuKDUUYlT4DtTJuu0eu4Oecf5Ui5iHSPchIVx3YR6wuqSZq4PmsYGiJfrxnCTaj91olJ6XBHcZ9uOVPW7+mSKr98MoF/95FgeaD3JgY8z6zv0iAwUkGS8yVm6ysFm+eMTky4Ahxi3QPOYwoC1ddt4B9SHDPgABiZoFDb0F7wt/9J5l5gnYE8caIDgybIQTGyDGS6J1IxcFjwWaIQ35uoC7D/3xr/IBpDrIJTQ3XlWcjJnV+20vrd29OEVKnEXi7X7TkgoOamvHtvyrBXmrbsqR1LsTXl6P2DJQU3na28th2Z0OBMBKAx88jzEe2kycy7oNjItywxnfW1dz16yuvgYCWzKKQis2lGAFHoNVuuXO5NN3mjbRIAm//lla6UIytM/9sUf7v+hjNlMsRs4RyNj3zoBwSxqjX3w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(346002)(366004)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(6486002)(966005)(478600001)(8936002)(8676002)(6862004)(4326008)(44832011)(2906002)(5660300002)(38100700002)(82960400001)(6666004)(316002)(26005)(36756003)(36916002)(86362001)(66946007)(66556008)(66476007)(6636002)(6512007)(9686003)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PZukT0jYpNsG1ne/MscoF2O6uZU+5vYEkD6KtDwne3VqjI2cU081QO3xoALZ?=
 =?us-ascii?Q?Yy0jYqX0ljE36NClqU3OgOinqMdzasKAJEOmEYGuSObetnixyrFG1mawdGAh?=
 =?us-ascii?Q?fZqH8CB+yoYkYnhvIv7W2dKnRnLP/QliKKXWhhHeTAK6y6NZ16EJCBRv/ouF?=
 =?us-ascii?Q?sUlbZHO0b2447gnGvXpBoIIvAOtA0v4Dx7o9Z7F1V6WoMr2SKo3tcYmTi4MV?=
 =?us-ascii?Q?Gaoe63BTwI3/X3TOqkOgU10zkhE6UmPW0aTuCFz3G4jipA63b0c1uTElLeC4?=
 =?us-ascii?Q?f4yn61Fci0a/C2Krdp6iUfjh7sIStFYhYRfaFWfgNwRHpr62x/+mmkxwZPwQ?=
 =?us-ascii?Q?PvHpwxnjDTGaGyblkEm3db006iqOgG2ah9hCLPPBXz/hM3XT6cFUT2qstUzS?=
 =?us-ascii?Q?MTPr83DVykNhyjzFLYwRaCXPW0v5/SKC6ySOVZBq7bbnTnmqJvj+fEQzTNDY?=
 =?us-ascii?Q?FlkVWLAh7Hl34ImEvJGL4/MMq+lTLWWJq6wbCs7Ws7FXim7qMxuKvOjtMmy+?=
 =?us-ascii?Q?L+Ei3efb2W805kuoz7d75AKmCY1nYXjMYM+AdT52Z5UWlVB+YiSdqsdMsJLN?=
 =?us-ascii?Q?LlQnyhu89l6X0lqfGgf02qu7UJkTuGQcF0Ooq0RzxKRb84V8lKMCbcKUsVL4?=
 =?us-ascii?Q?mrdNbaksR9dto35T7OVeejTW6VXd4pNmg/yRMnhXxeeVKtP2lxlNOMI2zWxn?=
 =?us-ascii?Q?8JlV55m9pTW0cl0iKnb9HMZBZl1pR6utBb/y0LtpUhTUoCK5yx+UwJeAU8Sa?=
 =?us-ascii?Q?U4rd5qu/nNyM9KkpsYu3g6g/8/ehC5+LsI3rOwe5BYfVs0KVEm/SSGHO4d/F?=
 =?us-ascii?Q?3zuuNZIyvs1CWZfIBGmQP1DhXix/l4BzuIKj8DLvEDSHJ6kLYvEJiZAEyOcy?=
 =?us-ascii?Q?m1cHYIWVPANe2+0BGzt/eDUkADVTYDiNoUljCR+4OxJlPDMffK8K8JWJ4HeN?=
 =?us-ascii?Q?0tvSkxYaJFahCDxe8A7UGgAkv6g5n3AB76uK3rANbLWSPYjwcuFiwen0TKk3?=
 =?us-ascii?Q?JDC/c8F8m4jmcNhDn2PmdLBJkxXKcsxykOaYlUTGTPsXOjarbwgvwFIEAHKw?=
 =?us-ascii?Q?1VF6E8IJpJtIjQp2dgTmwK8ZuII2DRFuxLTntUapW5FdJf0W6VA4sEznyfU6?=
 =?us-ascii?Q?wbVhJ9AjdQdS3nCvPmzAF102CBbmMnUrox3+MTUYe95eFhCWW3BFL1PtntI0?=
 =?us-ascii?Q?Kom4wqVr+Dp/b2YuMpYIbhv4AU46y9OXQIlDHV7xEDNfzMdgXEDijY+ImCQE?=
 =?us-ascii?Q?TEeDC3MfHkojl/+y/vHToJmoc815Ju3x5FmQ7VbmMbGwcWeGrT71ytZD58nT?=
 =?us-ascii?Q?xJM6mQ4LoZDIYE/D1aCeSmHkZgsGICKr+m63R9oZN9vO4zpX/N8JoLHrlF+1?=
 =?us-ascii?Q?gbG6o/sohHy4/Kv9O/3rG/w6TMFz/ac7C8ncpkwmixa7bHO+cvZ4mCrSQtUB?=
 =?us-ascii?Q?i7em7Qu2aUl0v4O7wnGWFeY5wPF3baGxRNveR5GQVelfPEyl8xTz+gHgEfNX?=
 =?us-ascii?Q?PtqQ4zMLn7z/tsch9ZGeLk1NZ/KW2YZJx8Q3MRIMIRdf5YjuQxOLWjxLcRY2?=
 =?us-ascii?Q?/031/bb6DSSLha+UjWK4G9wgHQs6/mS5F+Zpo9nCEhnuBgY5HGn9lW4NydWD?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ab1183-e6a2-4fbc-1b22-08dbc0cb6f5e
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 09:06:58.3259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvBRCPeSJcM7i2VFD8tVMp2HHVTqdfqCPzNcDGswE3wf/w2nwg0j5fdaJx+wvtnGD0hWrvGZMTQUsbS+E3eDTESZ29WekEt6ESR2bpYlQxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8448
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 26/30] drm/xe/uapi: Add pad to
 drm_xe_engine_class_instance
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

Hi Umesh,

On Thu, Sep 28, 2023 at 05:36:39PM -0700, Umesh Nerlige Ramappa wrote:
> On Tue, Sep 26, 2023 at 12:55:36PM +0000, Francois Dugast wrote:
> > Add pad to reserve space for future uses such as special configurations
> > for media.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> 
> I saw a comment in v4 that you dropped the patches that are not reviewed, so
> this is:
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Hoping this will be part of the final series that you merge since the
> ENGINE_CYCLES query is using this structure and relies on this padding.

Actually using your original submission [1] this patch should not longer
be necessary, right? It includes:

   __u16 rsvd;

[1] https://lore.kernel.org/intel-xe/20230814223734.375449-5-umesh.nerlige.ramappa@intel.com/

Francois

> 
> Thanks,
> Umesh
> > ---
> > include/uapi/drm/xe_drm.h | 2 ++
> > 1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 79e47708d526..84091860c7d2 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -143,6 +143,8 @@ struct drm_xe_engine_class_instance {
> > 
> > 	__u16 engine_instance;
> > 	__u16 gt_id;
> > +	/** @pad: MBZ */
> > +	__u32 pad;
> > };
> > 
> > /**
> > -- 
> > 2.34.1
> > 

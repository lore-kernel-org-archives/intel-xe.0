Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFB4C4167B
	for <intel-xe@archiver.kernel.org>; Sat,  2 Dec 2023 00:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D052310E15E;
	Sat,  2 Dec 2023 00:17:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E298110E15E
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Dec 2023 00:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701476260; x=1733012260;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E+gzaV8OqkhkkaO81I2zWJIt2+xCBQHUvBEDSHsDdfc=;
 b=i6xl9+TT/zu7fayKGLOL7V5YQarSCcHlBNI2HJ5oEL6QAFNvclcW1n5y
 gBkXD1AnRCVMA2AJ+YtjKf3UwNqY/dybWzFyLxyn3lMjo/bTxAloA6HqR
 35uLtCGx3y5H5xYVCJs8TD7REcORz7lp3TBvMRGBXndN6sgB01Zp1qwQ+
 55pYzXE2/1IpMmGPmLgqWLMXqmujnkHanpAmb2F9OQLf3uTbGqNaxSuUh
 sVo/OWBAvOhTEuqHEEutCkeRkAJ0KNF0lSheUf5zuthXQZQ3nii1VP5fM
 xdylh0WBOW0B1GxeieM54uUnwagMdrFzl85dI/hQzKOH1TM8t+HKdlGZ1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="12278326"
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; d="scan'208";a="12278326"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 16:17:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="913740669"
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; d="scan'208";a="913740669"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Dec 2023 16:17:38 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 16:17:37 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 16:17:36 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 1 Dec 2023 16:17:36 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 1 Dec 2023 16:17:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqYrJ0GCiMi9k8BGB2BMFN0q1aLpu0eM8b3vMv7ip6qVuKPJJZgxlvmsWrHcpyEL0V0c0P0eub3AlCWek/XQSEJIcXR6ke+ZiExJEjMS9lln5jcowvlTTtle7tgs25kbBliEXF26Z0ZfdcWcUWU1+2pwvSoqpT8ZFabjiENaOht/bxUK2GPj1o4s+1/DwDpVlBLbcMjMsMviqKpT4mlyy3gaY/8lPh5lJRYIVx4EBZvCg6z5Ibw1PzcG3qdkXgPlS+wkBLup70OvfN+q9tQTO3eUV2uL7FuGcJhu8WXhDAhiyrFRkDblrZeQ+C4rCQu54RdKSCKA8Lfyfi8OsqCvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBv6HEYJbXMPehRUbK8sg77z5wEwOdV4aBKcspM+GPs=;
 b=hjThpxTAr3Ni4qw9bEGrZ83lSjgJ4vIIhQ+88MAGX58x+qi6eh0jr/18A+Wy9rxNC1T40rIW2WoFmBC5BhUjrh57N0oqL8v24upsjTl0FW/8rn8oMDRJEjKGWn95eUCa3v2aIaKBhluNKuLgB/q6gAYXi73rA43Me4u3Q+hpCXNl2S5I+5mG4Kn27VKNmEYbTdjG9g7dZcqyzE4xJtz3JFI7Ec+Zv2rVGORKbDnz0Z0HIuLkH8/2seeNlu2CZT3ERlIXT/MHfVon1IuGuvCL18T4mddDYnj6qa2n9Ra5R/VF5Z6y2mI6frZ2qr5smjuA2vixjPSqC2A+OuRI//+WJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6463.namprd11.prod.outlook.com (2603:10b6:930:31::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 00:17:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 00:17:33 +0000
Date: Fri, 1 Dec 2023 16:17:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <20231202001730.GG1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231128151333.4068550-1-tejas.upadhyay@intel.com>
 <20231128151333.4068550-3-tejas.upadhyay@intel.com>
 <80cd47a5-f157-4847-8242-df842c2e2aec@intel.com>
 <SJ1PR11MB62045C5257D79A6B5E47CCCF8183A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZWj_dpyE75C_Ippr@intel.com>
 <xqhglc6kukdoq5rf6cwz3ovcreuy7m7z3eixpasmdkitij4t3z@jzhczrrzu7mp>
 <SJ1PR11MB62042B38A26D2AAABD25CD728181A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62042B38A26D2AAABD25CD728181A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: 0acaadbb-db0d-41ce-7078-08dbf2cc1435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Grmx5VO4nlXZCxlRkiqz/ho1k8EoDldtORCIeu4m/QkjvhDzBlfuh00NSaUEVkxo/dFjMVt+eLfZwV1b6LoUWFRRCef1qcChfLq3JKaovE6S1uGm1oopybtLy3UMaChGTnlKhM9SuaRtSfY1VLsx/eNbLPsuieIDL2dWHftFTDGKwAdoqPEPGzCk7YuxDIM/A6nx1XaCArjpFJdJEqOy76h67qbES6mli2VPqcm/k65sTs9vDohKRlW8JsMXtbYIqxKWz5FJi3jnh29YnVR8SC7aAuwMsFV7V3SDL+muwx4C3+BEIZBdlkaKLYfn/jNTR9OBoJdoVEOf7Daxa6tAHA3MuVLKbnKZ8/VaOaENmbmDuVJdYjIy5Y9Qd8OnTBZsjOkDfo3J+0uXIwzdSFwGezyqwvOUjOBbkJJBreJGsDV6YNFKzy/+RSb8N30TVNoi/MVfZ+kLm3RP1tWZGoO1lUZxopJRwWXWGRJ4GbCCyUdvRXyLJs8g+BCC+VefnFSk1uO3wHS9J6bB7uoM/bL4xN8GmAa7WUjba47DXqHyPUY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(376002)(396003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6486002)(6636002)(66476007)(66556008)(54906003)(8936002)(6862004)(66946007)(8676002)(316002)(4326008)(966005)(478600001)(41300700001)(2906002)(86362001)(5660300002)(33656002)(6506007)(38100700002)(1076003)(26005)(83380400001)(53546011)(6512007)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KhRVIA/1/Dq0Z2KIldpuW8xPKxzxeqZqvEa9DjV5n9EoaF6cQ460UROY6L8D?=
 =?us-ascii?Q?Qxyfd+Pxz8WqX7sxut5vln9w2vHmaEyXYl0tVtPzVv2IlxBD0BoS4LeQ+H42?=
 =?us-ascii?Q?GQIWViP27JmHWh2R0snLB27G9VfJNI3Aj8AZaGR5uAFPYuyKsqKXaFbjE1OK?=
 =?us-ascii?Q?+thQuBEjYTnoIdTZQoYkLmWWs4MthVCrJqQ6Afa3hBf38vo4BzUxjid4nSEg?=
 =?us-ascii?Q?aWiTA2jNu56z7AhHbP7fuwjARbrmXck+BHlg8J9Dq6xM4ZoyeRsWAsvarGuI?=
 =?us-ascii?Q?7CQ3ZSYXRCIX+VgLF6XqgBUptIEcjCSMq9WeELknRm2el03z63bE09i/gex1?=
 =?us-ascii?Q?AJfAP3f8PvleQKKCvI3O71XU+J4pm2C1R0p6aXk6Z0V1GHWwcGTxuGgqIuuF?=
 =?us-ascii?Q?ollZiWDEd42ucuWrwcB11FoKUcQqwsvkvEmDaiHQY/VItBIIh4TVei5wzNXU?=
 =?us-ascii?Q?m0DQxNaCZe/pD/50b/rcJ1cmTka1QfpY7IzO06EbPSKvoVuTehNN8gti+n4u?=
 =?us-ascii?Q?ZgfR0EDdS7YM+sxia7VfFtsUdB/Pon+wnss1H9V2nfWEc/aZOTnH/aqL/Z2m?=
 =?us-ascii?Q?V6h/nr6fpffwNgrWOMnNYFe1m5LKqP4X6n+jnqGzV2z4AZ3WLcPzwPjTyHhp?=
 =?us-ascii?Q?Pdjlpd3yDMBwMfvJN30cXkZmo/rC2mVHeX6behEgR7bmklRK4aHdwOV7bgt8?=
 =?us-ascii?Q?0r3cs1Rj+WpMyndNNBv9pvJQElOBpZaZnXx1N3jC4+6PYjDKpfa+2x3orFfJ?=
 =?us-ascii?Q?RmpolbzdPf+RvdcYJuGp0Popj0eBbF+pgrwokTp91OQHUpJKskb0WaCXiQaJ?=
 =?us-ascii?Q?CbQZW0RzQpAVOisnhZXeu9TtFAZqItiC+GLwB3guPnmfc6RA9uf0fWR4gFsz?=
 =?us-ascii?Q?rUQkIfErpMY4DFn6mR5aG/eOwk4SobnRHZxQ9vHPA+1oGz1WUqrmND2Gn1D2?=
 =?us-ascii?Q?xPLf3HV3/lF/7Ex1jrdLcbjXY8CrNXIAxoY5KzBOvip1HTPv1oARzyvChEq+?=
 =?us-ascii?Q?G26UlmQ/qlkfNRC7brDrX08bZkBbx2CVG0ohj0sA6sdqIJIOAxAVpJQ0fOMR?=
 =?us-ascii?Q?mO5+H7+aq94FIt+AqHnszvLWpHc9on937l2i2b5fOvAC6YVzNyH/C/e7xstb?=
 =?us-ascii?Q?bRpuc3X7dC2opCujcj1zAdQZHxnP6oE+qawG/faXwGGe5pkMAvucxumM3AKs?=
 =?us-ascii?Q?W3Ti+WPjINw0UBxAc3fpib0+59/f+ACCv2VF+JfCoirW1/g5KTPLv6Jyd0m3?=
 =?us-ascii?Q?Mqdla6vro9nS45PER6k2NTUYoVR+dlgnLY3KyuBitFEJpkGMmQ9exUYh1Nh8?=
 =?us-ascii?Q?97BpXQHFj37OAFmY66oqCM61l4KjtPHtEvyp3RX7uYw1knm72oDXXnmj+t5l?=
 =?us-ascii?Q?ltr37/vgt1guN6yGg1J9veplbRvXu8DiizolgHrUsctwy0XlmAWJ5ESLA4p2?=
 =?us-ascii?Q?hI1E+PxEHiORbVTnK3ltjLJfmhBmS9TlFu+IQcQNAbIi/rksiHXMoN7KwgZF?=
 =?us-ascii?Q?H+/VEFbVvvPfKDjaH7djEPp5E5CMQ60uFUWUgUc2cCPm+tH0hUYdzktSSGNI?=
 =?us-ascii?Q?c65+erYtgCB79nm/LMCjbAS2iJfPoDhKTHpkxsyLMmN/sXW6LFsh+slu7lkk?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0acaadbb-db0d-41ce-7078-08dbf2cc1435
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2023 00:17:33.3805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNvIspLz5EQ+BFxMXs2no3CjdiIBo8fUMZigVvNQ2/bS+UZXaDTQp3FpCL9wCmAudhVBlv+8UzrSh4D0g/lpTmqS0V3nyq44jLD/AoGgTTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6463
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 2/3] drm/xe/ats-m: Expose uid for ATS-M
 via sysfs
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 01, 2023 at 02:49:02AM +0000, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: De Marchi, Lucas <lucas.demarchi@intel.com>
> > Sent: Friday, December 1, 2023 4:40 AM
> > To: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Subject: Re: [Intel-xe] [PATCH V3 2/3] drm/xe/ats-m: Expose uid for ATS-M via
> > sysfs
> > 
> > On Thu, Nov 30, 2023 at 04:32:38PM -0500, Rodrigo Vivi wrote:
> > >On Wed, Nov 29, 2023 at 12:00:39AM -0500, Upadhyay, Tejas wrote:
> > >>
> > >>
> > >> > -----Original Message-----
> > >> > From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> > >> > Sent: Tuesday, November 28, 2023 10:31 PM
> > >> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > >> > xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > >> > Subject: Re: [Intel-xe] [PATCH V3 2/3] drm/xe/ats-m: Expose uid for
> > >> > ATS-M via sysfs
> > >> >
> > >> >
> > >> >
> > >> > On 28.11.2023 16:13, Tejas Upadhyay wrote:
> > >> > > On ATS-M CSC firmware calculated unique device id(uid) can be
> > >> > > read from defined registers. Only ATS-M has this way of reading
> > >> > > uid. Also ATS-M customer require this solution to locate and name
> > >> > > their devices effectively.
> > >> > >
> > >> > > Consumer of csc uid is level0 sysman and end users using sysman.
> > >> >
> > >> > is this generic UID or UID only specific to CSC firmware ?
> > >> > if former then maybe just name it as "uid" or "uuid" ?
> > >> >
> > >> > >
> > >> > > This patch exports uid to the userspace via sysfs.
> > >> >
> > >> > as this defines uabi, shouldn't this series go over dri-devel ?
> > >> >
> > >> > + @Rodrigo
> > >
> > >The biggest problem that I see here is actually the justification.
> > >It doesn't matter which wrapper are using our sysfs or not.
> > >
> > >A better commit message would be something like:
> > >
> > >In case of multiple similar dgfx cards plugged to the same node, the
> > >user cannot rely on DRM card number nor on PCI address to identify
> > >which exact part it is operating at since these numbers can change upon
> > >order enumeration. In the case of FW flashing or other cases
> > 
> > kind of sounds like what we have for network with predictable network
> > names.
> > 
> > https://access.redhat.com/documentation/en-
> > us/red_hat_enterprise_linux/7/html/networking_guide/ch-
> > consistent_network_device_naming
> > 
> > This would provide the firmware naming, but I wonder if it can't be solved
> > today entirely in userspace.
> > 
> > >where the admin might know specifically which device it is accessing,
> > >it needs to have an unique identifier number. To solve this case, CSC
> > >FW provides an unique number that can be query. Let's expose this
> > >number in the sysfs to make the device clearly identifiable.
> > 
> > if this is the justification (like you said, it should be in the commit message so
> > we know what's the use to give a proper review), then it also answers the
> > question "why is it ok to wake the device on sysfs access rather than doing on
> > device probe?" asked elsewhere: because clients will almost never access it.
> > It's not like a userspace client is reading this value 10 times per second
> 
> Considering making it ADMIN attribute like MattR suggested, looks like
> it should be ok to wake GT to read UID. I will update commit message
> like Lucas and Rodrigo suggested and sent out new version. 

Just for clarity --- this is an sgunit register so we shouldn't need to
wake up the GT to read it (i.e., there's no need to acquire any kind of
forcewake).  We only need to wake the PCI device (e.g., exit D3).


Matt

> 
> Tejas
> > 
> > Lucas De Marchi
> > 
> > >
> > >> >
> > >> > > For example, uid can be read by:
> > >> > > cat /sys/class/drm/cardX/device/csc_uid
> > >> >
> > >> > as this is more Xe driver extension then maybe
> > >> >
> > >> > /sys/bus/pci/drivers/xe/<BDF>/uuid
> > >> >
> > >> > >
> > >> > > V2(Michal):
> > >> > >   - Make separate patch for csc uid capability
> > >> > >   - Use %#llx for 0x
> > >> > >   - Dump error value when sysfs creation fails
> > >> > >   - Have consistency in csc uid name
> > >> > >
> > >> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > >> > > ---
> > >> > >  drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
> > >> > >  drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++++
> > >> > >  drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
> > >> > > drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> > >> > >  4 files changed, 37 insertions(+)
> > >> > >
> > >> > > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> > >> > > b/drivers/gpu/drm/xe/regs/xe_regs.h
> > >> > > index ec9372aa739f..3599c7b38b61 100644
> > >> > > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > >> > > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > >> > > @@ -71,6 +71,9 @@
> > >> > >  #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
> > >> > >  #define   SGSI_SIDECLK_DIS			REG_BIT(17)
> > >> > >
> > >> > > +#define DEVUID_LWORD
> > 	XE_REG(0x102008)
> > >> > > +#define DEVUID_HWORD
> > 	XE_REG(0x10200C)
> > >> >
> > >> > Bspec uses different names .. and LWORD/HWORD look strange but
> > >> > since it's for SW use then maybe at least (assuming ATSM is XEHP):
> > >> >
> > >> > #define XEHP_DEVUID_LDW
> > 	XE_REG(0x102008)
> > >> > #define XEHP_DEVUID_UDW
> > 	XE_REG(0x10200C)
> > >> >
> > >> > > +
> > >> > >  #define GGC					XE_REG(0x108040)
> > >> > >  #define   GMS_MASK				REG_GENMASK(15, 8)
> > >> > >  #define   GGMS_MASK				REG_GENMASK(7, 6)
> > >> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > >> > > b/drivers/gpu/drm/xe/xe_device.c index
> > d60379d844d2..b54635d512d6
> > >> > > 100644
> > >> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > >> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > >> > > @@ -355,6 +355,15 @@ static void xe_device_sanitize(struct
> > >> > > drm_device
> > >> > *drm, void *arg)
> > >> > >  		xe_gt_sanitize(gt);
> > >> > >  }
> > >> > >
> > >> > > +static void xe_read_csc_uid(struct xe_device *xe) {
> > >> > > +	if (xe->info.has_csc_uid) {
> > >> > > +		struct xe_gt *mmio = xe_root_mmio_gt(xe);
> > >> > > +
> > >> > > +		xe->info.csc_uid  = xe_mmio_read64_2x32(mmio,
> > >> > DEVUID_LWORD);
> > >> > > +	}
> > >> > > +}
> > >> > > +
> > >> > >  int xe_device_probe(struct xe_device *xe)  {
> > >> > >  	struct xe_tile *tile;
> > >> > > @@ -379,6 +388,8 @@ int xe_device_probe(struct xe_device *xe)
> > >> > >  	if (err)
> > >> > >  		return err;
> > >> > >
> > >> > > +	xe_read_csc_uid(xe);
> > >> > > +
> > >> > >  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> > >> > >  	if (err)
> > >> > >  		return err;
> > >> > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > >> > > b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > >> > > index 99113a5a2b84..4fbf0275d3bf 100644
> > >> > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > >> > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > >> > > @@ -65,11 +65,24 @@ vram_d3cold_threshold_store(struct device
> > >> > > *dev, struct device_attribute *attr,
> > >> > >
> > >> > >  static DEVICE_ATTR_RW(vram_d3cold_threshold);
> > >> > >
> > >> > > +static ssize_t csc_uid_show(struct device *dev,
> > >> > > +			    struct device_attribute *attr,
> > >> > > +			    char *buf)
> > >> > > +{
> > >> > > +	struct pci_dev *pdev = to_pci_dev(dev);
> > >> > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > >> > > +
> > >> > > +	return sysfs_emit(buf, "%#llx\n", xe->info.csc_uid);
> > >> >
> > >> > if there are no plans to use this value in driver then maybe just
> > >> > read it here as it was already suggested by Lucas
> > >>
> > >> Why to wake GT on every sysfs read and read those registers? Does not
> > look correct in my POV.
> > >
> > >Why not to wake? it shouldn't be a query that user is doing every time right?
> > >
> > >>
> > >> Thanks,
> > >> Tejas
> > >> >
> > >> > > +}
> > >> > > +
> > >> > > +static DEVICE_ATTR_RO(csc_uid);
> > >> > > +
> > >> > >  static void xe_device_sysfs_fini(struct drm_device *drm, void
> > >> > > *arg) {
> > >> > >  	struct xe_device *xe = arg;
> > >> > >
> > >> > >  	sysfs_remove_file(&xe->drm.dev->kobj,
> > >> > > &dev_attr_vram_d3cold_threshold.attr);
> > >> > > +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_csc_uid.attr);
> > >> >
> > >> > it's sad that we don't have proper groups defines and need to add
> > >> > each attribute separately (but that's not your fault)
> > >> >
> > >> > >  }
> > >> > >
> > >> > >  void xe_device_sysfs_init(struct xe_device *xe) @@ -83,6 +96,14
> > >> > > @@ void xe_device_sysfs_init(struct xe_device *xe)
> > >> > >  		return;
> > >> > >  	}
> > >> > >
> > >> > > +	if (xe->info.has_csc_uid) {
> > >> > > +		ret = sysfs_create_file(&dev->kobj, &dev_attr_csc_uid.attr);
> > >> > > +		if (ret) {
> > >> > > +			drm_warn(&xe->drm, "UID sysfs setup failed
> > >> > err=%pe\n", ERR_PTR(ret));
> > >> > > +			return;
> > >> >
> > >> > if you exit here, you will leak dev_attr_vram_d3cold_threshold
> > >> >
> > >> > > +		}
> > >> > > +	}
> > >> > > +
> > >> > >  	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini,
> > >> > xe);
> > >> > >  	if (ret)
> > >> > >  		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
> > >> > diff
> > >> > > --git a/drivers/gpu/drm/xe/xe_device_types.h
> > >> > > b/drivers/gpu/drm/xe/xe_device_types.h
> > >> > > index 268a40639ec5..e88b64cb0eca 100644
> > >> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > >> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > >> > > @@ -239,6 +239,8 @@ struct xe_device {
> > >> > >  		u8 vm_max_level;
> > >> > >  		/** @va_bits: Maximum bits of a virtual address */
> > >> > >  		u8 va_bits;
> > >> > > +		/** @csc_uid: device uid calculated by CSC FW, used for
> > >> > generating uuid */
> > >> > > +		u64 csc_uid;
> > >> > >
> > >> > >  		/** @is_dgfx: is discrete device */
> > >> > >  		u8 is_dgfx:1;

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

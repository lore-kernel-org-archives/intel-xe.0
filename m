Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C29C77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 15:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39EE10E18B;
	Fri,  2 Jun 2023 15:18:02 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF2210E18B
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 15:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685719081; x=1717255081;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yfOB9vpuk2IVgOuhbv/6rBYCXbWOhQuOgyhJbbsTj3g=;
 b=NsEvTyO/7OozNAwikJJHL3FSrs3CdC2PUcCjjEyX9+vYyXFfSvLUghfX
 5u/QUCyNI7YVS3NqJ2DKZZOHAToWFf4HC3ofb7saDKDjMqUT5U0lvBhRC
 eFdBIFz3RsMTOaNYZVLaTJuIYR/Dj7Utmv9Tx+Xr6fClArfteUvoHMyGa
 a8OzkGMhXgbWFtvWV3kgK9Jh/RG5VbXVEEjK3/iV6jVI+OSEgBcomR5Ye
 pOrQTP9MdtNDLEtCa3d8fQV3k1Nl82EPkXC4zXjM64rjaixvKfjx8NaNd
 bRxATgUUSfo58JOxpGB7Y535S58DQopoPTwlbB2J2V66rtZ2u0DLz0g4g Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="340522889"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="340522889"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 08:17:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="1038001247"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="1038001247"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 02 Jun 2023 08:17:54 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 2 Jun 2023 08:17:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 2 Jun 2023 08:17:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 2 Jun 2023 08:17:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4upzba+ucyWx4/dLuWEcf9/OeydZr3qOdtKX/u53WtD3CBqzo/g0QAloSrC8htqVN9yMcoas+2stqKawwDcnA9aC9Z9G7kct8ommDrPgorw3s3d+vVF/TIZnj9uMDZ+wdw2T+xnSukP7/6cTUUip5Mm4Dl+9GFtSFhRMvPoralxHqwH4L6LVlrQZuXwdRQ6ql3AUTmEP7L80hXQTyyI/bjj4xfEvd4ucBkxhM5zPMKBp3PFreD9oUCUhpbkKEnY00FQ77mU1ko+M1BPqltESVBrnctYSP3MMKBrjf3TI5jayYuqhNDv26yfOOP8xBZZjYCufVp1x1GyacInaEAZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgNHz/km/qGRI0/B/SHAi9PWOcow74QPa7QXa6msheg=;
 b=Br/nAUTF2/8VKqXdiKVc5amgvwMPx23Xtv4WvLbM8AlT08Es4iyTQNGoQf/QRAsqJUcDr7KnD6FOAlO8Ybp+DSWnbiuHT/gegWC9ouGs3j1Y556pz+4Y9iFA5Bjph1aRVwif0LwALHIYceHy0SGz0s92GenvBbTOR9VlaeSa6la0iAmyxBm1ourqj7VfIU3Pf9yvv77mYLe1n62L6lWWLF6ehjm3ZpIupOHWo4Po1LFnk6JZBgBW1eljx6KLLWbQCFOQR1RcO8La5AdyeoGv1cRkdhg3AEPqpmktpjJ36ID/GSEBUhkQkNZ05yYWDTnq1aDiN8sYmcHQpCgbx5qhOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN0PR11MB5961.namprd11.prod.outlook.com (2603:10b6:208:370::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.26; Fri, 2 Jun 2023 15:17:51 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 15:17:51 +0000
Date: Fri, 2 Jun 2023 08:17:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <20230602151748.GD5433@mdroper-desk1.amr.corp.intel.com>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
 <SJ1PR11MB6204AD929734B440C251F235814A9@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <CH0PR11MB54742C54B5F0E7872CE9DC718C4A9@CH0PR11MB5474.namprd11.prod.outlook.com>
 <BL1PR11MB5480D96FD947D16F4E140DA68C4B9@BL1PR11MB5480.namprd11.prod.outlook.com>
 <SJ1PR11MB620439B1C575F0177E747142814EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB620439B1C575F0177E747142814EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:a03:100::36) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN0PR11MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 2acc2dc6-5135-4e34-1aac-08db637c87bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 251dQWpis1FifrZzw3JCYBIAC4rt1NOlfcUox37sLH93e4+L+LivZfhADxHUHoIYPKL81Z0qtYb86ZZbBTttPaFLF+uKXP8NlnzsMztXnOao57G/pkWX0Firo8lpwCFESFUHnu/anIrp3Pi7B9jut9c7O0Ju3LPraUTEjWvjYofHB1695T6pQUPC84o8yLgTBwPDzzfUpE8lGWTZAHuBRjQde1q0qoO/h/D0celYSvuPsBQ+1KA0Jl6hQx9y1Tw1wiCgQlEUHFQ1DxlMYKr1V2/rty854dmKMPW08aPyDIIBQ7vPRvEk6RQLAb2nQZ0Q6F2QmFolCvKDXiz/I57owzmOf6tmL+twwPjKbwANuN+r6vQR4jEvhKjsUhNxsagzGWY26F8XeVabhcNMRvWFhuGJea7YlodMcBaRCT0Ez1QRroQxV5NVj+0lGCRq5Srxas1mGcudEsTz2HbE9pafiBmvkL3k1W5iV0ZQJXmQHNeo915eJSWiYE4GJZi7aHCRcfggPG2pRDPVmncsxWKOUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199021)(38100700002)(82960400001)(86362001)(54906003)(66476007)(6636002)(478600001)(66556008)(66946007)(4326008)(33656002)(6486002)(966005)(6666004)(6512007)(53546011)(26005)(107886003)(1076003)(6506007)(186003)(5660300002)(6862004)(2906002)(8676002)(8936002)(316002)(41300700001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tvelmaPj/Vropxra+Is8CtPGO04j1M66MjUAM+KVbwv/11vvTHQgFoYxXLPO?=
 =?us-ascii?Q?bHxnSCe2tpmI+Qyk7lNkrZ6aUqNYRrpMI9/3EOw4DqMWPaaAolZaK0VuQZSY?=
 =?us-ascii?Q?n70hDq5hHBLkj3NLe6y9xptynFntTzorOv09oupIAMiXy5VjBsJGDEfg22rn?=
 =?us-ascii?Q?r0hD7CYuOz/3IcikF8IA+m27doaPWHjzZnwJRY6KbL/yHAon+2D3Blw2JQrV?=
 =?us-ascii?Q?cw1+vmIzIfnnCc1DFH5uyD7ZLkheuEdQka0chZr0B3C0N12X7/pQdKFB+94y?=
 =?us-ascii?Q?1/xJ6KZtM7gh9rvvCQdd4ovfWosiYB6Xddy7avvxQ9eRUjv/F2rAXFNkM2Z6?=
 =?us-ascii?Q?Y1cSX1WSlouOfhwTLK72y9TOql9uUwlUKwhmpW+3AjqthIQTD60pPXWYx5bF?=
 =?us-ascii?Q?ZJUnU6IfqDRE2UUVKT4FJZ808WMVv2jmmKyTqfoOiN85MZqbWQHIpoQY8xUI?=
 =?us-ascii?Q?sZ1i5N90Zca+8iYyoW+YLfyTyKK0mcozAlrfTJzJR5p10rZU1YLdEWAg3PXJ?=
 =?us-ascii?Q?/V22qc/ffo5I5kaTDwN4hucPliAdF5RTO7CIG1paFkurK2VLJ7Uk3gPiDP4N?=
 =?us-ascii?Q?Oww8sEx4F6Ljt8mRxJNIOHyl7eRXDvDgYoZIqXdQkyhXTDO/afT4NEFDqTvI?=
 =?us-ascii?Q?mLrtpOyaUSWrZfQQNw+jE+sDkCN8lTygYGvL0JRGvXbn5VlKY2QMf49YpdqG?=
 =?us-ascii?Q?v+0xUA39+Dh7XVq6eyn2ualsEPwfujbt5viTNtYcvq+8EMWr0m+JWZpg88H4?=
 =?us-ascii?Q?oPGWXUlll3LHs/hB4qtyQ52z3sWQ/jdl+cm6rsuVKY4YLLFSPm5tL3DA1Tzf?=
 =?us-ascii?Q?nGEWLUlNX31VO/7iTzPjQZ6YVySaPQ4ScdmNxiTiRgbqDm/T3MeE2Q77HXrE?=
 =?us-ascii?Q?8LBxhRgpgZBS62fzWwn1W3lJ5HTo1Emxefb3ehnMrOtTrEF7moIpUd6LpkhQ?=
 =?us-ascii?Q?vHAcaFMBQlIhcH6Mx/Lxqu6vNFEASa2pcD+DZhdL2yWToEVfuJE1HKDBND94?=
 =?us-ascii?Q?qq8mB85VuF5gD7AVMvAR9s2rU1gvCZjtd5vfBku06RA6lwQUj/tjlhdeIV9J?=
 =?us-ascii?Q?ReBodGhXTyeTvEZm2t88AjPZNH5IuwYID8no42RFqJ9gttccOdkTHLYp6eEo?=
 =?us-ascii?Q?SOMw/JqhbWpnGAHxVewsJv77COhKnXiWTD85n9lrAnPW+niocOk834lTRIdB?=
 =?us-ascii?Q?LS/wQwxVAOV97eUfgSQfEOVUyzgiAf72vqlsvNUg0AIVlGvW8zhTYaSvH6fH?=
 =?us-ascii?Q?JuUUq0cXX3C1s6rYOL0kYkzHeq5ZlG3FEdFkvz2qPCtVIAGNqAb5BM8aOlD7?=
 =?us-ascii?Q?3vvrJt0cu2mUFwDg/WFj5bXJ/L/oKWwvxh2s5PcK9ygd3EhDuvQzrXCd0nmh?=
 =?us-ascii?Q?7ONE/XKW4xc4XjOxOLLmLlg/dYWBpzkNBkakyIgNn9PdZ4ORBgUHJSrRpXxY?=
 =?us-ascii?Q?V3CcPTGb6X5rC571vNRpiyZvP3Y3QJ5bTyHvccecVnhPUnew2vSV/E1Lw6Vf?=
 =?us-ascii?Q?SAWAXcgIZruJWBjrlNX7YkId/vJ897syWAkUd7o2NJBfwq2Tm1eZZeeucxmQ?=
 =?us-ascii?Q?HI1wZKchKE+GE1ErN3inNd5LsOyAvFU9U9B7AQIxO+L6M17c6v/ClbVqaD9k?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acc2dc6-5135-4e34-1aac-08db637c87bb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 15:17:51.1295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: encPsv81ufsD7+s56Aj0c/QW1hWPPdLiYmfygOPNg8uzJi0V2SK64iurcyZ9b2ik0rPfhf0heaplidFsy/TSVrOTepqKINtbfFw5P2Oy0/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5961
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
 memory size
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 01, 2023 at 11:51:51PM -0700, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>
> > Sent: Tuesday, May 30, 2023 12:22 PM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > xe@lists.freedesktop.org; Roper, Matthew D <matthew.d.roper@intel.com>
> > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dixit, Ashutosh
> > <ashutosh.dixit@intel.com>
> > Subject: RE: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory
> > size
> > 
> > 
> > 
> > > -----Original Message-----
> > > From: Iddamsetty, Aravind
> > > Sent: Monday, May 29, 2023 2:15 PM
> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > xe@lists.freedesktop.org
> > > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dixit, Ashutosh
> > > <ashutosh.dixit@intel.com>; Roper, Matthew D
> > > <matthew.d.roper@intel.com>
> > > Subject: RE: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
> > > memory size
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > > Sent: Monday, May 29, 2023 2:10 PM
> > > > To: intel-xe@lists.freedesktop.org
> > > > Cc: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Vivi,
> > > > Rodrigo <rodrigo.vivi@intel.com>; Dixit, Ashutosh
> > > > <ashutosh.dixit@intel.com>; Roper, Matthew D
> > > > <matthew.d.roper@intel.com>
> > > > Subject: RE: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
> > > > memory size
> > > >
> > > > Initiating discussion on sysfs path for this inline below :
> > > >
> > > > > -----Original Message-----
> > > > > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > > > Sent: Thursday, May 4, 2023 4:50 PM
> > > > > To: intel-xe@lists.freedesktop.org
> > > > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Iddamsetty,
> > > > > Aravind <aravind.iddamsetty@intel.com>
> > > > > Subject: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
> > > > > memory size
> > > > >
> > > > > Add sysfs entry to read per gt physical memory in total including
> > > > > stolen memory.
> > > > >
> > > > > The sysfs entry added can be read using:
> > > > > cat /sys/class/drm/card1/gt/gt0/addr_range
> > > > > cat /sys/class/drm/card1/gt/gt1/addr_range
> > > >
> > > > We already have gt#num directory created under device folder, should
> > > > we create addr_range under that only. I think that would be straight
> > > > forward to start with.  For example,
> > > >
> > > >
> > /devices/pci0000:a7/0000:a7:01.0/0000:a8:00.0/0000:a9:01.0/0000:aa:00.
> > > > 0/
> > > > drm/card1/gt0/addr_range
> > > >
> > > > Initiating discussion there to conclude on path on this sysfs entry
> > > > as well as scheduler interface entries as well as under "engine"
> > > > folder under
> > > card1.
> > 
> > Also, now with Matt's " Separate GT and tile" series addr_range is associated
> > to a tile rather than gt.  We might have to introduce "tile" in sysfs
> 
> Hi @Roper, Matthew D, @Vivi, Rodrigo,
> 
> Should we expose tile0/1->addr_range to user, with sysfs like device/tile0/gt0, device/tile1/gt1? Looking for inputs here to move forward with second version of this patch.

Since memory is a tile-specific concept and isn't related to GTs, I'd
imagine you probably want something like

        /sys/class/drm/cardX/tileY/addr_range

Since this is sysfs rather than debugfs, that means we have to follow
all the strict uapi requirements, including having an opensource
userspace consumer and preserving backward compatibility forever.  Which
userspace component plans to use this?  It's unclear to me how this is
going to get used, but you should make sure a single general addr_range
is actually what they want, rather than a more general interface that
can report details about multiple ranges of memory per tile (e.g.,
stolen memory, generally available vram, etc.).


Matt

> 
> Thanks,
> Tejas
> > 
> > Thanks,
> > Aravind.
> > 
> > >
> > > Scheduler/engine entries are not related to this feature let's discuss
> > > them separately.
> > >
> > > Thanks,
> > > Aravind.
> > >
> > > >
> > > > Please provide your inputs.
> > > >
> > > > Thanks,
> > > > Tejas
> > > > >
> > > > > As it involves drm_class, it required movement in xe_device init
> > > > > flow, patch for same is part of this series.
> > > > >
> > > > > Actual physical memory per GT was dependent on infra patch from
> > > > > Ruhl, Michael J, so I have added it as part of this series to pass
> > > > > through pre-
> > > > merge.
> > > > > Patchwork: https://patchwork.freedesktop.org/series/117126/#rev3
> > > > >
> > > > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > >
> > > > > Tejas Upadhyay (3):
> > > > >   drm/xe: Rework multi tile device memory initialization
> > > > >   drm/xe: Register drm device prior to gt init
> > > > >   drm/xe: Add sysfs entry to report per gt memory size
> > > > >
> > > > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   2 +-
> > > > >  drivers/gpu/drm/xe/xe_bo.c             |   8 +-
> > > > >  drivers/gpu/drm/xe/xe_bo.h             |   2 +-
> > > > >  drivers/gpu/drm/xe/xe_device.c         |   8 +-
> > > > >  drivers/gpu/drm/xe/xe_device_types.h   |  20 +-
> > > > >  drivers/gpu/drm/xe/xe_gt_sysfs.c       |  74 ++++++-
> > > > >  drivers/gpu/drm/xe/xe_gt_sysfs.h       |   1 -
> > > > >  drivers/gpu/drm/xe/xe_gt_types.h       |  21 +-
> > > > >  drivers/gpu/drm/xe/xe_migrate.c        |   6 +-
> > > > >  drivers/gpu/drm/xe/xe_mmio.c           | 279 ++++++++++++++-----------
> > > > >  drivers/gpu/drm/xe/xe_mmio.h           |   4 +-
> > > > >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  30 +--
> > > > >  12 files changed, 291 insertions(+), 164 deletions(-)
> > > > >
> > > > > --
> > > > > 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

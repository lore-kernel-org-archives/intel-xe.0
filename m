Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D5AC7EE37
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 21:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC2A10E3D7;
	Tue,  6 Jun 2023 21:46:22 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D2B10E3CE
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 21:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686087980; x=1717623980;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MztVsLYcbvIUhAD1muzYkLnjWafIT6spB1VVsydUKk4=;
 b=dNFyrNTWPZuPOVNoHNqZc0p77Kc7W/+I7I7ZFo8SjAaclaPxWiOxzGna
 Zu8Jo/eGKYpRysHwF2/M4HDn9yMUzReeAJ2OX+ulLkljKKlVfEU0Sm/8V
 NtdEFz6obPF5xcLFrKfIyzjx052KtHW1TGAl2ZcTO5R1FPsTwtPQ+3j64
 nYkt5iVyKzwB4RBMA7ihJyiiRa3ppOPGv8ufhT1Jy5t4lobD+rYMIn9In
 Iw2lyg7jYo7am/olNUvEmxJwBlrOKn0vnTPWdS4z2/pEKTHrbyHj+cwyR
 jl36qHVCHhdIM59N36ew7/cuy2DXGJpSU0Ag0x2/HQYhY1YcXjvrYKxGg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="385122687"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="385122687"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 14:46:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="659696872"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="659696872"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 06 Jun 2023 14:46:19 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 14:46:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 14:46:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 14:46:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1dqy3oCc+da/YBWyvu33It480abqgIWoGQgYhW1bzlTstGoiqzo53DkGjuRiactEIIKcXrqM7thv8nHjGJl1rzSoAWDfIRbqK8vkHRsOIqyJJrJaD6vdc/1ndg3mx8fN9KWR7Q2nEQtfIKD55lar14fmiHRCZECHgDoope3oz/C3K85ongHeqRKuinrdDw7UlXEiueVyKru0kOV6y4yw/MKZoyAkolgSzgsA9Clwe9ZbwC+tHrsjiPyM1OT3TQo5ra6DCkEJUgf5If1E97n1BB4UH/D3EM0br+NA/Oj9KUDpnhLe3vvUUwfOYOU7h7PnxqLVrydg6IjLSiU97gfpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcV8CyLiWOIrKQ74RQjfj4INO/CnESj2PeiUO3EyXtQ=;
 b=AlSgKySBq5kp2R0VcOkgamf+08ZbxMGNtVjDJRzu5SZbX+k4+mH42b8Dexz8vZA9vruiWzYeKLZCX2pV8hgsmtA6qZAp7YvxSxfd8Vu+v+9S2k4cK6GT35Few3L63Buj1O8awjASjWXcS03hUwR3O7PTL3UgiLrhNRBMVm/lDmq/WV3N++XYIjDdRt+54jXYxAbCcRWtf3/4aPCiwA2a1OuPvmUueCFn0/pMlQQwy/y0zUJz9BMKMiIwb081GTs/eva/2/X8P8j+w+BHtQh6qDEqEg7DYKuoZ974bSG4jGMntLZFLVOhXeC7s064OCZNAGk1udaHEj3dJiowDPzU5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB8374.namprd11.prod.outlook.com (2603:10b6:806:385::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 21:46:15 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 21:46:15 +0000
Date: Tue, 6 Jun 2023 14:46:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <20230606214611.GL5433@mdroper-desk1.amr.corp.intel.com>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
 <SJ1PR11MB6204AD929734B440C251F235814A9@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <CH0PR11MB54742C54B5F0E7872CE9DC718C4A9@CH0PR11MB5474.namprd11.prod.outlook.com>
 <BL1PR11MB5480D96FD947D16F4E140DA68C4B9@BL1PR11MB5480.namprd11.prod.outlook.com>
 <SJ1PR11MB620439B1C575F0177E747142814EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <20230602151748.GD5433@mdroper-desk1.amr.corp.intel.com>
 <SJ1PR11MB620415A7B4F4FD2CFA9BC742814DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB620415A7B4F4FD2CFA9BC742814DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0128.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::13) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 774a46f0-154d-4401-717e-08db66d77387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q4+UTwc9n3Wfzd5ZGN3pdhNNLTTrDRw9tdlxqNoabWk6NAPx+eZCc+sG18fVY/w3ocK9WT5HCU+VxiOzFoKM13pqttrvpKhAggCAS5Zi5nr+TK3yCbLckja/2FvXpf4eyiYF9cD3no/mBsTj7sFL0lrOhDNkZXa/EyrsK6WSJWnWFomRxQlXT+3gwH0bvcdLIZA4EZXeE1FMmE7k9ia8Q4SPLmqQNVOqyhLps0vIS5hmtibEZ9l2wEhWvmkAaX5y3U4Af9cy4t+TpWUmryYDNn63bJIkHrArNLSNH8sa7YooGtu/hFNeMgTXtW1yLpTKjOhIEqi1ZYCo7suGKChqp3ttoAWIqJQkYXnAFtW6xZYfp6FuvgmXnCe5SgGKc73D8cCEhnpykbiscbOE7Wcb6i8hlOFYsnWneJgAzRJGFyM9ta4d9NU09T7UcDW8IDLKJW7uIa7bUyndA4xFWGNZsQskKJCgUbfGEJFH87rsQ+ifbPoP3GAebTuZyhz/kiHq8RsvbLwhEwgMhq9MrxlieQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(478600001)(6486002)(26005)(1076003)(53546011)(6506007)(6512007)(6666004)(966005)(186003)(83380400001)(107886003)(54906003)(82960400001)(38100700002)(41300700001)(316002)(5660300002)(8676002)(8936002)(6862004)(66476007)(4326008)(6636002)(66946007)(2906002)(66556008)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T/ewUSOHBSNq4ekKwgL8HTYNf0hblPSf82R3kxexdUeuclCpGnlOuggdAWuK?=
 =?us-ascii?Q?c9JuffYxHvj+fQMd7q44ZSfFp03826g5bEzq/UshahN5CewQdkeYRXVu/3FU?=
 =?us-ascii?Q?a9j214H4z0enkx8EXUT+lNiKmBj5CVXAHy8HZRlI16nqwpPv5+IZ2uzLfvIW?=
 =?us-ascii?Q?2hztj2fIlwUaaCHXvCSpDthmqtG7n4WW1JRYo5dYRZ0Thz/fN48DEtsPxnIB?=
 =?us-ascii?Q?IM/JMJBb/h4CC5qNxl2cXTlgAG53CTKDxsGuPbOBrDuU6dSK89AjTPGlZaPL?=
 =?us-ascii?Q?/8hvu3IWSetx/effBNETVxSB4fVvKgAJJZRgf5BNQKw424AG6vAEpAccnV6S?=
 =?us-ascii?Q?iCl3ASSU/ahCEfK+e3yF+Sh7xfKQDeRJN5IXXb3+oh3kXTqNa4G0vWKIi0Wq?=
 =?us-ascii?Q?8iYb5Cs7rikqbk/s4aIb2/XkAWLLOjIoImPcvTZCVbRimJofrCQ0St5MHONd?=
 =?us-ascii?Q?ZJu7u2awVVDUto0Fi4QmqBKM7kTn4F+tFZsPXYYIFIKHUaiH/evtNB29w21x?=
 =?us-ascii?Q?u6mTM/NfPrX2CHxNgKcbIbXkqSwEgdmtgI8Oh6Oo/SZsApJ0ZO/n1/CStC97?=
 =?us-ascii?Q?0lzhHddZiiotV2GAxQfll+NbrqPE/LahipFXgCW4J30vNKUOdEMbnsuAfK+O?=
 =?us-ascii?Q?u1OgvB6zAf0qF+0Yd1JQ00FkEqrq+FsApQD6LuIL0WCgo4hihv9z9UjndjwO?=
 =?us-ascii?Q?HREyfMtHPmkuQo1orjjwqTlHb8C/0HQgBVwuBnBu0qJRW41Vc6XFBiYqUort?=
 =?us-ascii?Q?1hK7jcxfYqFPHGS7fawe/F9/wJsn1B1LZAnHUV2wzKBzhZtcCBVBtUpKymoo?=
 =?us-ascii?Q?BatYyf2GL80XB33+uhyYkUovGsBkVtttLMz9zERbY4yIajLrNUYLcv3bYDAx?=
 =?us-ascii?Q?ZQmPHR4yXb93iGWKlt3Zfr7cOUb5BEkMqxFsYLoX7xYVj1futrS8kJPxOWIB?=
 =?us-ascii?Q?lxWt6s1qu4ERutmmCnufS6W53Du99bujuDkMDb7D6DC9oa/UpxGrIf0NlZv/?=
 =?us-ascii?Q?n/Dy3a2suyNwdX9rInR/D/LHf40AGqNELNk2fRB9Y/rw4HFE2bSg2AAkXYgo?=
 =?us-ascii?Q?fo3GV3rMiYdWFT4toC29Rpe/tF+hggsWjZEhRTLMiYtM/5K9solBRsaBzaRB?=
 =?us-ascii?Q?4gGuBPWp8nBt2cWOWqEfRmKFkTP+vmsi80MDIB7V5a6CHt+txGQryJxFprTG?=
 =?us-ascii?Q?UL86glqZj4a7BgMQl2VUAMn38M6IDHng52BY5dhU9zIxV2VrWzlD0rzIPqaI?=
 =?us-ascii?Q?ok5PEGakWWn75G0E7IF7a5ZxRluHSP5ciho5To+8kMywJg0enivKu6/Oo0Sn?=
 =?us-ascii?Q?HivxVqwuvYK7jhp1KbGmrtjAc6CahiyOk7bwCR2GwBsQW9kB9rPF8tSLDbqy?=
 =?us-ascii?Q?TX8hkqAp9MXQXILseUTfD1J00kLsPdbKK1gi771lQ+xFjLtHGGovEjgffXck?=
 =?us-ascii?Q?PLEliNZLQyBFEDOzADOG3lE3317ajzo8AUOaRTyXDl9fd01fArzJ7VzjhD1s?=
 =?us-ascii?Q?0+ya8Oge/THUbiuJ68d6FOW6jD0bq5RZP4mm7GsgZaRxkTDOWLamjXNvmthi?=
 =?us-ascii?Q?cYfcdEpjMxbYvL4kaDNz8/wGsideXzFoHf2IAzqU12r/csKdXQDeRFXx+EqK?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 774a46f0-154d-4401-717e-08db66d77387
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 21:46:14.8432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwhaxWlqClpYOXX48+X1UJHqTtfHTo7BnLVIupqX4cfkB9pTOGuPoqKmmRoUwZU6wI6aJnYUR/CL7Tp5in7sFmagYwpf1GQt5b7KobIGP7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8374
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

On Mon, Jun 05, 2023 at 06:38:22AM -0700, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: Friday, June 2, 2023 8:48 PM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; intel-
> > xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dixit,
> > Ashutosh <ashutosh.dixit@intel.com>
> > Subject: Re: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory
> > size
> > 
> > On Thu, Jun 01, 2023 at 11:51:51PM -0700, Upadhyay, Tejas wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>
> > > > Sent: Tuesday, May 30, 2023 12:22 PM
> > > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > > xe@lists.freedesktop.org; Roper, Matthew D
> > > > <matthew.d.roper@intel.com>
> > > > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dixit, Ashutosh
> > > > <ashutosh.dixit@intel.com>
> > > > Subject: RE: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
> > > > memory size
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Iddamsetty, Aravind
> > > > > Sent: Monday, May 29, 2023 2:15 PM
> > > > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > > > xe@lists.freedesktop.org
> > > > > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dixit, Ashutosh
> > > > > <ashutosh.dixit@intel.com>; Roper, Matthew D
> > > > > <matthew.d.roper@intel.com>
> > > > > Subject: RE: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
> > > > > memory size
> > > > >
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > > > > Sent: Monday, May 29, 2023 2:10 PM
> > > > > > To: intel-xe@lists.freedesktop.org
> > > > > > Cc: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Vivi,
> > > > > > Rodrigo <rodrigo.vivi@intel.com>; Dixit, Ashutosh
> > > > > > <ashutosh.dixit@intel.com>; Roper, Matthew D
> > > > > > <matthew.d.roper@intel.com>
> > > > > > Subject: RE: [PATCH 0/3] drm/xe: Add sysfs entry to report per
> > > > > > gt memory size
> > > > > >
> > > > > > Initiating discussion on sysfs path for this inline below :
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > > > > > Sent: Thursday, May 4, 2023 4:50 PM
> > > > > > > To: intel-xe@lists.freedesktop.org
> > > > > > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Iddamsetty,
> > > > > > > Aravind <aravind.iddamsetty@intel.com>
> > > > > > > Subject: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
> > > > > > > memory size
> > > > > > >
> > > > > > > Add sysfs entry to read per gt physical memory in total
> > > > > > > including stolen memory.
> > > > > > >
> > > > > > > The sysfs entry added can be read using:
> > > > > > > cat /sys/class/drm/card1/gt/gt0/addr_range
> > > > > > > cat /sys/class/drm/card1/gt/gt1/addr_range
> > > > > >
> > > > > > We already have gt#num directory created under device folder,
> > > > > > should we create addr_range under that only. I think that would
> > > > > > be straight forward to start with.  For example,
> > > > > >
> > > > > >
> > > >
> > /devices/pci0000:a7/0000:a7:01.0/0000:a8:00.0/0000:a9:01.0/0000:aa:00.
> > > > > > 0/
> > > > > > drm/card1/gt0/addr_range
> > > > > >
> > > > > > Initiating discussion there to conclude on path on this sysfs
> > > > > > entry as well as scheduler interface entries as well as under "engine"
> > > > > > folder under
> > > > > card1.
> > > >
> > > > Also, now with Matt's " Separate GT and tile" series addr_range is
> > > > associated to a tile rather than gt.  We might have to introduce
> > > > "tile" in sysfs
> > >
> > > Hi @Roper, Matthew D, @Vivi, Rodrigo,
> > >
> > > Should we expose tile0/1->addr_range to user, with sysfs like
> > device/tile0/gt0, device/tile1/gt1? Looking for inputs here to move forward
> > with second version of this patch.
> > 
> > Since memory is a tile-specific concept and isn't related to GTs, I'd imagine
> > you probably want something like
> > 
> >         /sys/class/drm/cardX/tileY/addr_range
> > 
> > Since this is sysfs rather than debugfs, that means we have to follow all the
> > strict uapi requirements, including having an opensource userspace
> > consumer and preserving backward compatibility forever.  Which userspace
> > component plans to use this?  It's unclear to me how this is going to get used,
> > but you should make sure a single general addr_range is actually what they
> > want, rather than a more general interface that can report details about
> > multiple ranges of memory per tile (e.g., stolen memory, generally available
> > vram, etc.).
> > 
> 
> Also, we have gt0 and gt1 sysfs dirs created under device folder as
> device/gt0 and device/gt1 right, do we need to establish relation
> between new tile dir (/sys/class/drm/cardX/tileY/addr_range)  and
> gt0/gt1 dir which we already have in xe? Or we should keep them
> independent!

Someone needs to make a policy decision about exactly what we want the
GT vs tile uapi to look like for the Xe driver.  Since Xe isn't part of
upstream yet, we still have time to change the uapi before it's all set
in stone; we just need to make sure that the kernel driver and userspace
developers are all on the same page.

In my mind, it would make sense to move the GT directories underneath
the tile that contains them rather than having them directly under the
device.  But if/when we do that there are still decisions that need to
be made about whether to use device-wide IDs like:

        /tile0/gt0
        /tile0/gt1
        /tile1/gt2
        /tile2/gt3

or whether to use per-tile IDs like:

        /tile0/gt0
        /tile0/gt1
        /tile1/gt0
        /tile2/gt0

or whether to use symbolic names instead of IDS:

        /tile0/gt-primary
        /tile0/gt-media
        /tile1/gt-primary
        /tile2/gt-primary

Those kind of decisions are something that need to be discussed with our
userspace partners so that a direction can be set.


Matt

> 
> Thanks,
> Tejas
> > 
> > Matt
> > 
> > >
> > > Thanks,
> > > Tejas
> > > >
> > > > Thanks,
> > > > Aravind.
> > > >
> > > > >
> > > > > Scheduler/engine entries are not related to this feature let's
> > > > > discuss them separately.
> > > > >
> > > > > Thanks,
> > > > > Aravind.
> > > > >
> > > > > >
> > > > > > Please provide your inputs.
> > > > > >
> > > > > > Thanks,
> > > > > > Tejas
> > > > > > >
> > > > > > > As it involves drm_class, it required movement in xe_device
> > > > > > > init flow, patch for same is part of this series.
> > > > > > >
> > > > > > > Actual physical memory per GT was dependent on infra patch
> > > > > > > from Ruhl, Michael J, so I have added it as part of this
> > > > > > > series to pass through pre-
> > > > > > merge.
> > > > > > > Patchwork:
> > > > > > > https://patchwork.freedesktop.org/series/117126/#rev3
> > > > > > >
> > > > > > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > > > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > > >
> > > > > > > Tejas Upadhyay (3):
> > > > > > >   drm/xe: Rework multi tile device memory initialization
> > > > > > >   drm/xe: Register drm device prior to gt init
> > > > > > >   drm/xe: Add sysfs entry to report per gt memory size
> > > > > > >
> > > > > > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   2 +-
> > > > > > >  drivers/gpu/drm/xe/xe_bo.c             |   8 +-
> > > > > > >  drivers/gpu/drm/xe/xe_bo.h             |   2 +-
> > > > > > >  drivers/gpu/drm/xe/xe_device.c         |   8 +-
> > > > > > >  drivers/gpu/drm/xe/xe_device_types.h   |  20 +-
> > > > > > >  drivers/gpu/drm/xe/xe_gt_sysfs.c       |  74 ++++++-
> > > > > > >  drivers/gpu/drm/xe/xe_gt_sysfs.h       |   1 -
> > > > > > >  drivers/gpu/drm/xe/xe_gt_types.h       |  21 +-
> > > > > > >  drivers/gpu/drm/xe/xe_migrate.c        |   6 +-
> > > > > > >  drivers/gpu/drm/xe/xe_mmio.c           | 279 ++++++++++++++---------
> > --
> > > > > > >  drivers/gpu/drm/xe/xe_mmio.h           |   4 +-
> > > > > > >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  30 +--
> > > > > > >  12 files changed, 291 insertions(+), 164 deletions(-)
> > > > > > >
> > > > > > > --
> > > > > > > 2.25.1
> > >
> > 
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

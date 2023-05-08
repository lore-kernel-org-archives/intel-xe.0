Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B6CC77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 01:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395A110E08F;
	Mon,  8 May 2023 01:08:43 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D7210E08F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 01:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683508121; x=1715044121;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k054hoTrP1s1zhEj6B0DBsDpo8KM9OLrxMSSDh5J2fo=;
 b=bHGF0pna/dapzXvmqo4aKTuF28e0YUg+YX3AE01vSkeuarVe8sMFNduq
 ra1n06AGllMRTUyXSEILo2FMfMIG1U+Srhjq4BpwDiVZQVj6GsSbNCC1F
 JPN4TvBASKU9sdA6bgpIRXJymlndR3UteZKbkPPf6MqPKW4BzBxq2bYCO
 3esB1KTx8+syC3bJ8r+xMf/FkJV/xXDMbysgvJG/h3kaDbZEWurRzHDEH
 bwzb8DkyusiUbS8gJ2bGUOpMQ5DoYlbqGAPOeoAkyKIiJhc01wvam2Zdp
 Ppf6HuOV97TNsu41LSJPNAekxcg/zq53riJcUQb0Ox455hsbs2zw0KFft w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="377618509"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="377618509"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2023 18:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="728867376"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="728867376"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 07 May 2023 18:08:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 18:08:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 18:08:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 7 May 2023 18:08:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 7 May 2023 18:08:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWxKfLRUOiuYORKTb6fEUK2x+aldBsMcyKG4MywXSXiFPpUXguo49+vyQGaPlldlwMqhBUWQFHvaBjoHU49BAY7Na4O6lhUzwbW+IB7JON+YSOjgQKwIV+KKMH9VrD+B9qNF8EB+GGTQnjBSGlcTvPmatLw/cn/eYYrhOky4JBon8dS3k4mjJ6J0WuGMoVxNJM6moAwUbIPYvUxSpwUfx9DXdnBfPwQ0eKE29rjNIEjSWUNTRKHJLgbaX7l9k3g+4ZMkl0Ali6wXIsNV4+asFEsXlTVedlmZbyj7JzWFQtxB/QDj2gyz7rjMXlwm5Jxvq8Jpf8iZvqZQM10NQNnF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfJmq5dhswbxsM3NLUZMwFH0blLkTED/JNzmzwDjwPY=;
 b=GaMt/iNLkUYMq4eB2NEhQoEePbT7Kf0oJFzXOqekpgn5rTuwdv/P+ddWQKIkMPWFDUxUikcZ0S614aoD8+XXw7hZ+WE+KEb7pCkL3aHXqNqhcbtgSBxNRclIcacivrMCm+hDj6mMqcXi2VIzN6yB4VkpltlspxlGXvCed264kqubSODGl8HB5CQF+ReIt79a7c1CsNXNSJIunjzbqASzSdvgi24TZ27j6K1zMR4mr85EWdiHQfbOkTsSkGPezreI8WW/BvT0UbOBn+cswWs2ofL0y8cWhytC1Mytnu+/jCEKBXHzfjy3rjBM1mwA4XVhrz1Z2aQD4Itbq8hZG67V5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 01:08:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 01:08:37 +0000
Date: Mon, 8 May 2023 01:08:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Message-ID: <ZFhLejusrFMU3dIk@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-8-matthew.brost@intel.com>
 <ZFVNqF+iqsN059E3@rdvivi-mobl4>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZFVNqF+iqsN059E3@rdvivi-mobl4>
X-ClientProxiedBy: BY3PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:a03:255::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5482:EE_
X-MS-Office365-Filtering-Correlation-Id: baf8c6dc-afd0-4bd5-0b86-08db4f60c0e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AZSNCVOVVMkGG80/pOvOomcFL83n3DejNHBUFjlD+/Lzko6WmwHN7GWMA0YvPyhkibtVYjK+EuDmfCRdRrhle8Khq3qPLXX0M9tlK3Xtk0jx3J+ClKobAoPLDzFs4Ly74gRDyUHZXKFOPIQi45682jZwNEKxGvhetNq4mwDmsn3C0F+M2nLYbaVf5XYysAkTGwOAVjb7lMOQzapWAjIxB36Jp0QgFp2Af01zMak8LiEPyWMoBRSO6PC9WkkQidNM2HK0F+lxea3hx4NEay/+OQk3S+EqhlpZH9zN7EjeX1upDaZoibKRgJcOiF7B8uofMrC2EYh1N9sbVYLSDWnErq8ux2Sux+y4cbRNtBv8CIHcqeRLC26wC1S793EHE6NA7Hjh/2cFFuuGxM6EVEyXXfJu37uzFLrvflH4mwSlrnZkGT3LQ0yDF7mOqOnPIiAXawKjrhCxS1a15pIi5Vwb5YAfeOjb4BvxFBLY1ord5ZGzQ7NG4nn3hEa8fx6MdY8JDq7lx3MgKwdXeQAVfttwBq9TV3TN5Z+jzC+xBzBAYXgZAtU+DK+80HHYuAsqiet4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199021)(26005)(6506007)(6512007)(107886003)(6486002)(83380400001)(38100700002)(86362001)(82960400001)(186003)(478600001)(2906002)(5660300002)(66476007)(66556008)(6916009)(4326008)(316002)(8936002)(8676002)(41300700001)(44832011)(66946007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jXD4fTp6lx6gxbp70dOZKWZU955Zkv6xcVJq3ZvdEYhhsDSO2DHIM0J/HP7q?=
 =?us-ascii?Q?FHf6BlclxThx0Mp59wAdGc0Z9pnDij2OAH0xbyYmACH5YI4so8Ey7Og/Ma1T?=
 =?us-ascii?Q?3483pHykIAAI/4Ym8WLq4htIoLn7UdGkObUsYCU5IS4DPDVG9PFjoPFt8l12?=
 =?us-ascii?Q?kyY2wbjabsOB1Zug0AomLsbCogzQmYJ9BwqWJ56MuxwsmAvM7KkYXGhXs5d4?=
 =?us-ascii?Q?dQM3D0RqKGd3wDa+jgCL5hI52SleiM+OirL/Tn368CrGw3FWKm3Hxv4qwbFP?=
 =?us-ascii?Q?xxkkqoPCqCO9B7N6p2P+AYhWyK6TR2NScy7jAQC3xvIp5ZGYiyXUQK8YwQkC?=
 =?us-ascii?Q?YPJ9jKBOZQ/HdTBiAGUdyGzljp0HmhyjLYmJ97mVx4i8vcR9TWYCWp3PsEWz?=
 =?us-ascii?Q?8CWt7XJX+EwVCeTGtLvx6CQZ8obvlQeFg8qYdeUNACWz1jL6FU+klpqQsiZA?=
 =?us-ascii?Q?LMz2aP4ygNiFYwWR0jttxaEdSFYvjY0ftKN6ilKYmZXbI2bxfy4lNF6d3SEq?=
 =?us-ascii?Q?dPVnUwPXD096eFZ1NLVLAv87ueLeKVwdRkxvk6PDNUudwcGWhdHdt1TcNpnN?=
 =?us-ascii?Q?DQsQejidJVSCc5I/HFpRmxYP2SEy1KnKV7W3BOLkDb3wnWHlfnBqRKI3MJ/k?=
 =?us-ascii?Q?tjXF2GSiF7Qdo3MUh42uLaLNBWrZS4u8V3hkSWjSVfTJUXPlniQmj8SMKM2Z?=
 =?us-ascii?Q?JJkIg9tY5KEpLYHfBYHkHcaJdXn6ulKimImxYoM2BnlfWcLbfIIJ3C64PUp+?=
 =?us-ascii?Q?TXfkpCj/RZtypE6LU9zHnyxs0s8vVlIHGt8+fn3uZkzcONg9bF8mgexaOHt1?=
 =?us-ascii?Q?jySTHjIkmW5Ml00Lr8rXs99phzOsZBa0ski0e5SuEgtDBaStYa51gaMfsjPP?=
 =?us-ascii?Q?oD2XU/iPT8+IxsDA3apLas/E3b9i7th9pq5jnJN2YDYsPbvq35okZRklwX+X?=
 =?us-ascii?Q?FRVMRC+Yj04BV59/hxzFp296xuuzABWZEyumYsShPmkMQKlYbrGIEFCSlgxJ?=
 =?us-ascii?Q?/tBn9CcKbv6O5SgVozRRQZphKVmAPRFosf3uIMN1CaVzzgGbi9Mk0pT6IQNo?=
 =?us-ascii?Q?+9iWf4cffLMzwEj2e0QVimd43jw5MJtFaNet+RfWj/KOEsyY2e8XwwhOCec/?=
 =?us-ascii?Q?G9/0fmYkMWeDXWXz+OzNZPWuFp52nZFFZExqrFL3dsfCsf+/GnkUKs6RKUZg?=
 =?us-ascii?Q?ehWgveROExwSxwWeyN3AkT1rFVisXwtfAjRnzVUQ5SE380khzUmTEPq7ETjr?=
 =?us-ascii?Q?J7BKQeqkEYRwEWK5OcpkofBf5xv6c3GWzqSxBG32XuJ3noJBBgsmbe65U4uv?=
 =?us-ascii?Q?WAMozUPTJklyWd1CyBbQDcZvEZ7NyV/RVLIJHkIXSVrOnlo0fJmYYKEd+wWe?=
 =?us-ascii?Q?yrxWYh2MVmib9ROm5xTC54HHv1BAT8vz6V73Ppav0PnmrMu6n2tCW+CHw7sD?=
 =?us-ascii?Q?Achfqm53qFIYaZpIT4jupypUgfTmgA+a5wh9YJkBM4z3PDVA4q/27Aq8Ptsk?=
 =?us-ascii?Q?Ckd013U9Wjjs2TalCzrncKP/OLW77l0Ke3I5IpQJUXDFboGjY+JCwpSmSKYu?=
 =?us-ascii?Q?o04Nt2e3Pid0VCKzvCAeno/Utz4rcI3WJDxaQh6Y/Sdv2TAGtQyRPRJtn00d?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: baf8c6dc-afd0-4bd5-0b86-08db4f60c0e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 01:08:37.5980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xg1Izeb9c9/SlAmeBabt59zWn4zT+QN8UMCk+bsAFKtpdIvZtFRC4J5OUR7NgHMKk7sYnkI2zLzObqzFgkyicg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5482
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 07/31] drm/xe: Only try to lock external
 BOs in VM bind
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
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <mattthew.brost@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 05, 2023 at 02:40:40PM -0400, Rodrigo Vivi wrote:
> On Mon, May 01, 2023 at 05:17:03PM -0700, Matthew Brost wrote:
> > Not needed and causes some issues with bulk LRU moves.
> 
> I'm confused with this explanation and the code below.
> could you please provide a bit more wording here?
> 

We only need to try to lock a BO if it external as non-external BOs
share the dma-resv with the already locked VM. Trying to lock
non-external BOs caused an issue (list corruption) in an uncoming patch
which adds bulk LRU move. Since this code isn't needed, remove it.

^^^ How about this.

> > 
> > Signed-off-by: Matthew Brost <mattthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 272f0f7f24fe..6c427ff92c44 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2064,9 +2064,11 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
> >  		 */
> >  		xe_bo_get(vbo);
> >  
> > -		tv_bo.bo = &vbo->ttm;
> > -		tv_bo.num_shared = 1;
> > -		list_add(&tv_bo.head, &objs);
> > +		if (!vbo->vm) {
> > +			tv_bo.bo = &vbo->ttm;
> > +			tv_bo.num_shared = 1;
> > +			list_add(&tv_bo.head, &objs);
> > +		}
> >  	}
> >  
> >  again:
> > -- 
> > 2.34.1
> > 

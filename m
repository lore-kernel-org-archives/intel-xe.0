Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2D3CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 20:04:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F31E10E550;
	Thu, 12 Oct 2023 20:04:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCCB10E550
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 20:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697141083; x=1728677083;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nuChIZ9YhQqR91eZJDAJxXAw9KEZMWuYn+nzLam0lF4=;
 b=NlR7yWr3EjzUp2cXrNNfPK1y5HOhO6YXbqBE/5QMp/ybPIopM+cAB6TT
 3vQouqJjHbfXtgVFOJsmuFrCPidQ8ZnwcSwxKKtjpDefyDUvXMrfh2YkQ
 BJLvWtyVmeP2d2FGT+QHq1dC5H+lV5V3lBjhs7SfL2bryRW+2v50xpflx
 LKKrF6C3o/Xq5tnAd/hmWyu3oE6Gm+sH0FzLk8VJoW3NNbLG2lWb9gYWQ
 KTNm4sWdo2aWL6DBR1BwaY8qKy7+W0fFsgqv+3pSkJuDXFmZpqQYjpsIA
 jGK6+D79pVVBU0iWiP5yrGKEyWK27MOWH3mb+cfcWqkmdwYCFGDyuppf5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="364395375"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="364395375"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 13:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="754422060"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="754422060"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 13:04:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 13:04:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 13:04:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 13:04:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 13:04:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVyoQjxVrDFfdE3moEUBPHB3ftSXeJ5wWPe0C1tZo/T0KI/CZ+eZGlqvKMNUCTcyw/SowdjxFxFVn0leaZP2QpBF2nMJTkX7Hgt62P87jIbq+7m0JzuyHJke5sQD7xpEDVWMnCj+Ec5IJE0kWDLCCqj/VYJrjGVB0lZJLyHVKUE/aU3lHdHY4r9sNju20EmqotVcS6fC/vsvgjNMfVhqndrOmGCgznIs0/FfmY1sXOVq2Jd54xoLpXrkEGIB+4ett5ydOipkvduyTRRU3M9kiH/QeQcqONF3JAea3DFVZX7vofvgYJO1+fQnDM9c9dOUryiz2K1GccdhpiMiRtIdHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvnLauqPI/v5K0fYu+o91Ibd1DU9Invo96XKLVunjkk=;
 b=R4XQl/ZkRaXHesbi1qy/scBoCavbKEaPQlMRVnL4LNLtLOrScXbeuvYjnhv4fEUqyn+ZfyX3Njr1Whg0/HC14DMy71GeqGTuhpK2SkmU4ZnkpnmOGGNSTftdytanRqyQlbu7QRscMWQEOsf4vhfs7HpMjx9m0l0Sq3ncVPtUdyauJJqwAvI9y++9JxiAYmRV3ylcNyLkueRxqCEY6SajfVp1UQu6yKy/XaI688EFdekOHlsLeqnDhJNxiMq/rndzC3Mb7/x9Fp/VAlmZWnteD0IcPASUri8Z0Zhn4dPtAICy1NJyDsDrE6C4PaO/iTgEBFXPkl/KlusvPrR5NDIakQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4577.namprd11.prod.outlook.com (2603:10b6:5:2a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 20:04:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.040; Thu, 12 Oct 2023
 20:04:33 +0000
Date: Thu, 12 Oct 2023 16:04:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luca Coelho <luca@coelho.fi>
Message-ID: <ZShRTTLRD7ltDGSS@intel.com>
References: <20230522221527.2181802-1-rodrigo.vivi@intel.com>
 <20230523032805.GB6250@mdroper-desk1.amr.corp.intel.com>
 <ZGzGJYuTAUpfeXe5@DUT025-TGLU.fm.intel.com>
 <20230523163849.GD6250@mdroper-desk1.amr.corp.intel.com>
 <ZG1Rwd2k6oDdiHHT@DUT025-TGLU.fm.intel.com>
 <8de90ac856b0caf3d0bd82717769e9f6fe1687a0.camel@coelho.fi>
 <ZSRtavVCM2lqbV5y@intel.com>
 <f8c1a6a39300f01b6affc5ecee7b4486dbcb6baa.camel@coelho.fi>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8c1a6a39300f01b6affc5ecee7b4486dbcb6baa.camel@coelho.fi>
X-ClientProxiedBy: SJ0PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: 7829dad2-d773-4019-eca8-08dbcb5e73bd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c5iGBQKg0A6P2AUbHXtF6wbrbAGvSPMFXmK7W88tFnxENXmMTTiGgpvgl/4OAQVGsk/qLQ5AIZjF34Wuj6FyDsbSD1b7uY4fy/kd6tXkNYOnXvE4yQ+Eh7xOBKW2SBzJUaqJb0PIG9WlSbhzR8Ah07Z4hkr0e2miFnqshKb53dMda2tb707kMC1wU9DVo3vKvmn6LKt4DiExcLc11yLdgx/CAbksZFGzV7sqtRcopS6ns3m8ctDPIuN9PbKsIniXXgI+cnZBswxpeAqfG6hQzb3hu0EeL2RsPndtmupCzJyzDgxwWG17ASJJy/PU4rBmDCV9bt2ewpNe8rR1qOutaI6sPSNE2NQPZ2HiLXnELWkyr5uAU7fpFAVs8fcTZlrVLG4mV/UkGd/PVvA57vDfcT7Phw55QeSr097OyjJegQty9NR6R0VxNJ5JJPhefPDWkIUel3xw6EEwMfsstwhHRlOaK9EmV/6ko9eStx/pTZQmV0GZUFV30YuWgaO0NWWSuFzy82VEFiJDFc+y14wrlWjZOYoUVoh0IMbEO1PY5ruy3DkKKSdTRILCnBEgPGfp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(8936002)(8676002)(4326008)(54906003)(5660300002)(44832011)(6916009)(66946007)(66476007)(66556008)(316002)(41300700001)(38100700002)(82960400001)(66574015)(36756003)(6512007)(26005)(2616005)(86362001)(30864003)(6666004)(6486002)(478600001)(2906002)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tjd6TldlT2VleWpUaG1MRC91aHZVZ25Mbkxxcys3Z05uRm9WcXhyK1luZ1JW?=
 =?utf-8?B?ZlpsZVhqb0llYXg1bFZWblJaRDRwSE5UNWtQdzdBamtmM3NWcWdIcnZwSEJZ?=
 =?utf-8?B?c3pVUGFHMnFtU0FyaXpWS3Q0WXQ1QkFvU21yVlJnS1BHQjFnRHdwSlVMRE5p?=
 =?utf-8?B?TG5PYnZSS2dmd2tjZXVWd25jd0xNekdramtHZVdqTzVNcUZTSXl5ZDJNR3Zu?=
 =?utf-8?B?aVgyb3JwM2NRdWc0TThaZnJLSTdxQ0xRZ2NZUytBZG1uMnFjQTY2b0lBYi82?=
 =?utf-8?B?NW1TZEhBN2ZhTTJ3MFNuRm1YanVCR3NYNU1uUXBMdTQyNzdGQSt5aElTYThy?=
 =?utf-8?B?UHk3WS9pUFFTWS9JTWp0RkdGa1E1c0lkaVFFM2xBa2JXSmMvYTdsMjZlMFJI?=
 =?utf-8?B?Ry9hSld1endFWjR3NDVZTTc5ZEdKa2JLcEJzNi8yazEremtVU201WGpNMHNJ?=
 =?utf-8?B?czI3czA0UGZxWWdseFhzdEdsVDVlb1BuZGM5S1hzY2F0TFFOd21IajBRL0cr?=
 =?utf-8?B?YkhlNmhvb1ZFVHRwblpHVGZ5WjkrWHVldDY4S2prVHhrbDZpMFdvR0ZuV1BG?=
 =?utf-8?B?dVgxY1NLQkpYVHhwd2xDSW5FVXppQWdiRElXaThWNkQzRW11MVI4M1pDaEtw?=
 =?utf-8?B?SlFQL2JDbnRheVljamxwZ0U3NjZNSG5kVVBvTlZwbGUrZUV6anFvVlFsM3Ev?=
 =?utf-8?B?ZENiZC85YXk0bUxTcGNuVVRMRnMyYmoraXZqTExKeDMyNUlqNjBQdVFuRTRx?=
 =?utf-8?B?bXl5cXhMbG9uNHZNamFMU3BubENSSU1VeTFQUmNtRlBVNEdRS0p6anN5eHdO?=
 =?utf-8?B?MmI4alAzNW9FdHJwS3ZFY2p5dktXUU5Ta3BMTnMzSWxhQjBFSlM4RW1NVFpl?=
 =?utf-8?B?L2pyMDdPbVVVOHBZQitiNWlMZVdkNzRocXF1SERLRWtjd1IrSktWWHdOcGx2?=
 =?utf-8?B?cTJsQnZmVk1tRmZuNUtsWjhsNDlKZjY1djdiZFZ2enVLdUIwUC8xV0crWW4z?=
 =?utf-8?B?MS9XV1lUM0RINmFBWFVxNldIcStqbndUbjBrQ0NaSDhSNVhSUlZHR3kvRGVG?=
 =?utf-8?B?YzkyZzM5SzVSUitEbTJ6ZVIxYit4S0x4WURJNng4OGg4bklKajRQRCs2Uk4v?=
 =?utf-8?B?YlU1dUkyOUQxcFVhY1EwYlZVdXFaK0hUTTlnUGFYdmNlcTVhcmp2VVRad2N2?=
 =?utf-8?B?U0Y3Rnh3N3ovU2xzTTZsMDUvL2crYWVEdWlJU3JqMmMyWm9PTG13U3hhbFll?=
 =?utf-8?B?STlSVE1aME13SzI4T0Z4Z1JvNEtwZysxOUhETWlKRFJVM3owbDlWeVZORTRP?=
 =?utf-8?B?Z3lmNUVaYzdBZ2h3Q1NXRXoyWGU2WmpCcFdRU1VWSFdYQmhlZUpyZDY3ejZC?=
 =?utf-8?B?Z0pkbDFQOUJ6RGVRRTMzK0tETEQ3Z3hQSi9vM2VoSFFPUGFMQWkvSXR6OEZ0?=
 =?utf-8?B?eHRLOGZNa0FCOGszamxrdyttbUdlaU9FRVlhOXNHaHhHQjBJanh6UTA0NGpn?=
 =?utf-8?B?QjYzejBRS0VSazhDa2tEcDlUQUoxTlRXQmk4WDVReWpFUG43V3RYYUZBN0VY?=
 =?utf-8?B?Q0puL3prbWd6bkpMWHJSVnF1QXZIcXJIUmZFWVJTaGNTR0w3WG5DaWJUSXJ0?=
 =?utf-8?B?MDNnVWFSdnNPUDA4SXlIT3dlWWJ5ZFE4MjEwbWVtcVN5UnJ5VXlFKzVCcjV2?=
 =?utf-8?B?VzhIZFk0WnZmcFFuR0FXSHE4VEZLTklmTFBVU1hKWHNVUzFPeEVraW1NYmlQ?=
 =?utf-8?B?TUYvNGpnK05xaVp1SGhCeDZmMCtOaGFyaExIUlMzOTFkakdOeisvZUxTcS9x?=
 =?utf-8?B?U2FFTkpFSWQ5ZkpHTnRkV1A1TURJcGRnRktrYXl3U09saWNiZVVhSDBxREhm?=
 =?utf-8?B?M0dKVmRzYVppWk9haG5DcWNTOU5mME5TTXhhTTdQMGpERG5UdWtzV2ZMSXhm?=
 =?utf-8?B?LzkwK2xkcVh2V2d3SHdOMHdQVEc0L1J5QnFBUGFyQUEvRm1yS1ZhVUR6NmNU?=
 =?utf-8?B?RUprbVl4alE5Y0dLZ1F0V0Mxd2QwZ2x4dUgvdEwzYTVZeXRrR202OFMySC9B?=
 =?utf-8?B?VG5zMXplOEtGVmJGcHJ0aXV3djZkZUR5SXNRWDBsWE1QOEI1YkZJL1o5djhp?=
 =?utf-8?B?b2xEZk44WXF4ZTlRSndUSUlOTWRHdmh4d1EyTGVOVERxcG1nRWVnaE5ZOGhr?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7829dad2-d773-4019-eca8-08dbcb5e73bd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 20:04:33.5053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xh1Qe6JSsZK8rBlomaDYoDnHBcx+qzDh/vxyavaVnM38yULBb/7AqYgwW83DcWYVah7vgGiKu9dnmhqG0CM0Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4577
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe: A minimal assert for some forcewake
 domain on xe_mmio.
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
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 10, 2023 at 10:00:06AM +0300, Luca Coelho wrote:
> On Mon, 2023-10-09 at 17:15 -0400, Rodrigo Vivi wrote:
> > On Mon, Oct 09, 2023 at 12:22:44PM +0300, Luca Coelho wrote:
> > > Hi everyone,
> > > 
> > > On Tue, 2023-05-23 at 23:52 +0000, Matthew Brost wrote:
> > > > On Tue, May 23, 2023 at 09:38:49AM -0700, Matt Roper wrote:
> > > > > On Tue, May 23, 2023 at 01:56:53PM +0000, Matthew Brost wrote:
> > > > > > On Mon, May 22, 2023 at 08:28:05PM -0700, Matt Roper wrote:
> > > > > > > On Mon, May 22, 2023 at 06:15:27PM -0400, Rodrigo Vivi wrote:
> > > > > > > > It is the maximum protection we can do with the current infrastructure.
> > > > > > > > 
> > > > > > > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > > > > > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > > > ---
> > > > > > > > 
> > > > > > > > 
> > > > > > > > RFC
> > > > > > > > ===
> > > > > > > > 
> > > > > > > > Okay, so, this is more an RFC to brainstorm the future of the force_wake in
> > > > > > > > Xe than anything else.
> > > > > > > > 
> > > > > > > > On i915 the force_wake is built-in the mmio functions at uncore component.
> > > > > > > > 
> > > > > > > > With that approach we had few historical issues iirc:
> > > > > > > > 
> > > > > > > > 1. Display performance with vblank evasion that requested uncore to provide
> > > > > > > > the 'fw' variantes that are actually the ones that avoid fw (contrary to what
> > > > > > > > the name suggests).
> > > > > > > 
> > > > > > > In i915 there were more differences between fw and non-fw variants
> > > > > > > of register functions than just forcewake handling:
> > > > > > > 
> > > > > > >  * _fw() functions assumed that the caller was already holding
> > > > > > >    forcewake, whereas the non-fw functions would obtain it themselves
> > > > > > >  * _fw() functions also assumed that the caller was already holding
> > > > > > >    uncore->lock, whereas the non-fw functions would obtain and release
> > > > > > >    the lock around each register access
> > > > > > >  * _fw() functions do no tracing and no debug assertions
> > > > > > >  * _fw() functions do not check for unclaimed MMIO
> > > > > > > 
> > > > > > > I don't think the first bullet there (forcewake) really mattered much
> > > > > > > from a performance perspective.  For display registers, a quick binary
> > > > > > > search of the FW table (just a handful of CPU cycles) would quickly
> > > > > > > determine that no forcewake domains were needed for those register
> > > > > > > offsets, so we wouldn't be doing anything with forcewake at the hardware
> > > > > > > level at all.  For display registers, the more performance-relevant
> > > > > > > aspects of using the _fw() functions was doing all your register
> > > > > > > accesses together without contention with other MMIO work.  I.e.,
> > > > > > > holding the uncore lock over an entire set of registers rather than
> > > > > > > grabbing/releasing it for each one, and (for vblank evasion
> > > > > > > specifically) doing it all while interrupts were disabled.  For debug
> > > > > > > drivers, there was also a bunch of other stuff that the _fw() functions
> > > > > > > bypassed (e.g., tripling of the number of register accesses due to
> > > > > > > reading FPGA_DBG before/after each register to look for unclaimed
> > > > > > > accesses).
> > > > > > > 
> > > > > > > > 
> > > > > > > > 2. Missed ranges updates. Sometimes we messed up with the ranges, there were
> > > > > > > > other times that the spec was updated and we didn't get the notification, and
> > > > > > > > there were cases that the BSpec had bugs.
> > > > > > > > 
> > > > > > > > For these reasons in Xe we have decided to let to the caller the
> > > > > > > > responsibility to set the force_wake bits for their domains before doing
> > > > > > > > the MMIO.
> > > > > > > 
> > > > > > > I don't think #2 was a reason to skip forcewake in Xe.  Not noticing a
> > > > > > > bspec update (or the bspec itself having incorrect information) would
> > > > > > > lead to even more mistakes if the caller has to explicitly grab the
> > > > > > > appropriate domains than if the driver does it implicitly.  The explicit
> > > > > > > handling only helps in the subset of cases where we blindly grab all of
> > > > > > > the domains (as we do during part of init).
> > > > > > > 
> > > > > > > 
> > > > > > 
> > > > > > MMIO access that requires forcewakes really only should be in a few
> > > > > > places, off the top of my head:
> > > > > > 
> > > > > > 1. Init
> > > > > > 2. Reset
> > > > > > 3. Sysfs / Debugfs
> > > > > > 
> > > > > > In all of these cases I think it fine to blindly grab all forcewakes.
> > > > > > 
> > > > > > Please chime in if I'm missing something.
> > > > > 
> > > > > I think as we implement more features in the Xe driver we're going to
> > > > > wind up with a lot more places where we need to access GT registers at
> > > > > runtime.  A few examples off the top of my head:
> > > > > 
> > > > >  * EU stall sampling
> > > > >  * Perf/OA
> > > > >  * EU debugger
> > > > >  * Various OOB workarounds that ask us to twiddle a register at certain
> > > > >    times in the driver.
> > > > 
> > > > Hmm, ok a lot of these I could make the argument that these are not
> > > > normal operation so just grab everything and call it a day. If some of
> > > > these fall into the category of 'normal enough to be optimized' I can
> > > > also make the argument it is no more complex (perhaps less complex) to
> > > > explicitly grab the forcewake than having the logic auto-grab the
> > > > forcewake.
> > > > 
> > > > What a compromise of in a debug mode we auto-generate the asserts based
> > > > on a table but we still explicitly grab the forcewake?
> > > > 
> > > > > 
> > > > > > 
> > > > > > > > 
> > > > > > > > However I'm seeing many questions and doubts popping up:
> > > > > > > > 
> > > > > > > > 1. Are we confident that we are not missing any wake-up?
> > > > > > > > 2. Are we confident that the domains are set correctly?
> > > > > > > > 3. Are we not wasting power if we are waking up ALL the domains instead
> > > > > > > >    of some specific one?
> > > > > > > 
> > > > > > > I think we're only holding ALL domains during init; for most of the
> > > > > > > runtime MMIO accesses, I think the code is currently attempting to only
> > > > > > > grab the domain(s) that it thinks the registers it's accessing will
> > > > > > > need.  Although that might be working right now, I'm a little bit
> > > > > > > worried about how that will scale in the long term when a single
> > > > > > > register might be in several different domains depending on what
> > > > > > > platform you're running on.  There have definitely been cases in the
> > > > > > > past where groups of registers migrated from RENDER to GT or vice versa
> > > > > > > between platforms, so the exact domain you needed for an operation
> > > > > > > varied by platform.  And things are even more complicated if you're
> > > > > > > doing any MMIO against the media, since the hardware seems to change
> > > > > > > exactly how it splits up the media power wells somewhat often.
> > > > > > > 
> > > > > > > > 4. What about the display disconnection now because i915 and xe have different
> > > > > > > >    mmio approaches but reusing i915-display?
> > > > > > > > 
> > > > > > > > It looks to me that the cons of the current approach are superseding the
> > > > > > > > cons of the i915 approach. But I want to hear more thoughts here before
> > > > > > > > we decide which route to take.
> > > > > > > > 
> > > > > > > > Maybe we have that domain as part of the mmio calls themselves? Maybe
> > > > > > > > a double approach where the caller is responsible but mmio has the range
> > > > > > > > information and double check it?
> > > > > > > 
> > > > > > > As noted above, part of the challenge with forcewake is that even if the
> > > > > > > caller knows it wants to access register FOO, and even if it know FOO is
> > > > > > > a GT register that likely needs forcewake, it's sometimes challenging to
> > > > > > > make sure it's grabbing the correct domain(s) for every single platform
> > > > > > > the Xe driver will eventually support if the power management handling
> > > > > > > changes.  I think that was part of the motivation for encoding the
> > > > > > > tables into the driver in i915.  It seems like GT power wells don't
> > > > > > > change as much these days as they used to, but it's hard to say whether
> > > > > > > that will continue in the future or not.  Who knows...maybe they'll
> > > > > > > eventually start creating dedicated domains for stuff like blitters,
> > > > > > > GuC, etc.  rather than lumping all of those into the "GT" catchall
> > > > > > > domain.
> > > > > > > 
> > > > > > > If we do decide to go back to implicit forcewake handling with the table
> > > > > > > encoded into the driver, it might be worth doing something sort of like
> > > > > > 
> > > > > > Let's not do this intel_uncore.c is an unreadable mess, I don't want
> > > > > > anything like this in Xe.
> > > > > 
> > > > > When you say unreadable, are you referring to the macros that generate
> > > > > the table lookup functions?  I don't think that macro magic would be
> > > > > needed for Xe since we don't have to support old platforms that have
> > > > > very different forcewake behavior, and we also don't need to generate
> > > > > separate 8-bit, 16-bit, and 32-bit versions of each operation anymore
> > > > > (since I think everything in the GT is 32-bits these days).
> > > > > 
> > > > 
> > > > Just the entire file is unreadable in general, trying to avoid these
> > > > types of files in Xe, avoid traps of the i915 did this so let's do it in
> > > > Xe, and over engineering our driver to avoid hypothetical future bugs.
> > > > 
> > > > Matt
> > > > 
> > > > > The forcewake and shadow tables themselves are pretty clean in i915
> > > > > these days, and if we move to autogenerating them from a text file, they
> > > > > can become even simpler since the text file will basically be a cleaned
> > > > > up copy/paste of part of the bspec table.
> > > > > 
> > > > > 
> > > > > Matt
> > > > > 
> > > > > > 
> > > > > > > what Lucas is doing in the OOB workaround series --- drop the
> > > > > > > per-platform tables into a human-readable text file that's more similar
> > > > > > > to the format used by the bspec (exact ranges, forcewake domain, MCR
> > > > > > > replication type, etc.) and then provide a small parser program that
> > > > > > > will convert that into actual code (and do things like consolidating
> > > > > > > adjacent ranges).
> > > > > > > 
> > > > > > > > 
> > > > > > > > Any other idea? Thoughts?
> > > > > > > 
> > > > > > > Once the big GT vs tile refactor stuff I have in flight gets finalized,
> > > > > > > I plan to follow up with another series that creates a more appropriate
> > > > > > > MMIO target for register operations rather than using "xe_gt" as the
> > > > > > > target (even for things completely unrelated to the small GT subset of
> > > > > > > hardware).  My idea is that you'd grab an MMIO target structure for MMIO
> > > > > > > operations against a specific hardware unit, and then the info inside
> > > > > > > the MMIO structure would be able to figure out if there are additional
> > > > > > > checks and/or operations it should perform.  E.g.,
> > > > > > > 
> > > > > > >  * mmio = xe_mmio_for_device(xe_device *xe);
> > > > > > >     - Used to submit MMIO operations against the root tile of the PCI
> > > > > > >       device.  Only used during init (e.g., to read the registers that
> > > > > > >       tell us which tiles exist on the platform) and during top-level
> > > > > > >       interrupt enable/disable (since all interrupts are routed through
> > > > > > >       the root tile).
> > > > > > >     - No forcewake needed for register accesses through a handle of this
> > > > > > >       type since you'd only ever be accessing sgunit registers for these
> > > > > > >       types of things.
> > > > > > >     - Register accesses through mmio can warn on debug builds if the
> > > > > > >       register appears to be in a GT-related MMIO range.
> > > > > > > 
> > > > > > >  * mmio = xe_mmio_for_display(xe_device *xe);
> > > > > > >     - Pretty much the same as handles returned by xe_mmio_for_device(),
> > > > > > >       but if a handle of this type is used to try to read/write
> > > > > > >       registers outside the display range, we could have debug builds
> > > > > > >       throw some extra warnings.
> > > > > > >     - Unclaimed register detection could be confined to accesses through
> > > > > > >       these handles.
> > > > > > > 
> > > > > > >  * mmio = xe_mmio_for_tile(xe_tile *tile);
> > > > > > >     - Used to access non-GT registers that reside in a specific tile.
> > > > > > >       I.e., sgunit/soc registers.
> > > > > > >     - As above, no forcewake needed, can make MMIO operations warn
> > > > > > >       if used to access a GT range.
> > > > > > > 
> > > > > > >  * mmio = xe_mmio_for_gt(xe_gt *gt);
> > > > > > >     - Used to access GT registers in a specific GT
> > > > > > >     - Does automatic GSI offset translation for media GTs
> > > > > > >     - Can either do automatic forcewake like i915 does, or can do debug
> > > > > > >       check+warn like you have here.
> > > > > > >     - Can make MMIO operations warn if MMIO offset is outside GT range
> > > > > > >     - Can also trigger warnings if a GT non-GSI, non-media engine
> > > > > > >       register is accessed from an MMIO obtained from a media GT.
> > > > > > > 
> > > > > > 
> > > > > > Ack on this if we keep in managable, worried code / feature bloat those
> > > > > > that will result in a similar file to intel_uncore.c in Xe.
> > > 
> > > Just to revive this thread.
> > > 
> > > I've been discussing this proposal in the context of a change we need
> > > to make in the display, which is to introduce a wakelock for some
> > > registers access in order to be able to remove the DMC trap.
> > > 
> > > We came to the conclusion that this new implementation is very much the
> > > same as the forcewake proposal here.  From the display point-of-view,
> > > we could simply have a new domain and range of registers to protect.
> > > 
> > > We _could_ implement a separate "wakelock" mechanism for the display
> > > part, but that would be mostly duplicating the entire forcewake
> > > implementation.
> > > 
> > > So, are there any plans to implement the current proposal? Or any other
> > > plans related to the forcewake implementation for Xe? As I see it, the
> > > "wakelock" implementation in the display depends on this.
> > > 
> > > Any thoughts?
> > 
> > Hi Luca, thanks for raising this again here.
> 
> Hi Lucas! Thanks for your comments.
> 
> 
> > So, as I said in the past, I don't have strong opinions regarding the
> > overall forcewake approach.
> > 
> > The since GT MMIO is not used very frequently, I don't see a problem of
> > leaving that up to the caller to take the right domain when needed, or even
> > the FORCEWAKE_ALL domain. Instead of forcing all the callers to
> > go through this extra steps and then have to opt-out with the '_fw' [sic]
> > alternatives for the cases where the forcewake cannot be checked underneath.
> > 
> > So, for the new display wakelocks, that's the problem of adding them to
> > the drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h where the converions
> > from i915's intel uncore are happening to xe_mmio? So, when using the
> > intel_uncore's '_fw' variant you skip the wakelock and when doing the regular
> > mmio calls you just add a wakelock_get/put around the xe_mmio call with
> > the display domain. And in i915 you implement inside the intel_uncore.
> > 
> > What's the downside of this approach?
> 
> That's more or less what I was thinking.  I don't think there's any
> problem on the display side in calling the same framework.
> 
> 
> > Trying to understand all the pros and cons of different approaches, and
> > bringing some people to the discussion.
> > 
> > If we implement the forwareke underneath the mmio call, display needs
> > to anyway implement it twice on the i915's intel_uncore and on the
> > xe_forcewake, no?!
> 
> Yes, IMHO we should start making Xe the base implementation and
> backporting the new implementation into i915.
> 
> So,for this specific case, I think we can just make i915 call the new
> functions in xe and have them backported in intel_uncore.h for i915.
> 
> What I was thinking was basically this:
> 
> 1. Implement the xe_mmio_for_<hw_unit>() proposal in Xe​

hmm probably a new component then?! xe_display_wakelock that
implements and export the get/put domain in a similar way
of xe_forcewake, and then on the wrapper you add the get/put
around the existing xe_mmio calls?!

> 
> 2. Display code uses new APIs (xe_mmio_for_display ops)​
> 
> 3. Update uncore to handle "wakelock domain"​

then on uncore you would need to parse the mmio range and then
call the get and puts, that in that case would be static inside
the uncore itself like the forcewakes ?!

> 
> 4. Wrappers for i915​, make an xe_mmio_for_display wrapper that calls
> the old functions in uncore and add the necessary locking there.
> 
> In i915 we're most likely not going to need the wakelock stuff for DMC
> trap, because it shouldn't be needed in older hardware anyway.  So the
> backport can remain pretty simple.
> 
> Would this work?
> 
> --
> Cheers,
> Luca.

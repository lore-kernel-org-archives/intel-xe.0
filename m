Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B182DCCD199
	for <intel-xe@archiver.kernel.org>; Sat, 18 Oct 2025 02:47:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7281C10E1DC;
	Sat, 18 Oct 2025 02:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9A2wOj8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5944110E1DC
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Oct 2025 02:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760755646; x=1792291646;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FrtaWuMgAc7n7W5PEFdldy2eUkTAe21xOYJ7bunZDdI=;
 b=e9A2wOj8bJ66bis4aWd+B3MU+IG7H3YCL59UX5R2nDscJ+dZTUKAbjug
 HESoLhCxZQUO80puCm70WL+H9b8oSci5j6qTP3a2omZRLWkmncT3hwiHt
 bNNhAcQMjF8QclgfcMzVxqnyovtOfaLnaL8igadd7gbK6Aa/grCoAu240
 Ph/UsV8ljYYp2dneMe1PmulMQYUEgTCA7itVoQC9bKpSjuRYfC6DqoXtg
 zO1A8WsFpu57tHONza7k/0OxmetlKQOm0kam3DXtzZfy7SoIcmeuan5J2
 Hx7ZXCUOFTEKxfPCkSPbL0bGuTPgaCwhhObhp54ka8jVs3IQ5kKSQwi5q g==;
X-CSE-ConnectionGUID: YDsjWpr7QcKGi6XLEnidpw==
X-CSE-MsgGUID: ZM/7VO7jTEC14wLUd6+n+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62867098"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="62867098"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:47:25 -0700
X-CSE-ConnectionGUID: FiRNOh6tSjeyygUDSSiURA==
X-CSE-MsgGUID: G9TIiM/lQJuXbRg6DPgEtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="188171998"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:47:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 11:24:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 11:24:11 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 11:24:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+go498EgjPu1SeFcp1+F/RFr+jz5YbU9W832eJmq9H15Ax/CL3usmu4XdWVKFYKxViR+6uwDa+ytrxrb6sssFt6HSy5iuIOabU3fz3IaZpAym3utIQajE6qLYI5OjNE7pDdOPY5794R+USmQe2ePatZ0MFCnFzba8gkY27s8Lz+jxRqW/R/cbEOcA+8CHooTx16tA3eF07hI3+vNmVPK4DZV9bqsUEsLn9NL+wDou6VqmNu/gsyHvy3N9gZ5rcd3OMRSzeWHyj1SO9HcOJZbZm+7wljT2PsVCbG9LfElhGmtcVrFI3kA5vQA5tOahzH9hdm8d0f+FlQeRNKPAK+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLuZDH3rQf/9nm69gtB2vTSi8G4I5p7ZFUAB7f7yGfw=;
 b=mKEu+VPoWD2dD9w6Z4JSMR+kZAXRbV9GrSYz27jvZNMBBydy4R/X+68+kDCADRqapviWv9SHco85SELrJ+FpbRRi8Z0u3wD17amOFyd+0vD4cW6HdHGXTUX642fYIjeu/MgZ3nCRrjQgJ7UIAgsZGffpsKPA6QnRWkX9G3A7vjER06OkLLVhiTL8VJW1vyPZMG9/iOH5dNPyKe2jnKvJ6+Y4BjQZIUWwbyYnxKZHUuz7/wcLScazPhjJkZfQy6LjdYbujVybOQwhe0e7frOnRvFqcRVFkzJgatRBMqiMFgPCXjXY2R/C+DnatQ5s85QpwAuoqrehcghBhRPACX8u8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7360.namprd11.prod.outlook.com (2603:10b6:8:136::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 18:24:04 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 18:24:04 +0000
Date: Fri, 17 Oct 2025 14:24:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v7 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aPKJwAiyVnbjmoyE@intel.com>
References: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
 <20251017141226.924-6-satyanarayana.k.v.p@intel.com>
 <aPKG2Z1JsuFb97cN@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPKG2Z1JsuFb97cN@intel.com>
X-ClientProxiedBy: SJ0PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:a03:338::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: ddeaf5fd-65aa-43bd-2210-08de0daa59f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3O73zrp/2UJ4iRGVtS9GRdY9UC6Q8alvh7YPrEQ6pTv8fSiulWo71fX0GJ?=
 =?iso-8859-1?Q?gSTRlV2CIIwBOw5/8AG2aEJepmlxAcNk/xTX9ECx8cFcbNbihoeo/HiNmW?=
 =?iso-8859-1?Q?kbtZH4O7RPN1EsPuWq5FNQ7wlOCbax7O+S0cr7LG3DGt0zntB74XI219Sh?=
 =?iso-8859-1?Q?DKnNlvalBdh8XkOKhPNULRPpu0G2REleyDF9oE8MANKwCBFGSgTeWYXRMe?=
 =?iso-8859-1?Q?Vapz0B8zYzHuYYlKmAVQSJtSntzuVwNY4V1Y1rqIPhaZ/L1v26M/bHN4hM?=
 =?iso-8859-1?Q?pEtQ7gJIT/qoPiNcazlqm0f/HGm7T+CwU7KbcpSSH/jCEzFALlWkzx275B?=
 =?iso-8859-1?Q?P+wbfih3Q49kEN2EU0S/rFmasFp1bvcq/6CmwXD3OtRfEEmPS8qr08vgOP?=
 =?iso-8859-1?Q?XZ5k1NwU3rbvKJbhsMLUbZ5Wd3xf7ds5SB+R2m5/4pGCULxf8m2Oph7D5X?=
 =?iso-8859-1?Q?vEuT3ymlgMFonWr3wKC7kMI7BhPtehasBqjMMFZfJRemrVdfbwXbbiiZA+?=
 =?iso-8859-1?Q?JjvsNJDTW5Fi1zRKTB87EI2UCCizUzbxoAWF1HHCVLyB0uXF2KDVo7DOyQ?=
 =?iso-8859-1?Q?XH3tHsm4fWVZ7xXpcWi74BVHgl9B86rZVaRRYTqpjjA0QASWsoTo+5A5Q8?=
 =?iso-8859-1?Q?bvilbWRzvTexHtQ/9VDYp8aTbPQHNiW4U5EW5TyjLrmMigLvhXtBQ4kCOo?=
 =?iso-8859-1?Q?JhaQRW2VWJC8Wim9xyauFvFS9jsOSbW8ABgbzF857PkkJ0W9rjFbjpM8uu?=
 =?iso-8859-1?Q?s/tw2GjV3+s50rQBdMi1ufa6+IiptHc4bEPkSJTrjtoNsydOH/o6m612r4?=
 =?iso-8859-1?Q?gA9Kt5PjRNMvkM41nANeMFaf/3dJ1CJhxRP18gZR2eWVLPVGKqPsEze4ce?=
 =?iso-8859-1?Q?y3mHyf9jG2E7obyn9i9ewTyMM+qgipqYHaIoe+cuov7eh4YH3V2TH+VBn8?=
 =?iso-8859-1?Q?pi+YKwcFriFw4WhH5kCGMUINwQAlgn5h7cADKoqBuqc3N35rntJ85B6/Gz?=
 =?iso-8859-1?Q?1MXLbLaj8a2XZ6X9JtBV1QZFtURGVPwnxx+HdKUj60VFMbbZhNFIeNr9XH?=
 =?iso-8859-1?Q?E30QllvMXdLbhtW8EHXNtEXt3alnlUIdznILgxjwOgq+AK0UQlaDG4K4Tv?=
 =?iso-8859-1?Q?GZb6iRLxlKZdSxdX4WDRUYRwP56DgnLgu0x9t3s4snUPdm5i+QZOGXLQle?=
 =?iso-8859-1?Q?yKk00XxkPW2WeW9vrgOgu9JPA1jlre/G32I3llAe3qdT0vvKEOYJNg2dL8?=
 =?iso-8859-1?Q?6Ke++Z4jmaZbEyzYWudQNRTr0YtWg7OeL0Jf5eXLqfc5+iU9VH415KFa65?=
 =?iso-8859-1?Q?C5Rh99p15f7G2OfnbyRTmPm9m+4CU82bHcTH9pnK7LborCOD10/sopgw/S?=
 =?iso-8859-1?Q?+xTXfN0K5eCd78vNcgpz4WeNUwJVusRcOCcjws1Rwi3NoBS+M1ORJKGFUd?=
 =?iso-8859-1?Q?oxzu03nU1ZWoK8x5+CecuXuurULqUFaGp3Ss9qG9FYMrA1pjEosz5z+VOe?=
 =?iso-8859-1?Q?vkIF1pm9njgTP1G9uoLMFS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SZI4ngH1Q3gHGYyDdv+oC9z0kHdw4rP9OvoY1vll36xY0wi4WIR85BMpme?=
 =?iso-8859-1?Q?i9d9cXsZQcSe0XBN7ZLsHyv6hSQZ0FTlVu9dzSUU6YRIIXN9+96dXVQXTM?=
 =?iso-8859-1?Q?cgePm/JONbG6nyA9T6v63xDA30E/OMI0CPkS3kahZmV3KrKfe74yWKyO0I?=
 =?iso-8859-1?Q?PoHLt3IhS/YZRc1C+mdcZL7sh+0fL0yz5CD1fq9wi2mA8vh/SOfgvjFW1q?=
 =?iso-8859-1?Q?Q0wcrcemZFwcCMTGmoiuqgDdsGdZLHprQ1iZfM4o89GF56ceeFY4+gXYsm?=
 =?iso-8859-1?Q?e8W3RsAGtBoaxaQq2tdBbQspx2W2vu3e28TG7tOfidtJUX19hHrlmVzYA9?=
 =?iso-8859-1?Q?R/MPwfZqtDBFvSuFaEQT1WQiEt1va0Bqe7xLS5JtJvqPqVEDmBWcNl6Yax?=
 =?iso-8859-1?Q?uHZ1FRMrDldL2lYGbWhWBfOQwe5cs83Z9+lswQvw269Fc4pJBdjQjkw/Gy?=
 =?iso-8859-1?Q?xQ2HWi0AeEOFIYj7GrgI9Wb8titOdfYXv014sEKKT2UStjtUQoEiLkL8Du?=
 =?iso-8859-1?Q?ZJ/I8r/E32+UFCvfzSjANjRpBKH/k+fjVX2K5n8JJdTAxhLz6vvz9bki64?=
 =?iso-8859-1?Q?Eg8SNY+V0AVhxtwMxbZ2lXw794nagnn2sZ5/huYEtqZQh04UDhOoiy0xUx?=
 =?iso-8859-1?Q?5yuaWjP1m6JxB9bjZg+qOKxE5YkPQq19Fs4u+0OSROGv6aRr6gIAzmlbqC?=
 =?iso-8859-1?Q?Zwz8yTFEhWERqAo92arnV6YJZvl7F6KL2YCiDL9NYqMA1eR31VCEQLKUp/?=
 =?iso-8859-1?Q?CPb3wwQpcjSLZEeKtb1BKs8DcbxqiZ1LBwA4zH3ti/IhGye0gZ0mb27uHd?=
 =?iso-8859-1?Q?TSBfCAmd6htJ/WuetIdM/nRaUrWegdNkDOkkej7nG2/4SsnyM5a015jFcC?=
 =?iso-8859-1?Q?btH+qQGLu8vLFQB6YtrBxdj+fEjrT5NxL45x+ibBttBzwMm8weHl7ujjLs?=
 =?iso-8859-1?Q?mhdwCyltrp5H8bXSufJ7UY2Axnbeia7ivcUCrZBxrlLRkURp+nDOLjx8+D?=
 =?iso-8859-1?Q?KmiFq46wOxzjg8setftx5X06iFpWYr5j898X58avqVSAJhFzanN5YkRQk1?=
 =?iso-8859-1?Q?82rYHxCC/KsqXcih4hutdbnmVaaYnX1uMM+RQXxpnbdKERqj6vNqbXNW10?=
 =?iso-8859-1?Q?PHaKRmZMYtzq0UIp8ZK6oddr3/BLanW9dgJMnJTOxsZUSW9jgl1fGHiI7b?=
 =?iso-8859-1?Q?UzzBCtbPjbRTLIMsMEXQWlNEN89w/FEPpO/DIqNCXpvW7PKf+//1yFZuAX?=
 =?iso-8859-1?Q?pWGUYHcbWqkwGpG58kQqn3K20roj32a9IxjGJ3oEGj+j7Xwgt3qfLCywCo?=
 =?iso-8859-1?Q?S1d8ogGsjLbu0a8eglH5fj/8jy5N2F9+griz6hFKeEL5zvtydyE/CRGyyo?=
 =?iso-8859-1?Q?k/deGtSG7qx6NRPK5iuFSMNBi3edNuhOZvSJNqoJa8bN8kBuM0tj/uWhLK?=
 =?iso-8859-1?Q?Z//mVOaDWtrTqUpffJwF+q9t+TnJPvLTwDIfXXZmRXPkO7TGVbW9SqkHfe?=
 =?iso-8859-1?Q?GVFYz5OW0PR6GOZlAag+ouW4CT8VBpK9eNneL4425jhnWYwVLoZX7fWySQ?=
 =?iso-8859-1?Q?nB1nZnMzJ8h9URa5/Hx0eIyv+VwTsc/fMlqo+3Fkl8FSVkfkZGko6zUoDa?=
 =?iso-8859-1?Q?igqDGG5kJPtxNj1NUwVeypvp1djA+euGLrlwj7L2tpRdpOQZ9NeB2EuA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddeaf5fd-65aa-43bd-2210-08de0daa59f2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 18:24:03.9647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUMg2O30sNv6PLLpRZWfV3lNUyehOPx5GhBWMZOonHp+JpD+1IHObR25N2CaBTQOJe3fjaHoeSwEebH/OB1xwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7360
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Oct 17, 2025 at 09:11:37PM +0300, Ville Syrjälä wrote:
> On Fri, Oct 17, 2025 at 07:42:28PM +0530, Satyanarayana K V P wrote:
> > The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > save/restore while this sequence is being programmed, partial writes may
> > trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> > instruction to write the sequence atomically.
> > 
> > Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> > 8 dwords instead of 5 dwords.
> > 
> > Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> > chunks.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > 
> > ---
> > V6 -> V7:
> > - Added description explaining why to use assembly instructions for
> > atomicity.
> > - Assert if DGFX tries to use memcpy_vmovdqu(). (Rodrigo)
> > - Include <asm/cpufeature.h> though checkpatch complains. With
> > <linux/cpufeature.h> KUnit is throwing errors.
> > 
> > V5 -> V6:
> > - Fixed review comments (Rodrigo)
> > 
> > V4 -> V5:
> > - Fixed review comments. (Matt B)
> > 
> > V3 -> V4:
> > - Fixed review comments. (Wajdeczko)
> > - Fix issues reported by patchworks.
> > 
> > V2 -> V3:
> > - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > 
> > V1 -> V2:
> > - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> >   (Auld, Matthew)
> >   - Fix issues reported by patchworks.
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c | 112 ++++++++++++++++++++++++++------
> >  1 file changed, 91 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 3112c966c67d..e0be7396a0ab 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -5,6 +5,8 @@
> >  
> >  #include "xe_migrate.h"
> >  
> > +#include <asm/fpu/api.h>
> > +#include <asm/cpufeature.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/sizes.h>
> >  
> > @@ -33,6 +35,7 @@
> >  #include "xe_res_cursor.h"
> >  #include "xe_sa.h"
> >  #include "xe_sched_job.h"
> > +#include "xe_sriov_vf_ccs.h"
> >  #include "xe_sync.h"
> >  #include "xe_trace_bo.h"
> >  #include "xe_validation.h"
> > @@ -657,18 +660,68 @@ static void emit_pte(struct xe_migrate *m,
> >  	}
> >  }
> >  
> > -#define EMIT_COPY_CCS_DW 5
> > +/*
> > + * VF KMD registers two specialized LRCs with the GuC to handle save/restore
> > + * operations for CCS metadata on IGPU. The GuC executes these LRCAs during
> > + * VF state/restore operations.
> > + *
> > + * Each LRC contains a batch buffer pool that GuC submits to hardware during
> > + * VF state save/restore operations. Since these operations can occur
> > + * asynchronously at any time, we must ensure GPU instructions in the batch
> > + * buffer are written atomically to prevent corruption from incomplete writes.
> > + *
> > + * To guarantee atomic instruction writes, we use x86 SIMD instructions
> > + * (128-bit XMM and 256-bit YMM) within kernel_fpu_begin()/kernel_fpu_end()
> > + * sections. This prevents vCPU preemption during instruction generation,
> > + * ensuring complete GPU commands are written to the batch buffer.
> > + */
> > +
> > +static void memcpy_vmovdqu(struct xe_device *xe, void *dst, const void *src, u32 size)
> > +{
> > +	xe_assert(xe, !IS_DGFX(xe));
> > +#ifdef CONFIG_X86
> > +	kernel_fpu_begin();
> > +	if (size == SZ_128) {
> > +		asm("vmovdqu (%0), %%xmm0\n"
> > +		    "vmovups %%xmm0,   (%1)\n"
> > +		    :: "r" (src), "r" (dst) : "memory");
> 
> AFAICS atomicity guarantee is only given for the aligned variants.

Yes, I already told the same.

We should probably avoid at all the word 'atomic' even in the subject
and anywhere else in this code.

This is not an atomic memory write. It is just an ugly hack to block
the VM-stop in the middle of the BB write.

> 
> > +	} else if (size == SZ_256) {
> > +		asm("vmovdqu (%0), %%ymm0\n"
> > +		    "vmovups %%ymm0,   (%1)\n"
> > +		    :: "r" (src), "r" (dst) : "memory");
> 
> There is no 32B atomicity guarantee listed in the docs.
> 
> The only bigger guaranteed atomic thing I can see is
> MOVDIR64B but dunno what subset of CPUs have that.
> 
> > +	}
> > +	kernel_fpu_end();
> > +#endif
> > +}
> > +
> > +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > +{
> > +	u32 instr_size = size * BITS_PER_BYTE;
> > +
> > +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > +
> > +	if (IS_VF_CCS_READY(gt_to_xe(gt))) {
> > +		xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
> > +		memcpy_vmovdqu(gt_to_xe(gt), dst, src, instr_size);
> > +	} else {
> > +		memcpy(dst, src, size);
> > +	}
> > +}
> > +
> > +#define EMIT_COPY_CCS_DW 8
> >  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> >  			  u64 dst_ofs, bool dst_is_indirect,
> >  			  u64 src_ofs, bool src_is_indirect,
> >  			  u32 size)
> >  {
> > +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	u32 *cs = bb->cs + bb->len;
> >  	u32 num_ccs_blks;
> >  	u32 num_pages;
> >  	u32 ccs_copy_size;
> >  	u32 mocs;
> > +	u32 i = 0;
> >  
> >  	if (GRAPHICS_VERx100(xe) >= 2000) {
> >  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > @@ -686,15 +739,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> >  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> >  	}
> >  
> > -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > -		ccs_copy_size;
> > -	*cs++ = lower_32_bits(src_ofs);
> > -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > -	*cs++ = lower_32_bits(dst_ofs);
> > -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > +		  ccs_copy_size;
> > +	dw[i++] = lower_32_bits(src_ofs);
> > +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > +	dw[i++] = lower_32_bits(dst_ofs);
> > +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> >  
> > +	/*
> > +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > +	 * save/restore while this sequence is being issued, partial writes may trigger
> > +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > +	 * write the sequence atomically.
> > +	 */
> > +	emit_atomic(gt, cs, dw, sizeof(dw));
> > +	cs += EMIT_COPY_CCS_DW;
> >  	bb->len = cs - bb->cs;
> >  }
> >  
> > @@ -1006,18 +1067,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> >  	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> >  }
> >  
> > -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > +/*
> > + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > + * save/restore while this sequence is being issued, partial writes may
> > + * trigger page faults when saving iGPU CCS metadata. Use
> > + * emit_atomic() to write the sequence atomically.
> > + */
> > +#define EMIT_FLUSH_INVALIDATE_DW 4
> > +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> >  {
> >  	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > +
> > +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > +		      MI_FLUSH_IMM_DW | flags;
> > +	dw[j++] = lower_32_bits(addr);
> > +	dw[j++] = upper_32_bits(addr);
> > +	dw[j++] = MI_NOOP;
> >  
> > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > -		  MI_FLUSH_IMM_DW | flags;
> > -	dw[i++] = lower_32_bits(addr);
> > -	dw[i++] = upper_32_bits(addr);
> > -	dw[i++] = MI_NOOP;
> > -	dw[i++] = MI_NOOP;
> > +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> >  
> > -	return i;
> > +	return i + j;
> >  }
> >  
> >  /**
> > @@ -1062,7 +1132,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> >  	/* Calculate Batch buffer size */
> >  	batch_size = 0;
> >  	while (size) {
> > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> >  		u64 ccs_ofs, ccs_size;
> >  		u32 ccs_pt;
> >  
> > @@ -1103,7 +1173,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> >  	 * sizes here again before copy command is emitted.
> >  	 */
> >  	while (size) {
> > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> >  		u32 flush_flags = 0;
> >  		u64 ccs_ofs, ccs_size;
> >  		u32 ccs_pt;
> > @@ -1126,11 +1196,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> >  
> >  		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> >  
> > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> >  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> >  						  src_L0_ofs, dst_is_pltt,
> >  						  src_L0, ccs_ofs, true);
> > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> >  
> >  		size -= src_L0;
> >  	}
> > -- 
> > 2.51.0
> 
> -- 
> Ville Syrjälä
> Intel

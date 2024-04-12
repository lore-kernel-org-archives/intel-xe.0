Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA5BC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 14:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EE710E914;
	Fri, 12 Apr 2024 14:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXrOHnhm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D130610EA96
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 14:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712931528; x=1744467528;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N/pbRsuFQGTGlw/Uy32R26hO6wih8I3uhO03IjlolLI=;
 b=EXrOHnhmJ+Lnb/5R6ZLvP4bwyRH2vZpCOulPIRk7OrjByCTsJwK965kA
 o0KozLgdlCLPC4lFUCbhz2qvbBsMEMdn1cQeVTU7040sBumYIgkh8rvpL
 1i7ZnkOX9m69gK5JMvNlvapy9IeMhRw445cMOUJHjQVp10fOFi2eO2H6Q
 wqDswhIbRiso1Yfj/0oq8d1u6hTJTFcxYRPTj1G50ET/n2DmGe2/kUZJC
 YlIMEnmGOJDSn7PmmQ3hzhhReJqkE8SEucaOQkPKegLmMZn+ZRujd6Sb3
 oNwmJ2V2UsskVaWxlafzMteJXDf74YuImMhl5Q5xliYhc0+oBpk45Z/0X w==;
X-CSE-ConnectionGUID: MTRH8oEQR0O9K5oj2XUbeg==
X-CSE-MsgGUID: Qpk8qzorRcWNcmFIxfRtIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19806729"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="19806729"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 07:18:48 -0700
X-CSE-ConnectionGUID: 0PNILFlTRCOgbxQ0YR5wqw==
X-CSE-MsgGUID: M2Q/schpSi6gq7lEk5mtBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21277947"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 07:18:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 07:18:46 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 07:18:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 07:18:46 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 07:18:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZnc1HkatVwnksEcTG7Dy8vNsMSuoCpVIdzdjFJ8DVPelubA8wxHewup4vXvvGJ0pDidxNRT+iARKI3aoDXap3YqKJI8odpLv0o05FZKG+7YonLkw5Tl6TQNdvPpHpugLJeQdDsObyF8LL2THR/jYfKDW9qYJ9F+gQTAPxh+vkBi/zPbOJFCpE+0lV6GjOz/ir2iuUng5S8XNCjIoWtxXzRxLGaM4jrDU0Zogtpdi6Vq+zBWajqSOKJGiSIU+0zjjbcHidHhj2qCzp8ZK5d//9n484+4ErYArsowQBAB4JvG1qYHOXyRrviOLyIEZaafM/ut+NLiufzNV9iim5+qOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d++fNpzD3TOH1gQ+CGDgvLCdegU77mTT066lm3EcJ1I=;
 b=mVdJTXtuXZ44HUDoG5+s6sUdOncqNjAenBYxCNvqNy2J5+lwPY9MCay6Gi+Gx7K57u3uDp982mY6TpL1rMnz+gDIYKERUAGH3fKynquN+IZNe44JBfLbn62qL0lGAZmyQxQEPEviG3rkVSujO07rRDyENSUW1ATIUoQ9kGDnHlQoiYUtt7MGr+ZEPzj5BqPC4E+DiCOgc2i5T20s8PDFRBs4vh50uF3awGnY9xFweRMZcQf8IA9M8yoqdyV/e5mRdVfUC8H7p01O4Rj1hi5Xk3Olq/eJikn88OOVOnkFISfcgHkVJqzpkMZiipdApvTF2Pxa2xhMRcvT4QGA4pQchQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.10; Fri, 12 Apr
 2024 14:18:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 14:18:43 +0000
Date: Fri, 12 Apr 2024 09:18:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Nathan Chancellor <nathan@kernel.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Dafna Hirschfeld
 <dhirschfeld@habana.ai>, Matt Roper <matthew.d.roper@intel.com>, "Niranjana
 Vishwanathapura" <niranjana.vishwanathapura@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Generate oob before compiling anything
Message-ID: <2vhlfwcxjtpjjlj6ddpfuunkqanfrvbdzw76mfsoa4rtjmm2gl@aaqz5bxidaa6>
References: <20240411210703.3296782-1-lucas.demarchi@intel.com>
 <87v84n3w8q.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87v84n3w8q.fsf@intel.com>
X-ClientProxiedBy: BYAPR08CA0062.namprd08.prod.outlook.com
 (2603:10b6:a03:117::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c86cf4b-647a-454e-e215-08dc5afb7542
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Uf6wvD8kqgvuqgh7Bf611yHyH9fJvTOQXBgKDDrSaV8oPugLGhSaGOgObDZRmJ/hFWIylAB6s/FlMaxhTm5HRaRVJI9vSoKEdlD0c4ElB25hbu7q90TNaJbeiU7BJsLdHPTX/nmB80V4ZBmbyz3Dy5l057Ua+yxHzGwOp1UUqgObAN4ykiyZ/Eg2Ybqx9tvV4lt2Vayum/FK9l4mpubKUHXgU6e5K6FqceQeRax2jr4dkqNNrAwQSIeVPtgM++YwU9ex4GYc0O+U76WQ1po1h+X0a+zjcNBYJod1CCOG4YZVpOHu13GrhzlUoSrJfn92g3zn3440DVSrZ7kE1+qsuE0K5ledSvxU6nDOlOppOc83J0GksUHBqaI9ZgGwqARreUgNvD7QwGTrMNIb78Gjil64Zb8l1XaLzJVLm7/+6GCWyGVjP1UeoWvRUSnUJkJ3sIk/JS1i7/ECmXUpU2GiD3iYkcn6PVKc8Uy4xfvQx5BX7SVndWwg8M6cciVL85mHF4QrlsNxpA7rr65kUvCXjowaDr3ij4e0t1DjpW7TpDpyO79HTKbPmie3u16oTqQ2c6DPSCuKliN+2Elk6BlUgmRrnObMynbjU67TpntWmD4uIB7T/JfKBbPH+ZY7adqcYyPstmZ5MLyT+SYHgyWlzTWAiIy2E3FuZarmi89Z7o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EycsTzR+eY+6ljRoHFAtBV/W2cA+46pOFDX3XA9JQtl9cJK+8rVllCBeWY7Z?=
 =?us-ascii?Q?zLIRPLXNymhDUf9rNe7ui6854nFTlZ/vppoVczq+tfO2AuXtEGy/4CNjXSvQ?=
 =?us-ascii?Q?7KXsTREHfecAV+WnTZFddfhOTar9JRHN3kkxLRIjXGGozl7t3HL3QtQX+9b/?=
 =?us-ascii?Q?k8Jz/sg40Cw0bo/jKRaaBtem5UaskOFsMOqE+qpHJGqODNKEsueRfUldURB6?=
 =?us-ascii?Q?1fcvXT8do3bTqd9fJIKhB7QEatQitRpzJN8pOc8LCe36ar72fA2adPDf2LXI?=
 =?us-ascii?Q?OtzMK8hexgVTVe5BWL5KX3qa3B4nYzHX1pYxdKZUNanxoNdiVw8Oy2BSBsVT?=
 =?us-ascii?Q?1f12X+M+P92ps4lnPMf+iPQykfYiwX0tjCZ1o/SJYTy6yO7dxXa3z4MOkaCe?=
 =?us-ascii?Q?+hEJ870hdlG8VUzrZ76qrTRzBXKcBNWsyupHFHUTEviXR1Ak6crs504Koi86?=
 =?us-ascii?Q?qev6hb2t9BmfUqN6yCTKA5DjnUaZYaS6qfz+leqRJPaoebzIfcs7c+GKkN/H?=
 =?us-ascii?Q?ovzMl2AA4KYImGm+9KDblyPFEtJgQQIUtWWXez3+y0TetzICMwUsiJCYf5+5?=
 =?us-ascii?Q?oZqNilYMULUlQsL6vsKc2bLjazXVERrKuvD5rdcEyLaRQUo1VUbExLkGMt5n?=
 =?us-ascii?Q?eSJmAE2yBMeJWRu4nvqImwKZgfZv0WQwhipmGH87/852FSNfh+6QVKaX1KIA?=
 =?us-ascii?Q?0cihWrgN9Yq8a1bNtuoJk6cbMv78VhZjIW/ZNEH9SQnItt/49WWE0zpT7z+0?=
 =?us-ascii?Q?P7nLQ+FCfUudTQqSdsdLmGclugIvn5WHsSFw9SJx47unWhV4BEx7PoIexLkN?=
 =?us-ascii?Q?fMcihzhHJSaRRKeq6YshLWR3/hU3+YV6oOXDHnRXi/ep9U5rQg64+1Ypqv8n?=
 =?us-ascii?Q?D2ydUnwPpuZSdJeU3ksV5HPViwzKG9diY4PMcO3vukHSGV189UeFcDjeUDua?=
 =?us-ascii?Q?G5CvUpjnxLxC1Xk8K37+HFyVaQ69U/R+yMM/HumqUQan8m/Lls5kjmmtGPTs?=
 =?us-ascii?Q?/1phig144vpun4Lf2uQLfhyH/YskHCWMwH1BnuBbqkRExU4iwnr7f8YCP7Ld?=
 =?us-ascii?Q?rR8zQnGn/s+gv0jVqQeMzrvDnATeYa78AMTfzUCN01n72//WNpiqat2k/B+H?=
 =?us-ascii?Q?t9GDFgozk0aZ56S3Ksw97KuUXcdlN90P0OVPa3uQ2DvIZhsuEkoyYz1k+wQX?=
 =?us-ascii?Q?Lx8OKI7mfYZHcm9P7nJMWVmd9+2gsuChQ49HzEUeHH5chSx4fOq8jgU09GN8?=
 =?us-ascii?Q?4xESx4rV5O0vuUmfH81J1dx2Lns1lXh58bIdNnOQPadbh0uOAugo0EhlYQKX?=
 =?us-ascii?Q?1A7u6JkII38X5q3nBGxvRkxWCwoW6xMzHBTYXEpMVYi6rneBBk04vQbk3xxG?=
 =?us-ascii?Q?kRnaW0pvxplHFcTOI0jklW7+jsCCL02mSsxBz4vDU/fMq9qbySkGPIhPMUXp?=
 =?us-ascii?Q?0m6lXcTLFmK6COCB62OpEf8qMbnpGISXK4/yaErlGUrtYYu472pvWqFCc3w0?=
 =?us-ascii?Q?QlXFnSpK24wmnikTaJsOKHO2TD9HnUrS6VKs4nbjI2oHLs4KnN51SHzMWFKc?=
 =?us-ascii?Q?HkD1BChPC3aVVuIjqTfJBrvcPntIvKE5kYTeMAnEYFyIWNor1OdeeU3kF265?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c86cf4b-647a-454e-e215-08dc5afb7542
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 14:18:43.2647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uzYqiI3qhjXqDjCgFj5ql+UySQD74xt2Rnm9uJyr4xBCEpecyrygQNMU4LtXmVhXkHRzDeE4eZRlN3YU8CYVARigLjHgNMgswEIuXoWhUIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8562
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

On Fri, Apr 12, 2024 at 09:56:05AM +0300, Jani Nikula wrote:
>On Thu, 11 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Instead of keep adding more dependencies as WAs are needed in different
>> places of the driver, just add a rule with all the objects so the code
>> generation happens before anything else.
>
>What's "oob" and why is it used unexplained everywhere?

from xe_wa.c kernel-doc:

  * platform. There are some basic categories of workarounds, depending on
  * how/when they are applied:

   ( ... )
  * - Other/OOB:  There are WAs that, due to their nature, cannot be applied from    
  *   a central place. Those are peppered around the rest of the code, as needed.    
  *   Workarounds related to the display IP are the main example.                    

This can certainly be improved and the link to wa_oob.c made. But it's
not that it was not explained anywhere :)

Lucas De Marchi

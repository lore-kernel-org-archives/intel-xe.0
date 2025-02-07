Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE80C0219D
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 21:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6102410E143;
	Fri,  7 Feb 2025 21:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eci5YTJx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E92710E143
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 21:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738964269; x=1770500269;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zjGwR/TU0G/goFE59EB7EczcKa3i+J8ofwwloY6SHpw=;
 b=eci5YTJxSPQ0THlkwdoVS8WZKnSoLQ6x0snIcoz4F2ps0h2+y+urkUeA
 x7oUF4q6kXTqtL1m/J67xngr/uKeTCoGOcjDnVcWR6PZyyp2pHVdPC2DL
 jONYY/GwA8o8RxM+qJDgbiIV2YcOD14DUMzCTd8W9mlsuwfsqTPVE30V3
 0wygghdCy63xEQSwHh8EmAvqrhl+94+HYrtnTZfFoViPAdaQdZ5Nl1oif
 0nU2bdl4a3DtUx1CMJkqWo5PW0qe1WxH2rsbQsEZnZBHts9WSPnGq6bIw
 YQDxJdlgMw69mzD4bfTscAek7sBLgRjQnYopCd4lvwhBvk5koybcMZGPj A==;
X-CSE-ConnectionGUID: xCmNwPT/T/2nfGvYUl8dtw==
X-CSE-MsgGUID: spAYu3USS9CiF0FbYD0eLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43380238"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="43380238"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 13:37:49 -0800
X-CSE-ConnectionGUID: rWZH8XYzSKaBNtMc5HLOTQ==
X-CSE-MsgGUID: ff1n1IdIQQCm3vdEpIEcxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="112264817"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 13:37:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 13:37:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 13:37:47 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 13:37:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qp1Ar0HrewD3xV2Hq8gl4vK10twWwiLDshP4fZSyB8PM3V+KAskFjOS/HNqh+YaeyasPtCEPpxrj+Ct+4MpFFWlcD3PLAEqyiVedeFfxhg9mP5jIqQFVXO/AV+a+kbHEZ2DnHnhYLdpkqlAlUzsoqwyqLT+0VI1CeXsGtgSq5zDen2PxX4yuVr7LodtZ3lOnxewukfRm4kzmfi3G6N/Y6NSV5hij+DR63S4Gbzxjo1Qa3V/wzED5rjbnfClQgcublJo/4yR4Y9i8vMX4GdXFRwLtw/3bC1UaJvpsg+o3uUI1DD5C48+U32kYXY2dZOGVHikBkg5UcQmTqPYCddZpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfC38PfxCFxPMDLStrLhcFxQMspl3+rrctWW9LrLVZk=;
 b=EjWIuhMvM0MAZF0gRDi7z/14bx7mJCG4ebDVCqAQ/VYWO8vSjB15utACW7Fiac9aQ+THgk6kk0G7aIVN9yeYEjsWES1AMlAI5h/v0kR3W3D6HvQFjq57RjXeRKuZxTzoxWncHxbpxe3bv75IaGi/dEx8OEpFN+Uk5MPXdLdwkl/FA0vgOUleSv3UlKqul4kiIQp1qV0VN9WuaIBDT5dnBRsN8xdhithpDjs/gIyYFdXp08mbwZVaXNKay5KUBylhsR5HOiAkxgbRMewK+cxim+mKsScFsaM01EttB7lnLCcP56LeIayq/cmmYXCuvwjd2AaUieRZByfiP+OxuKz9AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB6743.namprd11.prod.outlook.com (2603:10b6:a03:47c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 21:37:42 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 21:37:41 +0000
Date: Fri, 7 Feb 2025 13:37:39 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, John Harrison <John.C.Harrison@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v5 3/8] drm/xe/guc: Expose engine activity only for
 supported GuC version
Message-ID: <Z6Z9I0Ls5RUdgtFC@orsosgc001>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250206104358.3436519-4-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:303:6a::10) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: 48b18146-add9-4b52-fbe2-08dd47bfa697
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXpMRTNJRkdydlJ4RlN4VEl6UFhoSkpoY3RtcGdGQ3FnWDNCSlhsOEd5Zjlo?=
 =?utf-8?B?SVVPSlNEMUx0RXdYdnVSQW5GQXkybThzd0JJajYvRGY2eWhtb2tzYTRIYUVS?=
 =?utf-8?B?OEhMNEx3QzMwT3poTXEyWDVCWCs4RGRhR3R5Q2F6aWZRU2xMSFBiU3VNS0Rv?=
 =?utf-8?B?cDM0YlVMK1kxbmpMcFZvVEQvVGV0S29JMlNoeCttRVVNUnZLU05ZMU52OHZ1?=
 =?utf-8?B?L3hKSU9zZjgxQkU1M1ZQRHBrK05JQURIbWtSY0hnZDdWaGlUY0lDQzlLMDBt?=
 =?utf-8?B?aEpDbEJMRThxbE9pbkc0MWxVMm9pK3hQVEUzcEh1K0hoVGFrL2p3cU1FWnV6?=
 =?utf-8?B?WjA5RUxUYmwvQ2RUOFBoMkFpZCtpRjhpVlkzRUFsdVVxZ2JLK3cydXRzREg2?=
 =?utf-8?B?d3hDejlBbElMSmRjaW9ZcUh4aHFyZ1BlTjdPdjAxYi83OEgraHh6VzIxeFVD?=
 =?utf-8?B?YWRFb1AvSnJCU0k3YjdLSUdlbXBoMWxNY2gxZ2hFbXJyU25jeXh2YU9SMmZm?=
 =?utf-8?B?aXk5UzdIZ3RKSjFnU011clFOOU5tYVBPT210NEpCNzUvTDFEcW1sVkpFdzd4?=
 =?utf-8?B?clVJTUNoV1hFOWJDd2wrNnI4WjAvaUVqcWtkRS9aQ0FwemtrV3JRYzNQVjNi?=
 =?utf-8?B?RnJOTldGNnZoNnB1eWRxY1FnVC9idUQ3RDFLWHFJY2ZidU0vRG1SNUo2dVZC?=
 =?utf-8?B?ZVFnR09OUnZ2VHhvS0l6RzlwdVh4TERsaXV0cGVkK1ZxbSsxY3A1T0RCdEVh?=
 =?utf-8?B?ZzhZbHR1UkZCclRWa0JHKzl3L0JSQlIvVy85RHNMU2FKM3ArOHlvYjFneno4?=
 =?utf-8?B?U3RJTEJ3ZlZmTkFsSlE0MkR3S29vVDYzM25XSGJLbHUrUWUwVGgxTEdPNlB2?=
 =?utf-8?B?UXJFUTVJdjhGS0NmTFRIVWVmK0tBb1NodEdZUVVyWWdYMUxWbXN2NnlLbVEr?=
 =?utf-8?B?a2hoSlRyWEhVSTZnTGNBbkliV2pCNDcyVHFFZFlFSStpclc3d05lQ3BFUkpm?=
 =?utf-8?B?TGxjUWFhVVlXZC9ZS21kUDg1eEMvSWwydEtTYzJ3cXZCQWE4VFdQMlZ3azdO?=
 =?utf-8?B?Sno3QTFwaGRyd0E4OGFCaTlLWW9pbGswQ0F1bjZFdTYralRZdW42Z1pveGlC?=
 =?utf-8?B?ZXFSeGZQbXpLQkoxWUk5VXlYWXdRdE1MdHZkeHR2SFVTVGlNZ2UyS0M2bjBI?=
 =?utf-8?B?Yno4TE15V2tLYkIzTEdHSGF5eFk2UEVUcVlwMzBPZWhrTWZWa2xwdW84dmJq?=
 =?utf-8?B?Zk1CSkZ6MG5NWERwOHgwR2JUZnpPcnlaVUFyNnVSd09WbGJzWXBzN3o2OCta?=
 =?utf-8?B?a1Q2TU5GcWZCdDRadVZQSStnY1FRbUlPclJtN0x5aWo0dGJTVFRLbDc1d0py?=
 =?utf-8?B?cUsrcHpRZ05aemxoQXRwdGhLaVlqMkE4UVBoZW5oMDVXcFNDQ2xUZ0RFd2h2?=
 =?utf-8?B?aXZyd1NrdlUrWjFJS1RaOFVLdG9hT1B3dkI5Zm9vTjdxTzBZeXRBR3JQM0lr?=
 =?utf-8?B?UzNhckJOWkdrMnJVQXR4aGFBVWVhaGpxYnpuR3Qya2twUDdZcmFPK2M0WnUr?=
 =?utf-8?B?ckhCVStOTWRZdjVRWkRlNllTTmc4aFNPOTM0a1EwRjFrQ0RjQnlTbHd3Y1ZT?=
 =?utf-8?B?bVNlUkJmR29FNzFhVHhxdld2b041YmdzVGlSajRldUwyYU40Ty9SSkNOWU1Y?=
 =?utf-8?B?TEFNUHR6YzltdUFlMzNGR3J2dWtzWkZBRzNlVmZFSDZUR2swWEtSQVRKNmZr?=
 =?utf-8?B?TitOOXpxM2pFMXZqZENXMTV0WFNkZTR1OFpodEFEZUVEbnEydUVmb1JoWTln?=
 =?utf-8?B?Wm5VS2dsUmtXUTZxYWdwTzUxbE1IdDI3Y0lHdEZpd1FCaUsrUmU4d0RhVmpl?=
 =?utf-8?Q?4PdfCvkubwS8x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXBmbzhXZlJvd2ZMcFYwb1NGSlpPUjBMUjk0MmFwYlEwMGVxUzBuNGRVckVY?=
 =?utf-8?B?MWgrK21rY05WNk1XMXpCdGdhTGd5bmxGSHNwSE5FbzNyZitNMGk2TkdiV1Jn?=
 =?utf-8?B?dXIwMG5XTHJVc21UTWFiQ0JPUDZUTXVZb09RRW1ZN3pyOVNsaTNIR2cwLzZi?=
 =?utf-8?B?M01zcytaR0tibWJmZG43SHBvOGk2clhCNGUxbVhHMS9IWU9QQzRiK1ZBazZ2?=
 =?utf-8?B?WWxsaUdORW5zdjZtWTcrRUs5Q0VUUERsTmI1SnY4KzM5SnlXajFsUmFkOVJl?=
 =?utf-8?B?R0RxSnNDbnVFTW5DaWhaVGRzQjNnT0IzeUxOK2pjeEVOeHJOVkNyeTYzSEVJ?=
 =?utf-8?B?WC9WbytpY01WMmhqZ0lxd1JxWjdNTkJwbkxIcWlsdDgrQU9ZMmJFdnF4bUV1?=
 =?utf-8?B?RUI2SG9VdktnekRPREVJOUM2OUExUW0rS2h4S3hyZmVITnljdjNYMXMwTmRM?=
 =?utf-8?B?czE3OExUQlNYZ0ZCUVc1YkhKWkRNY2k5WDhzRjZQaWpQdnFVT1RNQ24rMHdh?=
 =?utf-8?B?Y2pndTJKeWxlUTZCeE1MNnhIcFJHNXc4ZTdpZ1JyS01LbWZGMXVtbmplaFY3?=
 =?utf-8?B?Nis5Z1pRYzd5ZDg3c1BET0c1bUFZOGRvcWZKSVE3OUNTY2FFQzBVOVVUejhp?=
 =?utf-8?B?THdjbVRHZFFweXAxQUtSb1BIQjFZUEgrd2h3WlJQa1lWQWl2dkpJS1dSeUZp?=
 =?utf-8?B?TjhLTXM0L3ZqK2lYMmZVV0J6Wjl1UzVrUDFZdlY3WTdFKysyZ1JRYmI0ZDdW?=
 =?utf-8?B?N2lMeW9ZZzNqMUUwVitSZCtsYmZCbStYTTNHWlhNUTljVXZoUlR5TUwvdysz?=
 =?utf-8?B?QzhEOGh0NUZlV0FhVVJ3OVQ1ckd0Y3orT1hEUzdQUDMyTlZzVnBpUGdTc2t3?=
 =?utf-8?B?SVBmTUJzSUR2RWdTelZCUVhPT0RpT3V1T0dWUkJEVUpHSmNwVDF2RHk0M2xQ?=
 =?utf-8?B?NGhRdmZuaTRzT1MzRUlhV2kvZzhJcVdLTVRZTDFCYTIwYnBzY1dEU1R3YVBB?=
 =?utf-8?B?bHVGQzNjV2kyK2JDaGZ2S1RNR2FDTDNlSVBBUUpFQnVHMjkwS3QxVjFpanZy?=
 =?utf-8?B?QXZ0U3RCbXpHMkVPbWtkN2ZQTFhJUlN4cDh6dFFMTUVCZmZFK0FlTmtnQ0NX?=
 =?utf-8?B?M2NFUW93bTh3dEErdnpNcGxjRXlNelAwVWpjZmgxYzE0ZGZzcDBMZTkyZHVE?=
 =?utf-8?B?NGxPbTNSMGo4NlRTMHUrcDM1UkV5dWovemlieUNOM3N0ZTZMK0VnSVdxNHdh?=
 =?utf-8?B?MlZyN09vNk5MdEl6UkIyUXJhRTdKS1hXVHc0RFFRc1ozdHpic2lncWJQVW5v?=
 =?utf-8?B?cXVDalRZRFZRRnZ5U2JEMmt3UExvL0JxRFpQdC9sRk1kYlZ4aTVaeTZnUThF?=
 =?utf-8?B?Nnp0NGhlNXplZmh5L1liSTdwQkZ2QmYzYTF6bCtHZmdreXkyVHV2a3NDQmhN?=
 =?utf-8?B?YlRydjd3M3lKQVZDV0k4aFpRWHBFdmF5ZnRUOHlWUlpINlliL1BjU0x3UlBQ?=
 =?utf-8?B?bzV3VDY5NE42Tm4ybUs4RnRaSUZhVVVXSGlFRjNKcW5ibEFFN0VUclJrcXgv?=
 =?utf-8?B?VTc3UEQxaE42dXBVcFg3enhTMEFCMjBicXk2amZQakVVbE5TeSthWjdZY3NK?=
 =?utf-8?B?QTNBeXZqS0RXWXlZOTFDL01Tb3VzK1BjbWhVcVI1NnhXeEpoblVFU3ZiYW1S?=
 =?utf-8?B?RDZZSzZGVm05UXFEelp1cmkxZTYwZGNOK0tLK0pXa2JqS1Q4Ky9SeDgrVkdW?=
 =?utf-8?B?WkgreFBkTVE5Q2FnTk91SWMyTzJTdGNSZXZrVDBQRlhJTGt4R1Q5STJVY1F6?=
 =?utf-8?B?TXgvWHpLMTJSeU5BNE1haFZueE4rdjFwUWxaK1hqdWhKNmJDZ01CQ2JTZE1W?=
 =?utf-8?B?UWhxcjY0czJBNkVER3RDOTNCZGhvTnRUVUhZekw5dS9tdWYycVBVMHc2ZzVY?=
 =?utf-8?B?eGpOZFlUSUR4dEs4L0hBaDN0UUE5Mzhzbk55WkxnQ0V2YmZSeDkvVldTalI4?=
 =?utf-8?B?RFlWTFZiVEJxaUxWTGMwZUs5RVRuR05qb3pjdjhJcHVldnpka2ppd3JCbzg2?=
 =?utf-8?B?T0Zna0t1YUo1TFhVYkxYWTd1cXBUNTF6NW1OWmJxQW1oOGNTY1d1aFhIS0po?=
 =?utf-8?B?bEZFNzlDKzJ1TVJRRmEyOURVRDlidE1keXdIQ0RzQ3NoeDhyckZaMmdGZzh4?=
 =?utf-8?Q?h5pDdMRlCSp6HyQBjnWFraY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b18146-add9-4b52-fbe2-08dd47bfa697
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 21:37:41.7188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGhkAAckdB/hiJ1Cru9NqI8jZhlBspZD1eu2RBfg//FjMbHGodQGX5E3XwgxUMB9fqtSRU/UxbzUVTzbFs9vbLwrFni9Kfo9EtVf0Thq0cA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6743
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

On Thu, Feb 06, 2025 at 04:13:52PM +0530, Riana Tauro wrote:
>Engine activity is supported only on GuC submission version >= 1.14.1
>Allow enabling/reading engine activity only on supported
>GuC versions. Warn once if not supported.
>
>v2: use guc interface version (John)
>v3: do not use drm_WARN (Umesh)
>v4: use variable for supported and use gt logs
>    use a friendlier log message (Michal)
>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 42 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  1 +
> .../gpu/drm/xe/xe_guc_engine_activity_types.h |  3 ++
> 3 files changed, 46 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>index 9c08af273397..5d67fe38639a 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>@@ -89,6 +89,22 @@ static int allocate_engine_activity_buffers(struct xe_guc *guc,
> 	return 0;
> }
>
>+static bool engine_activity_supported(struct xe_guc *guc)
>+{
>+	struct xe_uc_fw_version *version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
>+	struct xe_gt *gt = guc_to_gt(guc);
>+
>+	/* engine activity stats is supported from GuC interface version (1.14.1) */
>+	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 14, 1))
>+		return true;
>+
>+	xe_gt_warn(gt,
>+		   "engine activity stats unsupported in GuC interface v%u.%u.%u, v%u.%u.%u or newer required\n",
>+		   version->major, version->minor, version->patch, 1, 14, 1);
>+
>+	return false;
>+}
>+
> static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
> {
> 	struct xe_guc *guc = &hwe->gt->uc.guc;
>@@ -250,6 +266,9 @@ u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
> {
> 	struct xe_guc *guc =  &hwe->gt->uc.guc;
>
>+	if (!xe_guc_engine_activity_supported(guc))
>+		return 0;
>+
> 	return get_engine_active_ticks(guc, hwe);
> }
>
>@@ -263,9 +282,27 @@ u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
> {
> 	struct xe_guc *guc =  &hwe->gt->uc.guc;
>
>+	if (!xe_guc_engine_activity_supported(guc))
>+		return 0;
>+
> 	return get_engine_total_ticks(guc, hwe);
> }
>
>+/**
>+ * xe_guc_engine_activity_supported - Check support for engine activity stats
>+ * @guc: The GuC object
>+ *
>+ * Engine activity stats is supported from GuC interface version (1.14.1)
>+ *
>+ * Return: true if engine activity stats supported, false otherwise
>+ */
>+bool xe_guc_engine_activity_supported(struct xe_guc *guc)
>+{
>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>+
>+	return engine_activity->supported;
>+}
>+
> /**
>  * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>  * @guc: The GuC object
>@@ -276,6 +313,9 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
> {
> 	int ret;
>
>+	if (!xe_guc_engine_activity_supported(guc))
>+		return;
>+
> 	ret = enable_engine_activity_stats(guc);
> 	if (ret)
> 		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>@@ -302,6 +342,8 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
> 	struct xe_gt *gt = guc_to_gt(guc);
> 	int ret;
>
>+	engine_activity->supported = engine_activity_supported(guc);
>+

Is xe_guc_engine_activity_init() called even on a VF? If not, then 
initializing engine_activity->supported here may not be sufficient. 

Thanks,
Umesh

> 	ret = allocate_engine_activity_group(guc);
> 	if (ret) {
> 		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>index c00f3da5513d..9d3ea3f67b6a 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>@@ -12,6 +12,7 @@ struct xe_hw_engine;
> struct xe_guc;
>
> int xe_guc_engine_activity_init(struct xe_guc *guc);
>+bool xe_guc_engine_activity_supported(struct xe_guc *guc);
> void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
> u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
> u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>index a2ab327d3eec..81002c83d65e 100644
>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>@@ -79,6 +79,9 @@ struct xe_guc_engine_activity {
> 	/** @num_activity_group: number of activity groups */
> 	u32 num_activity_group;
>
>+	/** @supported: checks if engine activity is supported */
>+	bool supported;
>+
> 	/** @eag: holds the device level engine activity data */
> 	struct engine_activity_group *eag;
>
>-- 
>2.47.1
>

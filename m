Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D514CE6BF39
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 20:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951BA10E37B;
	Fri, 30 Jan 2026 20:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UNTXARNR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E21010E37B
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 20:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769803205; x=1801339205;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gaPAy7uMZy8cH7tLMT73Stx556yiK/2m2XxonJnCceY=;
 b=UNTXARNRk2KpRICkKiX/foS3yE0LG+G/9uHUTbONN9i+jeoygM1gxmZm
 kFuBV+rTxCr6cxC8hOO3WH4oge4YSVWJmMUNBGAzV0eWdm3qgTNwTlmD4
 N35eCBP4Da1L/i+STTtShq0XQBo8AiaGd8j9ukiIVxxenOhv5NlKC59W6
 /qQZ0FPmOZ4yXyF32bzxlAxsi00AWuc7PR8OKsOXGm7PIkHHhwzO9jeRr
 FDqyIe/GDs0YnzAa9fYgo1umFUykwm9sStNBBl/TCdCQS24CsIQIkQqXs
 4zG9xig3EvU787iPLp+ld9SJFqwXmVrR1XaXZA0fwBAZF9lPHzSNn2rMy Q==;
X-CSE-ConnectionGUID: HFb5obFqS1eztGCw2ZWALQ==
X-CSE-MsgGUID: eprM8aIcQQ6Q3REn5q4h0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="74912897"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="74912897"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 12:00:04 -0800
X-CSE-ConnectionGUID: thofCsOcSj2+9ozwqkYfNQ==
X-CSE-MsgGUID: bGyyyvNgQOqf4qCVddSXxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208048925"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 12:00:04 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 12:00:04 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 12:00:04 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 12:00:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUDKUmmA9XNCKW2/4Q9HoAZeHrw4sAfpujeVRWSWjrAd2GaCApyqxvBfJoiBYG/73ydaFc0oMzEHjpw/M4xExSEf7g6GWN+1C2Tssm5AZED81is3Ve8P89mLFMrP1jc5YbKup0CDCxFBHZSCpxWBoeCm84bAqgf1Q9C9wCh8QokqkA84orUwhskdp9hRGGwVSYtQTz3ceyfBe0c9+5RXUGShMn1y6HH15mkkE00S5XhiwgkPDRobVRjhxicAeaosJ6TKxONHe95h0JN4PylD2nsf5vEmWPy3hc4I0jUy97MEws/cGNw0lVye9CS6gRmGU12uIIIZmrzXOqUB5BTrOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wV34p6sV0+IHb5RcnXHVhg/WdqxacWvcqrUV2OfOag8=;
 b=QEujxhlzdONNhnVsX6kGN9CGX4B4M8vfaAAqNKw071WmkVzGH+TTPJpdEozwscIf2ofxHfgtfk95ITyS+E95ZSukFzRygXyTzDpN/vd0DTw8rnrkGDUDpfKJOFI3kbaRWxEAyEfsmWDEZZywZn8daU+AZk2k9nTljYj87GW4tPNbd9av08zb4K9yfHsqwb68akwfIqM7e5Vw4U56EIq6KO9U8heR17F6RDU+jzazI+jC4E+dNAxPXsmz2XMXvPxm8se09Mx03pnM1uS9VN9zdfGM960qLoHEa9uTOTOoSv07fPZS5TmNGwnqMc5hqVOcYK0MgLCVDFeLp/Fttc9NnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 20:00:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.007; Fri, 30 Jan 2026
 20:00:02 +0000
Date: Fri, 30 Jan 2026 11:59:59 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@intel.com>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v7 4/6] drm/xe/sysctrl: Add System Controller
 initialization
Message-ID: <20260130195959.GF458797@mdroper-desk1.amr.corp.intel.com>
References: <20260129121044.3670780-8-anoop.c.vijay@intel.com>
 <20260129121044.3670780-12-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260129121044.3670780-12-anoop.c.vijay@intel.com>
X-ClientProxiedBy: BY5PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA3PR11MB9037:EE_
X-MS-Office365-Filtering-Correlation-Id: f4315e53-8974-4cf6-da1c-08de603a277a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QDOL/0uS+94lEHTRs2J+GlHzAaMPjUeUD5bjrKBySdmsl+629JAymMtVjI?=
 =?iso-8859-1?Q?veOj3lNiS0NXtCuojo0XviD0O7Kj+9T0j4xaAw7FBq8563FMY4yKRAQEDj?=
 =?iso-8859-1?Q?ZKljKvrAS7EwNBwdCOeGNhEAh6XvLzxBr3AZlL//2tzsUn/xH/avgIPJZw?=
 =?iso-8859-1?Q?hodJmbemRXzWwDyJoQ3+yBKhERbU6pGI+Wa+LAtYISBFVJNIyMyP5tLLGq?=
 =?iso-8859-1?Q?6yslD0qXOv5qIheDoWvzl2bd2U5pkP7cFyR4zP5uP1Me+yNQC7zhToIMAM?=
 =?iso-8859-1?Q?bDeG4CGnGGHt8eBUVUeYUZYcg/PKTddhYC1wDWxdvlIhLg7wbxwKN6xlnN?=
 =?iso-8859-1?Q?oaFPJ13Uk93VTziuXVpg7Nld5aCyrKIXHzw7nxr3eS/GbjB+7iscbsIUo/?=
 =?iso-8859-1?Q?0xE0grbvs3caeTit4VBhZGMhP0XQcb+n6DZXH900NN3AJg2nWqhF/pFoTO?=
 =?iso-8859-1?Q?K8rIPEm3HADVivnXgWOojlWScO0RpY3iuA8u8r58hTDAVv1OTfro0eXs+Z?=
 =?iso-8859-1?Q?Z8dQRk03S5qU7GCy/13NvMrSIBpT38c79zIRc/sw8/76GOPhA+vPP3Ruvg?=
 =?iso-8859-1?Q?dmCuA0allxH33LzL3eC6fV5ytMLtLhoImG+xvDsNVnzaZbH5LgHzc3eeoq?=
 =?iso-8859-1?Q?tW3Cp50aQwnFeKsWLpR9hU0ajZJKpAU7UX9+w2MI3ljoUT5E5n4QwzVvJl?=
 =?iso-8859-1?Q?yvlevrySbropuHd8xyGwZi/bCKUXz4pK3yeZskBtJnIYjRPiW8RHhcAXu/?=
 =?iso-8859-1?Q?/+2OMWgsT4NGt41KrXDTiVI0DyohXO8Dpk/z7IXf7aqgRIYT/eZ1fz+34x?=
 =?iso-8859-1?Q?o/qo+M2KRek8JTfPbEwMhVe8TGKjlawxrHyP65eA46K8i11VzTlWNt2NJd?=
 =?iso-8859-1?Q?X3RTgYIg3fw3Ovy75uf+NvjsLynhWdguCpDQ5q+8aDZOaGDd6Lype2w7hJ?=
 =?iso-8859-1?Q?Vv93kxWd0VMah5WKwuB/DvbtGQ6dUGlvtX4OpPiMhPgRvbh7QO8yuhRX+O?=
 =?iso-8859-1?Q?MwYx0NhfjNagSvMOseTAsL5aGuDeLPckSjJNX7etNNcNGju36F/4hLJ1Is?=
 =?iso-8859-1?Q?ggPoRQtEkI0z+jJarY8HE9qYhXssEwvBpoTNZLol7n9vQ2QRsSfLgqXOGs?=
 =?iso-8859-1?Q?9GCtEHIE42qv1VqPPT3BGTThgi3m57/78wC7v4NRE71Bm1/6m14/5vADMy?=
 =?iso-8859-1?Q?4QtMWET1hQflG2FSCUwYVv4w4E/XPslAbS74O4/acVGag87RU4e4vpIIM2?=
 =?iso-8859-1?Q?gYGLaaeaaZTNhaIpoFacIdT6E+OlPm4X/gkEMQocjDPyHrZPIDvhjXyKYW?=
 =?iso-8859-1?Q?A7lBtxv4DzGlYzTL6ihr5L6pM8dk45uHQttjfauQVtGV5BMfJfqoCVy/71?=
 =?iso-8859-1?Q?BJt3jwcdcW0vNTYaNbqJcw6zaoA0/sSy//u9IuGPXGTfKzU74cxt6HdhDF?=
 =?iso-8859-1?Q?EgvkSRKJOiDcF55jCkNyy2sbEl9XLqLw3kaQeFqYJC8LoaK7QgH6MhrKVY?=
 =?iso-8859-1?Q?UroIBo7IhQIlVQeGI7NfbYg0z81wAW73aHW66WFbDMu7YJvOtKWC9v0+c+?=
 =?iso-8859-1?Q?BLn/jl3QbFTKufS1PwrzumH4alrtPLWFYQ4qImNafqFV/+NeT6IRZN6zzL?=
 =?iso-8859-1?Q?oAHKSy43F0F8U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rBQpGB5sczemzleVMDCedHVifkb/t19cFiIw5wN0v+3yYTTHTx4fZrP500?=
 =?iso-8859-1?Q?5vEKpACxv9X2jzHoOinSToBDXZ+o/DhTrZ6pb9Zy23K3MYmvVIccm3sYlm?=
 =?iso-8859-1?Q?BSHnbCPyXMdHu437BDT2uaaIUHw/03HkN8VwwL2mgWkOrc/mF1hrVMvan8?=
 =?iso-8859-1?Q?jkVmEpIOTEUCSgGNnlXe7gJ2Jvpc264Wtr6wasrzQFITL47RLTq77cqTHk?=
 =?iso-8859-1?Q?s4oqhUI1jde3pxdkTIx+CoDK3BPSu/uUmlCKU1SGllBOKWLlNbg8r8gx+H?=
 =?iso-8859-1?Q?Ume/X325E+5yhgCMxk25/HP6SkEG7CtrKRsvAC0+8IbdkGIV3RbtYHJB9U?=
 =?iso-8859-1?Q?V6KDuOABSrFQurB4+V2ui/QFpez+z439PBr0IJuGJmFijkTU7W+s6p6eh9?=
 =?iso-8859-1?Q?YAhWF8Ch/iP3YVEPLtcMawpJZBHdF56viVCFbyhBp7t5EyeMrb7pXCXezV?=
 =?iso-8859-1?Q?zH+TP9/7tQu9l2eY1EnDlVt+ywktMoLPLLDJ0+kvyWfImGol6+05L8w4h3?=
 =?iso-8859-1?Q?slFu7AR5lXU08ZjxCTwqOcpqCOrRUoPctneZX5C8o6l72dmcnHH+l3NrGY?=
 =?iso-8859-1?Q?xhwCE4y7Rab3UDCFYHlPXvcEkSGi4pNVQf/5MIPhV45bH8zV/0VgxFTGFb?=
 =?iso-8859-1?Q?Efbv3zvnkCOV1Jykwzq+IZ+JUw2IBXRhFMZIXNa931EgjMpJvkGmQsI6Pk?=
 =?iso-8859-1?Q?zIXFW5LnYyIDW1LNbrTrMXdThM44UuLmuqx8h4/n2e26CRwVs9/n4mB+2X?=
 =?iso-8859-1?Q?pcf1tD6NrzoQn4hanpE7eUycC2dhNIIxfLlJHK7Sj8kkzv5Hz92Iw88Lge?=
 =?iso-8859-1?Q?DUIyGc1IC2F5xiJ8WwwWOTvsxNy8R93Ayd8Zpz6fPUrjfYua7h0JV2RCiG?=
 =?iso-8859-1?Q?fhMy+ktXlxsgGNALZ0k5Rr+HUKB23kubFjA1hx/Zct//mXMJrMpBMTIJPt?=
 =?iso-8859-1?Q?KZuMsAJv2wtuYijoCZJpEoxLoAi6a32S1Rza+sS/dOCq8J0T5htNgDEpx/?=
 =?iso-8859-1?Q?gybgfqPzxm4m32Lk06rOSSNc0u0s0eMUMmJYyaC3kZ+C++DO+C/rRvnzzr?=
 =?iso-8859-1?Q?+AaQk+ZsWeNvi4MfgIJflZM39rPvwEupB+/MCaQpYidYIzFvu1HABLa3hH?=
 =?iso-8859-1?Q?crgnZUN54DFbZU8U2nx8ViReaPddubAeL7vx4CSlLGBUgDxiMzt1oKR+uY?=
 =?iso-8859-1?Q?jSwWQhQsu05g2gt1Fg6GI7NzG8CXmH0Q8P83+WqZtAD1HxscU+3GvqO4Ww?=
 =?iso-8859-1?Q?39OJohvdMO3Pv1bx6ft1vEp5ft22iyLP2lbsxQtnrnt3rnZ+OQCzvYjeKN?=
 =?iso-8859-1?Q?mWMmvBI/xFE43I7Vi++TKH7TPoM7KuMT3yKSOgrr0q5CtehVs3blszNB/s?=
 =?iso-8859-1?Q?QG5t3fr30Ywq5JF161fqQdvqvGNHy+MTWKx17K/YhxcWl5lF3DjtSAxzOu?=
 =?iso-8859-1?Q?4+C7QKzujIBF+ZdlGPuyzxwWSt+CcHFPJUWpliF4e8e2ym09dPqHi4VcFw?=
 =?iso-8859-1?Q?H6IboNCeUUPWKsR5PG28QVjrBy54Rj7sm5CSwABVBhbUhahP4DMPyhFcO/?=
 =?iso-8859-1?Q?ujUOW1F2E21s3FU9jtJXVYXiB+eQPuoFw6AA/MbkCXF0v74XXEP4tT/DlY?=
 =?iso-8859-1?Q?Mv1UYGV3RXmv45IdU/HJ76mttisCuBi/8XOPV+mLFB6AXysSvc3ZkkEFVK?=
 =?iso-8859-1?Q?qdW6Tl7rRRoynWUBuzfusT92rEiFgyWz9XqXkOHNhnaK2HYPvBrhkF6kRO?=
 =?iso-8859-1?Q?HaKaoh9X17uBB+LcDBdzLzDwWojNNpy42+t/jVUcrLeVNJTf4jt//jO4Sb?=
 =?iso-8859-1?Q?8rXecZTrGzRXJ/TvhHY/W5BCc2YsJZE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4315e53-8974-4cf6-da1c-08de603a277a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 20:00:02.1769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzWwygL5Vea8PpHEriwRnYFSOSP/ignYjnJqVlQHgQGhpgYTWNnb3S/keyGFZM6zXbME4+GIFExlIId938wrqv9TlAGR5GXe08Tgle2Jjcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9037
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

On Thu, Jan 29, 2026 at 04:10:45AM -0800, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add top-level System Controller initialization and cleanup:
> - SOC remapper region configuration
> - Mailbox initialization
> - Resource cleanup on driver unload
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sysctrl.c | 80 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl.h | 13 ++++++
>  2 files changed, 93 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> new file mode 100644
> index 000000000000..430bccbdc3b9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +#include <linux/device.h>
> +#include <linux/mutex.h>
> +
> +#include "regs/xe_sysctrl_regs.h"
> +#include "xe_device.h"
> +#include "xe_mmio.h"
> +#include "xe_printk.h"
> +#include "xe_soc_remapper.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_types.h"
> +
> +/**
> + * DOC: System Controller (sysctrl)
> + *
> + * The System Controller (sysctrl) is an embedded microcontroller in Intel GPUs
> + * responsible for managing various low-level platform functions. Communication
> + * between the driver and the System Controller occurs via a mailbox interface,
> + * enabling the exchange of commands and responses.
> + *
> + * This module provides initialization routines and helper functions to interact
> + * with the System Controller through the mailbox.
> + */
> +
> +static void xe_sysctrl_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	xe->soc_remapper.set_sysctrl_region(xe, 0);
> +}
> +
> +/**
> + * xe_sysctrl_init - Initialize System Controller subsystem
> + * @xe: xe device instance
> + *
> + * Entry point for System Controller initialization, called from xe_device_probe.
> + * This function checks platform support and initializes the system controller.
> + *
> + * Return: 0 on success, error code on failure
> + */
> +int xe_sysctrl_init(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_sysctrl *sc = &xe->sc;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return 0;
> +
> +	if (!xe->soc_remapper.set_sysctrl_region)
> +		return -ENODEV;
> +
> +	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> +
> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, xe);
> +	if (ret)
> +		return ret;
> +
> +	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
> +	if (!sc->mmio)
> +		return -ENOMEM;
> +
> +	xe_mmio_init(sc->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
> +	sc->mmio->adj_offset = SYSCTRL_BASE;
> +	sc->mmio->adj_limit = U32_MAX;

I assume the whole series is effectively "dead code" until we finally
flip the flag on for some platforms in the last patch, but it's still
somewhat confusing to be using sc->mmio in the previous patch, but not
initializing it until this one. People usually review patches in series
order, so while reading the previous patch, they may be wondering what
the target of the MMIO operations is, which they won't find out until
this later patch.  It can also cause confusion if someone is doing a
bisect and inspecting the state of the code at some intermediate point.
Is it possible to shuffle the order around so that general
initialization comes earlier in the series, followed by code that builds
upon the items initialized?


Matt

> +
> +	ret = drmm_mutex_init(&xe->drm, &sc->cmd_lock);
> +	if (ret)
> +		return ret;
> +
> +	xe_sysctrl_mailbox_init(sc);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> new file mode 100644
> index 000000000000..ee7826fe4c98
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_H_
> +#define _XE_SYSCTRL_H_
> +
> +struct xe_device;
> +
> +int xe_sysctrl_init(struct xe_device *xe);
> +
> +#endif /* _XE_SYSCTRL_H_ */
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

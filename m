Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887F6C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 17:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5586F10E420;
	Mon, 10 Mar 2025 17:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zh6nus9q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB65310E420
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 17:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741626124; x=1773162124;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BIe7blLcbANDdTqKaXZefTCxXS/oLD11MoYfr/81Qh0=;
 b=Zh6nus9qUC29SsDF407sfBD5aJRP/VF+LhkwLVtCaARMj+Zw9H2VKEvJ
 cLqvcnLH5uQ0ZyRuC1IE6/0algqgkbcEdeTgXdoeWb7wpC/dGzeTsmuAK
 +Sx/P8r40w4gIVOohHB9MwhMgxT40eH0iee15zQaT/ptwlMTDJ7djQ0/b
 1HVAfCHuvbESwL72x/OLbGrbyQXj25f4iarTHCtPHu7rED+3AbXmLy+pi
 Vj9lHrhEK4hBpKl2VVYcEVtDF0mH56VUnwhE7/SGHUjqewCSig7fOTT4b
 5RPK1zPeXnIuAIKfCnJr7L8hJNwytmTrlyPSvVICR/Mwd4kKjIIGPzzbo w==;
X-CSE-ConnectionGUID: xQc6fxb6Sk+twfZ+if26uA==
X-CSE-MsgGUID: CO6Ol3I+T1KNLloPhfDEuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="53275669"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="53275669"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:02:04 -0700
X-CSE-ConnectionGUID: ILo7L7WxSn+FfHjy4Iy6nw==
X-CSE-MsgGUID: C8WD7gHtTi2a6/cIupbu2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="125054717"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Mar 2025 10:02:03 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 10:02:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Mar 2025 10:02:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 10:02:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSdANhm8UpE0Aac07tMoHfkkVncAV5queCn4jhwY80GMOs7jCRH8/fH3wNjt8Q3Wo/YIdRSHZbNBvTxONFqTIkpSfEwKm3I6z5xl3kgbPH7gVlHYEq27TBW3qLEfIncWy/gEG+zXZe3Vlc1BgxdWD63FhCg0PJ0AXKHET0rT04lnEVOee4bxAeua4A93xSHUN3O3tL0ZEejKcLFtaFlBNLaP+TJo6fXdRGYQgB4QGyBRcL1lWmGb+SBUXUJ5i1KjUgv5lgHB3PYl9IVlSYOB/AJcOn8LTfk+99n/y5FUqC++csNWBSIQIsvqhBj6S5gwKNWmS1e9kyKlHRSzFbIRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WO8jaNRPwMLAOThn8NkxfBuVgL2SQ5APjAX6Yd41ZhU=;
 b=bJXegh0w89hkKyJAbDiscYyjjT3hXF1wkbdyEnwGNTGQvIcchU/1eRpYTC5q0XAizRVbn0USo4H0/zftcgX78LEp1auSpzeulZEzsok2Gae1pyuN6B6wFCsE1TQt5xHALJhGUe5aXupD7ttC3pEGNaLh9I3fuSBHGlfvFpM36K0n7wyxSAwgNCnVYXvV8aCczUAFLtG/rLEJgU5yCE5Ci8kKH5UW4xu77VQt+s/+GtpBXUJTaxYg4wWNdLoxZg/YEREZEHXSGSSquzWOi3GimRM9mbSRSLfAnj5KJVcl4qEwjjwXuD33uqDRzGiWQ3Vkw13lBh2SQDH3N7FcsEvmVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB5991.namprd11.prod.outlook.com (2603:10b6:8:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 17:02:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 17:01:58 +0000
Date: Mon, 10 Mar 2025 12:01:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] RFC drm/xe: Add configfs to enable survivability mode
Message-ID: <bc7caow57dfierr7fjyjcu3tanurj7z5zld5tkx4olj4i63x7y@ry364xf5ornr>
References: <20250307142446.1790715-1-riana.tauro@intel.com>
 <20250307142446.1790715-2-riana.tauro@intel.com>
 <txoeuk2zlt4gotrzltt3cjtzf2u4ebsjtjicvtsa4a4iz5o5eo@oqgl43byhdoe>
 <bb979148-ec3d-43c8-b73f-e22476f9a809@intel.com>
 <xgmworhkqvbo3gr6toa54occ7tanxjimgyx43pzoojf3li4wxf@7imyzpy5vurl>
 <7024396b-0356-4723-bc75-4cb6f6a05cd1@intel.com>
 <Z88WB7oI6hwbzteq@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z88WB7oI6hwbzteq@intel.com>
X-ClientProxiedBy: MW4PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:303:16d::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a2ee69-a171-4193-5a2a-08dd5ff544b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?SqsM4YFzb7V1eNN4z9dDqxvyxM5TaHjqslNHw6Cjmuhgd1sd9rNTS5prWs?=
 =?iso-8859-1?Q?ZFiX5cI06qRtDsIfTNOcfG6eBV4t3e3louWFVnaJs9fq/n58DoyS4tYHTk?=
 =?iso-8859-1?Q?Ouv5XZFWr4dQDT+GfJZvU+DWdC8RynTjclA0VY1z4wOw0vrj3i0veai4V+?=
 =?iso-8859-1?Q?HvcDNf/ReLGl+YO4z9lJeDxwYr0c2oVQa6rI1qOET/KS9q9a8HgSF1NuyE?=
 =?iso-8859-1?Q?Vagiqqi5lT9Opgd4htyOjKRu0tiKLi2qVkzVh28LI8q9sj3YIMwPJITZUK?=
 =?iso-8859-1?Q?Uts6BmG6qslqBgUqH8dAATm0ofA52eF52bKjgzdcWtJ53g99WXMC1+hy66?=
 =?iso-8859-1?Q?KI2GQxS4WKJPlMH5fue+OBqgwwD74UYEFTqAxm4ltWm1oeK5IH0m9qjTAQ?=
 =?iso-8859-1?Q?11xkrbIj6qgcxukkwBNCj2H0sPgi/a3amu1ZQgVcARlQqUzdIqQNazSYcM?=
 =?iso-8859-1?Q?R+tndaw2svCDaUhR1E5ZLYO3wSiiNeHNI83lwbOFIQyMfd1h0DeG6Qk5XF?=
 =?iso-8859-1?Q?xV9T8pvcd6ri4ax5+PmXTFOr+X5oFWEagwtIjHpKyDrB7qfluVEGn/XPFn?=
 =?iso-8859-1?Q?hwJ6JR2ijfi9Tk2WKaohCL2pehZYSZUHL0++lIEHH4MHSZ34zarK6Q34Pr?=
 =?iso-8859-1?Q?ICSj3iGE9ClHJe4kGM27ihzlXPTw13y1N9CKneGKPxExD0mZjfBjNQYX5X?=
 =?iso-8859-1?Q?UeHhpoGBKCvvaT9M719YiuESyJPlRfROwKjFssgz362tfQJb9tX6kC6VfV?=
 =?iso-8859-1?Q?GrSRtKAr/LqPKXxT3Nzph2ESdb6tl6o1bvYRTVvcnawGVt5XMMIKQeV8f3?=
 =?iso-8859-1?Q?WMOk4dWtOqqMPxgBsbq5Cg/fy0/fO5FtUCIZGgw6YypI2YfZwJT7jCfvlE?=
 =?iso-8859-1?Q?qLmV4aUItdAwE4HNSL8vubZZ3VEtqFKYOsBKUxrkWK4DNc5bq74eCV/OvO?=
 =?iso-8859-1?Q?GP5lvup72MXMNLKfZSd6prWSjYKxhE8JHwRy+4qFTbEilnXCrzmqSxRz5Y?=
 =?iso-8859-1?Q?5ZtwZUwMh6VrAAcAPHVkZmUPAQQJex21phSdyjHICGSPOW9JjxhN8V8zIt?=
 =?iso-8859-1?Q?0SdW6i4GzNBeFbjQ46oWlastf3ofllRsWkZPrpd7MQUndqzCcxZZKc2vl+?=
 =?iso-8859-1?Q?5XB51OR5mRZX/sEyftBBCbTVIYls3haOvi+8UQLvZzhDc8Tw2KugXADi7E?=
 =?iso-8859-1?Q?YETEdVv6RFFjnoX17KsEnq9Sjc1Llf10HZ8KaNxMU/Cb4wCcNp8ZPKZQkK?=
 =?iso-8859-1?Q?uM5ywye+MzH/jmNjJr/rlJeQeHELzHSBt7dWSuZL0dn5EvzYe0luA71z1j?=
 =?iso-8859-1?Q?qNrwB2BpcePBVCjoeVDLXzZcKZBF6heKO+uSfxq4f/p5KszENy0cLUdoAC?=
 =?iso-8859-1?Q?32kcf+auB1cOBvJAuo+qMEekbzIBNApX1EIHlaWnJNBoQ4weXXB0t732uP?=
 =?iso-8859-1?Q?fZcgfbMlJeUL1h2P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RsnxSGZaxMIlIj/IjY9Bv++ktyxsEnLgBGTjEwBSpOsUT/GeUT94cHGSw+?=
 =?iso-8859-1?Q?dby5NxqoVb58Ha7B9O4bMYZCB10SGhdjzIg46D9gALXxA3E/6qIUWMIivB?=
 =?iso-8859-1?Q?su/3QogFkiLyv5+SH9vQAaHr3Ungwuvrd+Vnkg8YJsGUmQ/DLmsBsLPMR8?=
 =?iso-8859-1?Q?S4v+QGh8MwqDWgwOeuhMz1SB09nhLOGZwlUt0TxRIi6Bwj3LxE7sjdgaxq?=
 =?iso-8859-1?Q?UQdsDOwWxETBNdFF/9bmDJZ2Ha+WKInOhQVTrvjOCERIWSynJuYkjT3e8z?=
 =?iso-8859-1?Q?FNTw5LRxtKZiSvkMV0Zqy0nemXEp0/0g6wxbN4+5w/oGMGpRckFll25r5P?=
 =?iso-8859-1?Q?/QF5jXUinDIEZ7bWpcVEM/+XcaOueMv8hCeF1L3t2rW0KbCD0M5C+khblf?=
 =?iso-8859-1?Q?Au5SDU/iey0677LrfsMXh6SQ8lcAJsqZUc/masZkhmEBTvvGZ4gz81uR9L?=
 =?iso-8859-1?Q?abJ9m5CXIgl50eMxMZ6xdxWpPxBXyhbxF/tFMAOy2Ve7jJndl95U7XVlt2?=
 =?iso-8859-1?Q?rIe2zJytwBFMSVXJIx6dUvpe2qpP14QC55mI7UdOckPwIFb7C58j1u+QUf?=
 =?iso-8859-1?Q?iqMOMXfCTE1b0MZ+YFC+wREbUBcyUg5Y+PXVjiv+qGkgv8pb7zro8qKf1o?=
 =?iso-8859-1?Q?oNGi7ewKvk/Fv0rLch9KESp1MDHzhs8/WDl0JzW70Sw6/DxcLGhggR18yo?=
 =?iso-8859-1?Q?Kxoh44dQrTOHxQrQUdY/GLMYoPQqeRA7Zq8ryHohA1GGgsPAXKHbg0C82k?=
 =?iso-8859-1?Q?UhjxJ/uuIsnVwyARecQqZM0xYbKXSKTWmqOJKtQR7bzicHapgK9OdDN2nz?=
 =?iso-8859-1?Q?RRUr81H5HmQu/PH1nitpi49uqwhOIXrts6OYdmSMFzeCBb+dlq7IH5s+12?=
 =?iso-8859-1?Q?Dz5Vjq7vpUwyDOgx6eLkbTwEkR+6Du3+MZpvy+ybHlM7Bgb1knzrol6yME?=
 =?iso-8859-1?Q?7QMCVchkaekNVgcW692s8FgGbW7iN5r8lJXLMjxhgYNcyP4NOjv+YrzU1b?=
 =?iso-8859-1?Q?HTtrZVgyM8HkrNzh8ihQzEhCicniYfcIqiqIaGEg2DmoOg37DeBjM7lWeB?=
 =?iso-8859-1?Q?EqROxfg1j53FfftGrxpfwbdcEM7x2odjs6cUgSZ/gAcpdiGjrgAD3CgA/W?=
 =?iso-8859-1?Q?wUCX6eUJYF2I3bXvDBT/k2wlELA2pW5MUj8F2zBVF9JQLvbLnm8MggJqF0?=
 =?iso-8859-1?Q?7niUjcuCeNOg/Ms+hYjrOFhhTvpGEPMLpxkbg5uhOhSBRayorvqG0inTmN?=
 =?iso-8859-1?Q?+FNULihNa0RsbB6PUdU0GkWbOzuuLRTxCRwpRPArU84IhFBFsKmDj5J6eH?=
 =?iso-8859-1?Q?2BsYO5Ge6RlUERb2+ygNV/ZcM2Y25yL3TNp3r0Xv4RFVjxbNaKHMvw4ip7?=
 =?iso-8859-1?Q?kPx+4kg2ivp4+O8JC8awfMcf9zFa5qtbxYJ+k336dsPl774HPmpLIxGjZC?=
 =?iso-8859-1?Q?QAU5mOnbpTOm5aIp1TlBKT4d00mZTtqxKBQp2v9pXbpz2UbcZZhGHU3uPL?=
 =?iso-8859-1?Q?fVKohBnNrKpCc5TKLmPwf4gkdjkWPpLRphkLo6JdmTTaSH5AFpgTi5Wfsf?=
 =?iso-8859-1?Q?8+NaRL4f2tg9AXVNIN7dsHuaelWccDt7EQmvl0H1pSM4cRl1Z+SRwOz/kW?=
 =?iso-8859-1?Q?t6RXmNAi2i1iVKIo3djkNQB6MbmDoMHxEGmuyhrX75N2gBJ1Pj0oUAlw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a2ee69-a171-4193-5a2a-08dd5ff544b5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 17:01:58.6276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeb6oDz8cf2WsHWD+B3trrO/DsAJ0DpXovwNSzMV1gzxglFb0Gzlp/6OCFBqC2Q4WGd5qsxTnxpuRpqGxu5iglBJ22US8PBz6uWvVmX6y9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5991
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

On Mon, Mar 10, 2025 at 12:40:39PM -0400, Rodrigo Vivi wrote:
>On Mon, Mar 10, 2025 at 07:53:27PM +0530, Riana Tauro wrote:
>> Hi Lucas
>>
>> On 3/10/2025 7:01 PM, Lucas De Marchi wrote:
>> > On Mon, Mar 10, 2025 at 11:01:50AM +0530, Riana Tauro wrote:
>> > > Hi Lucas
>> > >
>> > > On 3/7/2025 8:46 PM, Lucas De Marchi wrote:
>> > > > On Fri, Mar 07, 2025 at 07:54:44PM +0530, Riana Tauro wrote:
>> > > > > Registers a configfs subsystem called 'xe' to userspace. The user can
>> > > > > use this to modify exposed attributes.
>> > > > >
>> > > > > Add survivability mode attribute (config/xe/survivability_mode) to the
>> > > > > subsystem to allow the user to specify the card that should enter
>> > > > > survivability mode.
>> > > > >
>> > > > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> > > > > ---
>> > > > > drivers/gpu/drm/xe/Makefile      |  1 +
>> > > > > drivers/gpu/drm/xe/xe_configfs.c | 95 ++++++++++++++++++++++++++++++++
>> > > > > drivers/gpu/drm/xe/xe_configfs.h | 12 ++++
>> > > > > drivers/gpu/drm/xe/xe_module.c   |  5 ++
>> > > > > drivers/gpu/drm/xe/xe_module.h   |  1 +
>> > > > > 5 files changed, 114 insertions(+)
>> > > > > create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
>> > > > > create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
>> > > > >
>> > > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> > > > > index 9699b08585f7..3f8c87292cee 100644
>> > > > > --- a/drivers/gpu/drm/xe/Makefile
>> > > > > +++ b/drivers/gpu/drm/xe/Makefile
>> > > > > @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c
>> > > > > $(obj)/generated/ %_wa_oob.h: $(obj)/xe_gen_wa_oob \
>> > > > > xe-y += xe_bb.o \
>> > > > >     xe_bo.o \
>> > > > >     xe_bo_evict.o \
>> > > > > +    xe_configfs.o \
>> > > > >     xe_devcoredump.o \
>> > > > >     xe_device.o \
>> > > > >     xe_device_sysfs.o \
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs.c
>> > > > > b/drivers/gpu/drm/xe/ xe_configfs.c
>> > > > > new file mode 100644
>> > > > > index 000000000000..8c5f248e466d
>> > > > > --- /dev/null
>> > > > > +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> > > > > @@ -0,0 +1,95 @@
>> > > > > +// SPDX-License-Identifier: MIT
>> > > > > +/*
>> > > > > + * Copyright © 2025 Intel Corporation
>> > > > > + */
>> > > > > +
>> > > > > +#include <linux/configfs.h>
>> > > > > +#include <linux/init.h>
>> > > > > +#include <linux/module.h>
>> > > > > +
>> > > > > +#include "xe_configfs.h"
>> > > > > +#include "xe_module.h"
>> > > > > +
>> > > > > +/**
>> > > > > + * DOC: Xe Configfs
>> > > > > + *
>> > > > > + * XE KMD registers a configfs subsystem called 'xe'to
>> > > > > userspace that allows users to modify
>> > > > > + * the exposed attributes.
>> > > > > + *
>> > > > > + * Attributes:
>> > > > > + *
>> > > > > + * config/xe/survivability_mode : Write only attribute that
>> > > > > allows user to specify the PCI address
>> > > > > + *                  of the card that has to enter survivability mode
>> > > >
>> > > > I think the desired interface is actually that the user mkdir the bdf in
>> > > > <configfs>/xe/. This populates the available config entries that
>> > > > the user
>> > > > writes to.
>> > >
>> > > Initial thought was mkdir bdf, but since it was a single attribute
>> > > and after a offline discussion with Rodrigo, did a simpler version
>> > > to get comments on the RFC patch and if configfs is okay to use
>> > > for survivability mode
>> >
>> > I disagree on the conclusion as then you are moving away from how
>> > configfs is commonly used and also making it harder to add new
>> > attributes in a uniform way.
>
>My bad, I'm sorry.
>I might have created the confusion here.
>
>> >
>> > >
>> > > For survivability mode, below procedure needs to be followed
>> > >
>> > > echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/unbind
>> > > add bdf for survivability mode
>> > > echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/bind
>> > >
>> > > After the device is removed directory has to be created, the bdf has
>> > > to be checked if it belongs to xe driver and then attrs populated.
>> > > Even i think mkdir is better in case other attrs have to be added in
>> > > future, but for unbind case the check of the driver might be tricky
>> > > .
>> >
>> > I think you are talking about the mkdir in the wrong place. It isn't
>> > related to unbind at all. The sequence you mentioned is just because we
>> > lazy and let pci auto probe the driver. Under the hood you are doing:
>> >
>> > 1) load the module
>> > 2) bind the driver
>> > 3) unbind the driver
>> > 4) bind the driver in survivability mode
>> >
>> > The sequence we should actually have is:
>> >
>> > 1) load the module
>> > 2) bind the driver in survivability mode
>
>No, this doesn't work for the use case we want it.
>
>The goal is to be able to only move one single device to the survivability
>mode at runtime without disrupting the work that is going on on other devices.
>So we cannot unload the module and remove the autoprobe.

where are you seeing the need to remove the module in the above
sequence?

See that step 1 is about loading  the module. *If* the module
was already loaded, then unbinding it would make sense, but it's not a
required step.

Lucas De Marchi

>
>>
>> This is what i meant.
>>
>> 1) load the module
>> 2) bind the driver
>> 3) unbind the driver
>>
>> 4)  mkdir /sys/kernel/config/xe/0000:03:00.0
>>    echo .... > /sys/kernel/kernel/config/xe/0000:03:00.0/...
>> 5) bind the driver in survivability mode
>>
>>
>> At step 4, when creating directory. The bdf needs to be validated, ie (it
>> should be pci_dev that xe will probe). i checked the struct pci_dev but
>> didn't find anything.
>> Will have to match the device id against supported pci device ids.
>
>I don't believe we need to run any validation. If admin creates a file/directory
>with invalid address it will be just ignored, no?!
>
>On the probe we only get the directory, file for the pci device we are probing.
>
>>
>> Otherwise, there might be wrong non functional bdf directories present based
>> on what user provides.
>>
>> Thanks
>> Riana
>> >
>> > You shouldn't create any directory when unbinding. It's the user who
>> > should create it. When **binding** the driver we should check what are
>> > the extra configuration available and adapt the probe according to that.
>> >
>> > For that we have to disable pci driver autoprobe and tweak the
>> > configfs settings:
>> >
>> > 1) echo 0 > /sys/bus/pci/drivers_autoprobe
>> >     modprobe xe
>> >
>> > 2) mkdir /sys/kernel/config/xe/0000:03:00.0
>> >     echo .... > /sys/kernel/kernel/config/xe/0000:03:00.0/...
>> >     echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/bind
>> >
>> >
>> > Lucas De Marchi
>> >
>> > >
>> > > The attr is WO and any value can be written, only if the correct bdf
>> > > is added in the attr then it'll be used on probe to enter
>> > > survivability mode.The current patch only checks the format and does
>> > > not check if bdf belongs to xe.
>> > > >
>> > > > > + */
>> > > > > +
>> > > > > +void xe_configfs_clear_survivability_mode(void)
>> > > > > +{
>> > > > > +    kfree(xe_modparam.survivability_mode);
>> > > > > +    xe_modparam.survivability_mode = NULL;
>> > > > > +}
>> > > > > +
>> > > > > +static ssize_t survivability_mode_store(struct config_item
>> > > > > *item, const char *page, size_t len)
>> > > >
>> > > > once you handle the mkdir mentioned above, this should probably be
>> > > > a boolean attr like this:
>> > > >
>> > > >     drivers/nvme/target/configfs.c:CONFIGFS_ATTR(nvmet_,
>> > > > param_pi_enable);
>> > > >
>> > > > > +{
>> > > > > +    char *survivability_mode;
>> > > > > +    int ret;
>> > > > > +    unsigned int domain, bus, slot, function;
>> > > > > +
>> > > > > +    ret = sscanf(page, "%04x:%02x:%02x.%x", &domain, &bus,
>> > > > > &slot, &function);
>> > > > > +    if (ret != 4)
>> > > > > +        return -EINVAL;
>> > > > > +
>> > > > > +    survivability_mode = kstrdup(page, GFP_KERNEL);
>> > > > > +    if (!survivability_mode)
>> > > > > +        return -ENOMEM;
>> > > > > +
>> > > > > +    xe_configfs_clear_survivability_mode();
>> > > > > +    xe_modparam.survivability_mode = survivability_mode;
>> > > > > +
>> > > > > +    return len;
>> > > > > +}
>> > > > > +
>> > > > > +CONFIGFS_ATTR_WO(, survivability_mode);
>> > > > > +
>> > > > > +static struct configfs_attribute *xe_configfs_attrs[] = {
>> > > > > +    &attr_survivability_mode,
>> > > > > +    NULL,
>> > > > > +};
>> > > > > +
>> > > > > +static const struct config_item_type xe_config_type = {
>> > > > > +    .ct_attrs    = xe_configfs_attrs,
>> > > > > +    .ct_owner    = THIS_MODULE,
>> > > > > +};
>> > > > > +
>> > > > > +static struct configfs_subsystem xe_config_subsys = {
>> > > > > +    .su_group = {
>> > > > > +        .cg_item = {
>> > > > > +            .ci_namebuf = "xe",
>> > > > > +            .ci_type = &xe_config_type,
>> > > > > +        },
>> > > > > +    },
>> > > > > +};
>> > > > >
>> > > >
>> > > > so... it seems you are missing a configfs_group_operations.make_group.
>> > > >
>> > > > > +int __init xe_configfs_init(void)
>> > > > > +{
>> > > > > +    int ret;
>> > > > > +
>> > > > > +    config_group_init(&xe_config_subsys.su_group);
>> > > > > +    mutex_init(&xe_config_subsys.su_mutex);
>> > > >
>> > > > this mutex_init seems odd, but inline with other drivers
>> > > yeah it is not used anywhere but the sample and other drivers also
>> > > initialize it
>> > > >
>> > > > > +    ret = configfs_register_subsystem(&xe_config_subsys);
>> > > > > +    if (ret) {
>> > > > > +        pr_err("Error %d while registering subsystem %s\n",
>> > > > > +               ret, xe_config_subsys.su_group.cg_item.ci_namebuf);
>> > > > > +        mutex_destroy(&xe_config_subsys.su_mutex);
>> > > > > +        return ret;
>> > > > > +    }
>> > > > > +
>> > > > > +    return 0;
>> > > > > +}
>> > > > > +
>> > > > > +void __exit xe_configfs_exit(void)
>> > > > > +{
>> > > > > +    xe_configfs_clear_survivability_mode();
>> > > > > +    configfs_unregister_subsystem(&xe_config_subsys);
>> > > > > +    mutex_destroy(&xe_config_subsys.su_mutex);
>> > > > > +}
>> > > > > +
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs.h
>> > > > > b/drivers/gpu/drm/xe/ xe_configfs.h
>> > > > > new file mode 100644
>> > > > > index 000000000000..491629a2ca53
>> > > > > --- /dev/null
>> > > > > +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> > > > > @@ -0,0 +1,12 @@
>> > > > > +/* SPDX-License-Identifier: MIT */
>> > > > > +/*
>> > > > > + * Copyright © 2025 Intel Corporation
>> > > > > + */
>> > > > > +#ifndef _XE_CONFIGFS_H_
>> > > > > +#define _XE_CONFIGFS_H_
>> > > > > +
>> > > > > +int xe_configfs_init(void);
>> > > > > +void xe_configfs_exit(void);
>> > > > > +void xe_configfs_clear_survivability_mode(void);
>> > > > > +
>> > > > > +#endif
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_module.c
>> > > > > b/drivers/gpu/drm/xe/ xe_module.c
>> > > > > index 475acdba2b55..15b3cf22193c 100644
>> > > > > --- a/drivers/gpu/drm/xe/xe_module.c
>> > > > > +++ b/drivers/gpu/drm/xe/xe_module.c
>> > > > > @@ -11,6 +11,7 @@
>> > > > > #include <drm/drm_module.h>
>> > > > >
>> > > > > #include "xe_drv.h"
>> > > > > +#include "xe_configfs.h"
>> > > > > #include "xe_hw_fence.h"
>> > > > > #include "xe_pci.h"
>> > > > > #include "xe_pm.h"
>> > > > > @@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
>> > > > >     {
>> > > > >         .init = xe_check_nomodeset,
>> > > > >     },
>> > > > > +    {
>> > > > > +        .init = xe_configfs_init,
>> > > > > +        .exit = xe_configfs_exit,
>> > > > > +    },
>> > > > >     {
>> > > > >         .init = xe_hw_fence_module_init,
>> > > > >         .exit = xe_hw_fence_module_exit,
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_module.h
>> > > > > b/drivers/gpu/drm/xe/ xe_module.h
>> > > > > index 84339e509c80..c238dbee6bc7 100644
>> > > > > --- a/drivers/gpu/drm/xe/xe_module.h
>> > > > > +++ b/drivers/gpu/drm/xe/xe_module.h
>> > > > > @@ -24,6 +24,7 @@ struct xe_modparam {
>> > > > > #endif
>> > > > >     int wedged_mode;
>> > > > >     u32 svm_notifier_size;
>> > > > > +    char *survivability_mode;
>> > > >
>> > > > drop this.. We want a  config struct in the xe_device. It's actually
>> > > > allocated by the mkdir in the configs and when we are probing, we should
>> > > > find the config instace based on pdev and set the pointer xe->configfs
>> > > > or something like that.
>> > >
>> > > Will add a new struct
>> > >
>> > > Thanks
>> > > Riana
>> > > >
>> > > > thanks
>> > > > Lucas De Marchi
>> > > >
>> > > > > };
>> > > > >
>> > > > > extern struct xe_modparam xe_modparam;
>> > > > > --
>> > > > > 2.47.1
>> > > > >
>> > >
>>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AF2C02198
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 15:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D7610E3FB;
	Wed,  5 Feb 2025 15:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fbEo1qM2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5727D10E3FB
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 15:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738769519; x=1770305519;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V59w45b6/zh9yDCYSLYRQA85Bv89ARTgRwPmasIAqIU=;
 b=fbEo1qM2mBYFRwoEieAJR7z5wsDvmQCSvtLcgi9PQPUsLg9mu8kDns1r
 ck8KSXDWMBkFIOZLV5Sbe9pB1bZCWz47VAkQmGGlQl1FpDrqYWnVHoHqk
 t24FSDcy94R0fWGwn2hfdlUgG1OJbORfcEILEgkFX8BC4Jof3iglR6kGN
 DciG2keJx9Sfe/jijluwUCKS0rffVyJ/8Sp5lKYrP1MYZuG/6WXZplQIz
 1pcDvoZrCfhouN0UFctrIkEyEN/vG+1v1bbECD+o0rOgbaFjxvWLrENL2
 v1gR2Z5eu7s4MnDquB3Va649j9DSsqEafvS5vehls2UqJIhyqgX4ECwfc Q==;
X-CSE-ConnectionGUID: 0fUrcTaaRHmex0qDGgojjg==
X-CSE-MsgGUID: F0W6Gp/IQaCXOSzVADbVnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39499850"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="39499850"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 07:31:59 -0800
X-CSE-ConnectionGUID: Rh9IA2edRGSueXp3ZAIIbQ==
X-CSE-MsgGUID: l/k7Lm9XSBKjsABsUkmp6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="141831949"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 07:31:59 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 07:31:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 07:31:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 07:31:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+9/2OxLT6/xTuwrIhZXr2QmpLQk2ZoBHfhlTrTdkwkzSVfSWf7wZ2wm+uplxSkgaaSo4G/BxVuVI+n+Q+VVYJ2P3m6dziEfJ4lvSY2N6cgMc9PPuvhX+2rztlceSUHyx//iXEGHa4mtnSCj8PWhRVADx//nsrYrcTRBLkZha2BCyndigq/POhoRZNE3o5i+3lvpRuY8XWWdKiCcJJv0RpxgV9UHt8awuJGe9csh+Vu+4QSaC21QMARSXg1UhrDWFMGezdGuOIy9xEIXMUdEB8/FhgepsuuoDK76VZEGm4mdHfreuEK1n1/JYrAlv39VFfvdxuyDzV8QbN6gBKT7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHLg7rKEV+2BbzWn5Q99w/LYVFRXpSlBQipPnbxRj2k=;
 b=mxPPjDCLT5Hg6NBgDzeMtxpSxoBCREp0dLXJWEA/vgF+qnvvRnkTnqnZL+LOAiu03qgkSw2/HtoDDFx6oZh4SHXz7uuPDKop7cyrj9O7I4gvU7DHAO42kA7boPj/OpTxOjjJ0sAq9vGTcT/BEZ1dt0zmPeLhzTlARbYAgZSNvurv/0P7dN8CsQl2/eLfCtFtOvZ5z1G8u0sHFU1KGiOG3k7BGriUjz2RpNDZxyASKepRL88MNW5yqWQ9xEuZRB0c+dmFaEsbHcmtwsV5eJb61c5WGq32da5chLqhri6Xqgq2eMo2uZ3aMsaIOclyJrqOS4uJj2VaeKfkvlCgE3zSBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 15:31:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 15:31:08 +0000
Date: Wed, 5 Feb 2025 09:31:02 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Riana Tauro <riana.tauro@intel.com>,
 "Poosa, Karthik" <karthik.poosa@intel.com>, <matthew.d.roper@intel.com>,
 <andi.shyti@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v2] drm/xe/hwmon: expose package and vram temperature
Message-ID: <eqk6tkzwgsd7xat4yrl5aevpc6mgymque7fenbgeqhmr7yc67p@ltcbreooa7qx>
References: <20250131054502.1528555-1-raag.jadav@intel.com>
 <2c9ce022-56a6-4d25-a274-32d9013f8c49@intel.com>
 <Z53BOTXFSsZ5WKFs@black.fi.intel.com>
 <cce1eb5a-b738-4283-8d3d-e782da14067a@intel.com>
 <Z6Kms_pJxvKJpoL5@intel.com>
 <0551646d-4e57-409c-b416-1a7108a2f4d9@intel.com>
 <Z6NTZ0KrdkSnLCFJ@black.fi.intel.com> <Z6Ns0iN4WYB8pxfs@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z6Ns0iN4WYB8pxfs@intel.com>
X-ClientProxiedBy: MW4PR04CA0268.namprd04.prod.outlook.com
 (2603:10b6:303:88::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8d01c7-5265-4bc8-8c48-08dd45fa1c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GltlzQVsFJ9S1+3ArO+y5W9/NOQgvbUY8w+bs95EiAe0GEsjZUo18xiiDYFz?=
 =?us-ascii?Q?w0pRSbsi+CgWIjzNLPL8Svuo6dIlNvvVd+OWYNMOIm2SsQSe7XReu714/0pf?=
 =?us-ascii?Q?OcowjXWCBgUgRYzAYerontJUFaBAChTK8SR3ozuF7ZbM5qf8gOmH/eEnfOr7?=
 =?us-ascii?Q?Bk/WzTtJ9wlKocXe/gP5g+aUGSzoEp3TD2NsIqMYjJv/CgqoOuGdfRLpiS1o?=
 =?us-ascii?Q?nQBCjjmmE9mbaAjBx9TIH/ZMNoB1yFmu4NIYKTyrWI8PNdM6DBEU3KihOK0E?=
 =?us-ascii?Q?E7R45Hjc+qQbdsusdEa80SxpgznAV9eWjDoL+Mg1pUmsQ8Z5uCcOR6rEP76C?=
 =?us-ascii?Q?TtUP67BQaeVITFKRbFcgnGcwnIrnqikaiTlSHQYg2lm1npTH1uyexxNvFNBw?=
 =?us-ascii?Q?G5R3CZe49N7vXnWxddjGJUz7IPjetGHdTFHAPn8ceG1bvxkNmmWl6OVki2Q4?=
 =?us-ascii?Q?n/9WH4kqlAclwcZDcZ1mLxVVg7AUTZwDnQQ7gfvyxZs636UwPjNrzUgNvwvB?=
 =?us-ascii?Q?jaJcpZcQqOVtAMAG6EhLqGonEsbCEesivTkpNh84oxtCuebbEDK2Z6PeS5jV?=
 =?us-ascii?Q?rZvj4g4VtBDBCRxGI/xeaD3qAZcwtyQBzX8Yh3oPBKKgIwuxC3UixmaYxJUx?=
 =?us-ascii?Q?uQTAyMtlJeaubOl1EYNlOuN/dBelRd9D/2RArpWalZMKc0/YQa+1CnU8yRbl?=
 =?us-ascii?Q?c0dqWwTIAwsAUSGPTd7jCKRfOpf+7zoFMytASIO4o1t9FqKgyVsXrxqrLkn0?=
 =?us-ascii?Q?80qwyjnrdZHnsh2hCgr+VgSGDu2D/pGxfISjgRCBpYNljL/wnAxMs8++HN7p?=
 =?us-ascii?Q?gM3SOTDGlaezceIroBIJkU8fia7gfT89ZBLf263cQV/fxfqsBfwggxbnwni1?=
 =?us-ascii?Q?7x3UZyFLlI+Do36R4Wm756jlKwc/DwmiU0w9aaipK1zcS9QbQz0Bj+qvGzLE?=
 =?us-ascii?Q?1l74Hv+gQapiOCH85EBEqfArPyzhutkREU0baSjKyz7JYvXXjR5LLsbgAq1E?=
 =?us-ascii?Q?5H4S3ERAn4fwvLrrFTAhiC5aCyAh5O8vs01ZEKc63QY0oS8SFHHgVBlLi9vc?=
 =?us-ascii?Q?cfJI0pVAt1srStin8GVorpbW2mI0bq8iiY4RlitpNvEO/6lASb7imrNFsXyQ?=
 =?us-ascii?Q?kcAgWQIoakgb1J3HUwGUWIvAbUJCix+F6ixbf81ctSO1SKEoXAaue4YW1DoU?=
 =?us-ascii?Q?lYQu8yvdnwEtLkoIWDIJhfJqwOSUoyFUUgI90kwYJ3W6ZFztOwsUB8dAdtsw?=
 =?us-ascii?Q?kZy9AfOwwLxSt4IekG+vpX0Pt9LB2ye0gfAu49sEllEpe2YoAn0N2W4BKX/Y?=
 =?us-ascii?Q?eCfb8qRlhHyK5yqfPd9PzIsy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yTYX7Hagnxyp76veki4TwjhEmm5DdDNG5GpZrRUcCoV0Nc2JmmOa1QTBqc47?=
 =?us-ascii?Q?AzvDXspTxHAdcKuoKj/H5sB7jbYIR6Z3QmF0JZakdOFX3HOhv33nZ75MWc+1?=
 =?us-ascii?Q?FoTIpPOI0wR5CdNUguD0OdOpA5glB8dxkX9EiSntkuDjAe8OtZ2cNQkV+Lo5?=
 =?us-ascii?Q?xXn5Wx7aDGClA6Vxq7pvC76brbdWSSHieODs+AW0aoijE+nXUVZcYC4u8K3E?=
 =?us-ascii?Q?NY2JyKDk/hGXDhWKNcejPtZqbSIEcaEXRX0j3eEBrcPGvIh4P/eHrg98LdS0?=
 =?us-ascii?Q?QkDote/D8hFNL5cbAoPw8JAsz8/2YSMdedXns8b5OvlvOGw5T7yVhlR5EewK?=
 =?us-ascii?Q?CtEh5uW1R73T1+U1YORssmCiafk+AzR1TR0Zejn/C6dbtvUGC6p+28Sh93sO?=
 =?us-ascii?Q?/Jmculcv8wmD+DBqjesjxv4faMZAXgMlTUo0KgMIvIor32vEBGwTg77gsGtg?=
 =?us-ascii?Q?E4HBZEJ2vLUpr7Py/oHHcHhDWpleiMJ1FrseeF3ub1UOQXiH7ZiN2ZXl1MSy?=
 =?us-ascii?Q?wPMvl8CxAPzel3EfgNvCbBHMAukCWcKIfY8d+2AEoq0CzaWCoUcZ+3mk/797?=
 =?us-ascii?Q?O8KcoMMKPEFCM2RiYODXxr6fMh8v/sfl7B2SzUuK+IQbutB1KYAKho9EpOF6?=
 =?us-ascii?Q?7weruge978bks9GQtCUl+LM40Ni4duf49EqoVM+TPVUFnqhqS00HTy8H8IX2?=
 =?us-ascii?Q?ZNp4w5xsztyljufRgwfxC78WHuYGldOqI1wbpc25pasVYw9XBhYkwCjSa7E8?=
 =?us-ascii?Q?79pNlMy9+5IGHc8J2b+R8nYe+jfIChNVtE8qnNCZXAf7/YxvWJ4hgXqg84Y0?=
 =?us-ascii?Q?RLZFpg/YZ8d1n1seNTOO61SZiCEGuENEutb/momQdGOebyGVNbs/2J1L9RNS?=
 =?us-ascii?Q?pAISCkEfl73rRLuXJuythi9QhMsnpnelWJFQbq3jKit5YaCAOwB26Fen00Y3?=
 =?us-ascii?Q?15ygXfLOx/dzwA1UaqOx6tLXadRd6hm05v7TmCJKDooHZdVUpSOCYGrFxuv+?=
 =?us-ascii?Q?xmAlaGbhBu6MzX6U6FG4BKhep36b+GtFJP78ZTcnlDrb7ZPWcowbyXaOA/se?=
 =?us-ascii?Q?IVeykI4BN21PfdMTopZ7kZglO8tApbVIOsM/E5OuQMkxVcd+dxWJiyty7L07?=
 =?us-ascii?Q?1yXsoBtq4FCUySg7BfBz1maaD5iA81ipO/6wpOrdxk6nbo0DWcds2C8J+QUR?=
 =?us-ascii?Q?IsRb6xRYD4sW95Rt4yI07NW1X1HtiDFTnqcdrIFJQhwZn8FY38aEYXHvuQT0?=
 =?us-ascii?Q?R0XGcsys4owWIHDQ0uyejzemH8SZnMoS03NkyvOjH8p2W7JRjaSQaEkgdfag?=
 =?us-ascii?Q?OL7TDk7K7wKIEuef2diLalwIATAHdgHVPaP4f4dfOuq9lGb0v7d3f+6YVtbE?=
 =?us-ascii?Q?02OXzDQAenWIdNkGyMqmmC9s/yiKIWJdn572d2btV8TAlO0dL2TT9AWgApfj?=
 =?us-ascii?Q?/kjOlH1VCIWfSC8XI0MveCNvwQ9N85o2GMmSuxScAO/bDsTBQx2aVLgTiXSw?=
 =?us-ascii?Q?u6HtsIddrwWDLw+y7RO4pr9XzF357KUscfhNivx+y+phIsukA91TMQul9LOc?=
 =?us-ascii?Q?ZRhthm4NYtw5T3J5nstvv0Gq64ApNFeROFwj5cfho4fDlSsTGkE+rsPQ5vkk?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8d01c7-5265-4bc8-8c48-08dd45fa1c99
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 15:31:08.3030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92Xi+P/ky6dKS1fmS3FbdTWX7RbWhaFLPaEgEI4ZVDklqSNHOkmWF9bMM+i+8MMzBu3pt9TX4isqFtIelFsfN0HasmRJ/ULIsB2qqgmcVP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8208
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

On Wed, Feb 05, 2025 at 08:51:14AM -0500, Rodrigo Vivi wrote:
>On Wed, Feb 05, 2025 at 02:02:47PM +0200, Raag Jadav wrote:
>> On Wed, Feb 05, 2025 at 12:40:46PM +0530, Riana Tauro wrote:
>> > On 2/5/2025 5:15 AM, Rodrigo Vivi wrote:
>> > > On Mon, Feb 03, 2025 at 11:57:20AM +0530, Riana Tauro wrote:
>> > > > On 2/1/2025 12:07 PM, Raag Jadav wrote:
>> > > > > On Fri, Jan 31, 2025 at 08:13:15PM +0530, Poosa, Karthik wrote:
>> > > > > > On 31-01-2025 11:15, Raag Jadav wrote:
>> > > > > > > Add hwmon support for temp2_input and temp3_input attributes, which will
>> > > > > >
>> > > > > > Add hwmon support for temp2_input and temp3_input attributes for supported platforms
>> > > > > >
>> > > > > > > expose package and vram temperature in millidegree Celsius. With this in
>> > > > > > > place we can monitor temperature using lm-sensors tool.
>> > > > > >
>> > > > > > With these changes, package and vram temperatures can be monitored using lm-sensors tool.
>> > > > >
>> > > > > That's pretty much what it already says, doesn't it?
>> > > > >
>> > > > > > > v2: Reuse existing channels (Badal, Karthik)
>> > > > > > Add a new channel for VRAM temperature, channel 3.
>> > > > > > >
>> > > > > > > Signed-off-by: Raag Jadav<raag.jadav@intel.com>
>> > > > > > > Reviewed-by: Andi Shyti<andi.shyti@linux.intel.com>
>> > > > > > > ---
>> > > > > > >     .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
>> > > > > > >     drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
>> > > > > > >     drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
>> > > > > > >     drivers/gpu/drm/xe/xe_hwmon.c                 | 60 +++++++++++++++++++
>> > > > > > >     4 files changed, 81 insertions(+)
>> > > > > > >
>> > > > > > > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> > > > > > > index d792a56f59ac..9bce281314df 100644
>> > > > > > > --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> > > > > > > +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> > > > > > > @@ -108,3 +108,19 @@ Contact:	intel-xe@lists.freedesktop.org
>> > > > > > >     Description:	RO. Package current voltage in millivolt.
>> > > > > > >     		Only supported for particular Intel Xe graphics platforms.
>> > > > > > > +
>> > > > > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
>> > > > > > > +Date:		March 2025
>> > > > > >
>> > > > > > January 2025,
>> > > > > >
>> > > > > > February 2025, if there is a next revision after v2
>> > > > > >
>> > > > > > > +KernelVersion:	6.14
>> > > > > > > +Contact:	intel-xe@lists.freedesktop.org
>> > > > > > > +Description:	RO. Package temperature in millidegree Celsius.
>> > > > > > > +
>> > > > > > > +		Only supported for particular Intel Xe graphics platforms.
>> > > > > > > +
>> > > > > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_input
>> > > > > > > +Date:		March 2025
>> > > > > >
>> > > > > > January 2025
>> > > > > >
>> > > > > > February 2025, if there is a next revision after v2
>> > > > >
>> > > > > Something to follow: https://hansen.beer/~dave/phb/
>> > > > >
>> > > > > > > +KernelVersion:	6.14
>> > > > > > > +Contact:	intel-xe@lists.freedesktop.org
>> > > > > > > +Description:	RO. VRAM temperature in millidegree Celsius.
>> > > > > > > +
>> > > > > > > +		Only supported for particular Intel Xe graphics platforms.
>> > > > > > > diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> > > > > > > index 519dd1067a19..f5e5234857c1 100644
>> > > > > > > --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> > > > > > > +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> > > > > > > @@ -34,6 +34,9 @@
>> > > > > > >     #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>> > > > > > > +#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
>> > > > > > > +#define   TEMP_MASK				REG_GENMASK(7, 0)
>> > > > > > TEMP_MASK -> TEMPERATURE_MASK
>> > > > >
>> > > > > This is consistent with other GENMASK() macros here.
>> > > > >
>> > > > > > >     #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>> > > > > > >     #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
>> > > > > > >     #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
>> > > > > > > diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> > > > > > > index 0b0b49d850ae..8846eb9ce2a4 100644
>> > > > > > > --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> > > > > > > +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> > > > > > > @@ -21,6 +21,8 @@
>> > > > > > >     #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
>> > > > > > >     #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
>> > > > > > >     #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
>> > > > > > > +#define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
>> > > > > > > +#define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>> > > > > > >     #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
>> > > > > > >     #define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
>> > > > > > >     #define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
>> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> > > > > > > index fde56dad3ab7..7f327e334212 100644
>> > > > > > > --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> > > > > > > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> > > > > > > @@ -6,6 +6,7 @@
>> > > > > > >     #include <linux/hwmon-sysfs.h>
>> > > > > > >     #include <linux/hwmon.h>
>> > > > > > >     #include <linux/types.h>
>> > > > > > > +#include <linux/units.h>
>> > > > > > >     #include <drm/drm_managed.h>
>> > > > > > >     #include "regs/xe_gt_regs.h"
>> > > > > > > @@ -20,6 +21,7 @@
>> > > > > > >     #include "xe_pm.h"
>> > > > > > >     enum xe_hwmon_reg {
>> > > > > > > +	REG_TEMP,
>> > > > > >
>> > > > > > Any specific reason for adding this at the beginning of enum ?
>> > > > >
>> > > > > This follows the ordering of enum hwmon_sensor_types (as the rest of the patch).
>> > > > >
>> > > > > > Generally addition is at the end for any new enums.
>> > > > > >
>> > > > > > >     	REG_PKG_RAPL_LIMIT,
>> > > > > > >     	REG_PKG_POWER_SKU,
>> > > > > > >     	REG_PKG_POWER_SKU_UNIT,
>> > > > > > > @@ -36,6 +38,7 @@ enum xe_hwmon_reg_operation {
>> > > > > > >     enum xe_hwmon_channel {
>> > > > > > >     	CHANNEL_CARD,
>> > > > > > >     	CHANNEL_PKG,
>> > > > > > > +	CHANNEL_VRAM,
>> > > > > > >     	CHANNEL_MAX,
>> > > > > > >     };
>> > > > > > > @@ -84,6 +87,19 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>> > > > > > >     	struct xe_device *xe = hwmon->xe;
>> > > > > > >     	switch (hwmon_reg) {
>> > > > > > > +	case REG_TEMP:
>> > > > > > > +		if (xe->info.platform == XE_BATTLEMAGE) {
>> > > > > > > +			if (channel == CHANNEL_PKG)
>> > > > > > > +				return BMG_PACKAGE_TEMPERATURE;
>> > > > > > > +			else if (channel == CHANNEL_VRAM)
>> > > > > > > +				return BMG_VRAM_TEMPERATURE;
>> > > > > > > +		} else if (xe->info.platform == XE_DG2) {
>> > > > > > > +			if (channel == CHANNEL_PKG)
>> > > > > > > +				return PCU_CR_PACKAGE_TEMPERATURE;
>> > > > > > > +			else if (channel == CHANNEL_VRAM)
>> > > > > > > +				return BMG_VRAM_TEMPERATURE;
>> > > > > >
>> > > > > > This doesn't look good.
>> > > > > >
>> > > > > > Can you add PCU_CR_VRAM_TEMPERATURE with same offset in
>> > > > > > xe/regs/xe_mchbar_regs.h ?
>> > > > >
>> > > > > It's not mchbar register.
>> > > >
>> > > > add it under the same file without the bmg prefix.
>> > > >
>> > > > The other registers are platform specific and have the prefix.
>> > > > This is common and can have the PCU prefix
>> > >
>> > > No, but the point of the xe_mchbar_reg itself is to only
>> > > include registers that are from the mchbar.
>> >
>> > Sorry for the misunderstanding.
>> > I meant under the existing pcode_regs file.
>> >
>> > It should be okay to have a common prefix (like PCU) if register is common.
>>
>> Although others are platform specific they are expected to be reused in
>> the future, aren't they?
>
>This strategy of adding registers with the first platform acronym as register
>prefix, then reusing later on the following platforms, was a strategy very
>utilized in i915. However, when Lucas refactored the registers accesses here
>in Xe, it started a trend of avoiding it, unless needed.

nothing changed much wrt strategy. Even if I dislike it.

Most of the changes I did was to start from scratch: <= gen12
prefixes/suffixes got dropped and some platform prefixes replaced by the
IP name.  Not having a prefix for the first platform is inline with the
practice on the i915 side.  Then when a new platform comes up and decide
to move the register, then the new one gains the platform/ip prefix
where that started.

And we banned GEN* names as they don't describe well our gpus anymore.

Lucas De Marchi

>
>+ Lucas and Thomas
>
>
>>
>> Do we really want another group in the same range?
>
>perhaps we need to adjust the current ones bringing to the new trend?
>
>>
>> Raag

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35224CD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 13:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA6010E084;
	Fri, 19 Jun 2026 13:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HT8RKK3V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3295B10E084
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781877201; x=1813413201;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UFKoOH2WnheDTn3r21xM+mEGI+fSFwhGFjiardwFhpg=;
 b=HT8RKK3Vm1i2PqTR1fR7ZEDt6oYllWi2FDoiO4qYie3HG8JMFuOwA8+m
 TouW1naYGARIIcLieWl5JzrSNQEHI5bzfos+sBRqCpvaawZTD+EA7ImOS
 i4+BJF9i48pZXnPkys+buxF9v3S2asfMAFP5tRn4daSd6r/2cRNbtfEJ8
 TwEXGdr1mxFc1SsclDkTaAgMTeSd1VLr0rIPZJYOEZmxSpoPUkRwsTT8O
 VsDzC1dp6gxmVLUGNIc67CRuOHDyArGrUmlcy+UBnJIxbl4y7jz7PZUgG
 8SFZmxFlVh5dznnSerC89Wcfwwiechx+J2T54/Ip34F/WOSV8cTRZFQ0/ w==;
X-CSE-ConnectionGUID: G95/YBL/R5m2WH3c9T+xmQ==
X-CSE-MsgGUID: ek9IE6F0S4uyKLIyz069jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82764515"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="82764515"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 06:53:21 -0700
X-CSE-ConnectionGUID: lN25sbuuQLCPnPfZb3OBAg==
X-CSE-MsgGUID: nip7TCBnRfueYsurW9Xw3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="248701634"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 06:53:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 06:53:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 06:53:20 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 06:53:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdz3+wn9FtKT/8DiBa+HqTe+8nlD+dRoXOdNgENS+qH2fSwzx3tPTykOa71ST/YouTuRhB28s3o616s2yBl59Hn3FDOh+ijzTLg/zPl0h6NA8ejOAQkYYZRYkTo+K0OjYnetDqKwWP48FbZyAqk/ppLZrtGH2lhXTXkd/IHE2E4KlWsZQjOrOZPZdhCKq/Ea6Cwj0ZBB7eb9Tb7SgBOSzaS4uOoCT3u9Qgw3NEbvgPmvdm3DmPFGMAbAdEcFcjkuHxpa7T4eOQKQbI4f3PCvkgg5rfnnoWiBOapNMHe4lKJbMUN3jRve8oH2OTCzDaYZ5KAJz/Z/CXiLPbv3PIdpkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSshANlBmONfjhUIGk7/6BxTR6h0Fn8TaGBiwoC01nE=;
 b=hGwC/u0o4Fy8xqwF3j+jLFrx9f6j95kKTSnMoXAFrz4yHPLx0G6oGcLDgQGtppuQWpM+/dWpkiALW0e2H/lO5gtIJ4COHWUvmbsgoJBhrUc4NjXGyZ4R8uUtJ9+d/9GDcydhf4O8la1GuRGf630zQwTYS35XH3zCqIfP6rHK0G4uIxL1DCWVBSciEyEHUMtKqYxoYEVT+bJb3lvXTpAfayNcsi9liCxezySaIl9eYjyHLHG8w2xfprHrMaO5Fg9Xs/TnA1Xi3zoIBq7Dg5DmNnAYZFREDtKRForoBsh2W+SViBTltaXzXcMJdEBIPN/n28Rt04/sb9wXOgok0D2TYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS4PPF75D68BA1B.namprd11.prod.outlook.com (2603:10b6:f:fc02::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 13:53:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 13:53:15 +0000
Message-ID: <ea2f8233-c39f-4242-b38d-7f64ea3211e5@intel.com>
Date: Fri, 19 Jun 2026 15:53:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/pcode: Add support to get pcode version
 from PMT
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <michael.j.ruhl@intel.com>,
 <matthew.d.roper@intel.com>, <soham.purkait@intel.com>
References: <20260619114018.667995-1-karthik.poosa@intel.com>
 <20260619114018.667995-2-karthik.poosa@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260619114018.667995-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000521.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::66b) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS4PPF75D68BA1B:EE_
X-MS-Office365-Filtering-Correlation-Id: d97352b4-3809-4c9e-6db0-08dece0a1c5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: FCtwxdiesNoJ0m5N3a+R+Q8rJPJ8QjpErbDVMcxxUt7ZPtU/o+naklMozbywSDDWFoZ5uWt8eK1csufkSVNpZJE9VAuARur0Qso+SICo8b8f7ib17YRfugjGli3t9MMahWol1KbotWtQHKw5LDoL3GVjVB9fbN4KsOe9PQIaedc58IP3JbbJ0OwY7qRAaxMXbvrsNR7N74l3f1ahPJ/bRP0PW7UKzjChk+tzcwyPA6zxhoLd6XvdC4FuklyS3HoKpYArE7pyaCtkz17QIh/fFtXiFf6aRPv5umlltZq0s2CYuK6nXt91k4GFQ+o1Eeh1R4qS6No+krUupRJeHF2UWq1Z1dbzGr0moi2iTrAJ28L3lb1RpSBwQ9l7341mdUOVuodFyqqm7j1chSe2vLxPZ7UkvNMInz470fhaApCoDfvAwtRsVJZ+LMdzPSFLWSujcv2SvaAYea+MJm2wnUdNIqShGcntGNbLXCUa38oHdZYvXrG08RsNQJlhJWiO/TRbi7dKdsOJYP+kH3ItWXOWw8A+MG8MNCmNG714ucMUa8nv+KFIVNoitKMq5ggG+QokjU6FGp4+cUDxfDjg/ToTIfxXTcVuGWEIU4gmZNqwDRZe0bXhQ4Uo5yvZvLszlwmoumNq/B75U61IaN2iSLw8DKCntMbsggsAaXRd4CkT+VQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEdPVGIrMEdJZmZ5aTA5VGxibmFjQ0hHZEtMNGdSbjFjZEp1ZmJkbmxuRUI0?=
 =?utf-8?B?RzFFU0VLU0x0MkQwZXhiSHFvTEhMQStFM0hNSUFvcC9KWU1LekNFNDhZUWI5?=
 =?utf-8?B?K0ZFQTdWcDcvT0pZOXpBR2FKdVdRckRrZW5LSGNnRUwrbm10NUx3Z2Y4UURF?=
 =?utf-8?B?dDdVYVdWcHpkemFrV3BZY2R2MGpmQTB1cldqRGEzMzZENkhESktFeVFJU0dV?=
 =?utf-8?B?a2NwaEV2U2sxR05kTXUzenFXVkMxWVhIYkk3VGZxd0tXTnpna1VCR3RDb2ls?=
 =?utf-8?B?UWQrWmFmTlpaV2RKR21RaldFY0k0bkp5R0NOZlJGd2JmS0w3Z0pXcFFLRWFq?=
 =?utf-8?B?Lys1Z1drQ3czeGNIQnNZa1NXbkFvR25JUFdueGdWdHZVWlNVSmVBNUpqdlR0?=
 =?utf-8?B?TVpTeFUzelk5VWJ5WndIUHo2eGZPREdhV2dUZ0Q5czJKWUZONXV6S0FWMTlt?=
 =?utf-8?B?bUU1aTZxdllHUHMwek5wT1ltRi95U1hIZDZrak1tb3pyaVYwZzd0ZnUvUXVR?=
 =?utf-8?B?V1FEYUpZc3UyWjlDY0xoSnluKzBZREljVnE5SlZTdkZ6ckJNdmZPeFJraHJv?=
 =?utf-8?B?N3dTTGoxYlpGTnRnSmxBdXMybGlYV2Zxdmd1WVVJOHBFdTNvNjZhQ1AvQkpU?=
 =?utf-8?B?THY1enpLNGdZZTRLVm1JVC9TQk9ydlg0MUtZaGVnNk5JVWNFSGxzSzAyZ24x?=
 =?utf-8?B?b2NOblh5TGIzT0F5VGVwVFhDWkRGcWU2aTBNUlhCUmdybUVUTDgxS04zc2Er?=
 =?utf-8?B?d3pOaElneXF5bkVTeldqM3hJZGVTK0o5Sndhd0ZhcHludmt1dDBGTGF6L3BR?=
 =?utf-8?B?R3YyVmxYWVFYTUxRclZweGdkK1NVRGgxcW5ERk9KQVkzL05TMUhOaGV6OWly?=
 =?utf-8?B?MExSRng4ZWE1YlVsNmhiQjlGbjNjY1FULzl5WTZEeU5yanVNeDFab3c5d2xR?=
 =?utf-8?B?WmU3allUbVk0RzJzOGZtRmpPRlZtR3JRM0dJN1FKY3RrTHNuRWdaR3ExOTZO?=
 =?utf-8?B?STFmcklOM3E0ajF3RE9oWEdvbVVwbDRZVC9uSGd6ZzVnQUtjZndqMEg5TDJ4?=
 =?utf-8?B?WU9nbGMzQ1dsbnNTTjZoZnpBbmh4ZHpOYUVDSHlKTEJobThCZ3VkUGVYS2dB?=
 =?utf-8?B?MUdkNTNGWXIwQ2NwVVRHYW1zZVJpb2NRb292WWYzRk1lcVNHeUEzRDhSNWxi?=
 =?utf-8?B?MzZ3cTdiTXVPaUZ4R0l5WmpnZlk5R3RrQmZvaU5JMllTUG42cU1DcHIxa2ti?=
 =?utf-8?B?a2hGblZ2UHhRci9YeGhWV05FLzdQNHZJL0RGemZQMUtvL2pKMythOVRpb1Rz?=
 =?utf-8?B?RFl2QTZCZlgwRkl5ZjVma21PUmhqNTA5aDBjYjdCcy9ESzJkQzJ4VWI4UnlK?=
 =?utf-8?B?cDlUZXM0S1FrS0xxYllacXcrY1gwZzh5T255SUtKMUs1Sy9jVnhwbTRyTDdU?=
 =?utf-8?B?dVJzdm9CVTBZS2VWeU9tQ2taeGYvejdCanc1OUNCU2tLS0VLcnVST3dnK0dZ?=
 =?utf-8?B?aGxKeXFYQmQzSkg1QmRkQVVoamVNbmRMVlJmaFVTbXZHRWtkMmhqejcrTTlt?=
 =?utf-8?B?dXhnbzVCTlBva29NbWw0R1Z6RStSOElCZmhSVm1GRVE3T25mOU9Mb3dQdUtV?=
 =?utf-8?B?cVdVZjZ0cDVyQTZPeW56VmpQS25vSUo1ck1UV1FkazhjZmZXVXpLRGxLekFw?=
 =?utf-8?B?MW5qdmx1cGpPZUhpaVh0L0E0dkpXS25DNll2dDZyd0oxZlNqZFFNdXhhdVlt?=
 =?utf-8?B?eXBWbkhuNXpiaXZnZm9IMWRSWGJNaDVtYklReXJ6U2RNZ2JzOGpjcnBtcTBi?=
 =?utf-8?B?SkxaN29VTUhmQzJHeTJ4aUVaR2ZsR09pWXFHNVdaanBMNFZVNkZPRm9ER28r?=
 =?utf-8?B?VTBBMmNiV0ZxVUIxaUZ5cTQ1YlNrMVlKV2JuYnIzdHprMjhaeTR0WEd4d0gv?=
 =?utf-8?B?ems3cUFpMkJoS2N2U1RsVEU1Qm9hVHE2Q2txOWlTZEJFTmVId2V5YmFpb1lp?=
 =?utf-8?B?UHVJK0xmckkzdzFQTjJjN3NFWFFvdFVnT3pQR015SkY0VjE3Y0VkajcrQkph?=
 =?utf-8?B?SEE4VkVwVE5FVjRxUXRIQ3EwWWNMbCtjU0p4QlhPcS9sdnZSWHlvY211MmZ6?=
 =?utf-8?B?dVVFcUJWeU1OZlJtKzVHY0RwSjFtb3F0Z21VNGhMMk1XVnpza1pVbkVoZEpZ?=
 =?utf-8?B?ZDVsMHZXQjJFVjgyNWpHbnRodlMxUWJVWC9uN2tVN21FYWR6OVZjRjRWOENk?=
 =?utf-8?B?QzJQMlh1ZjdXYU1yUTgxN2FKWU5oQmRrb1NMNldKUW90WGNxV1FUbUJTRDAy?=
 =?utf-8?B?ZlVvSjFTWUJHdERTZzFYZHY1SW9scFAyWXRWalM1M3J5MVp5Z2luRFBhc2ty?=
 =?utf-8?Q?TAoq1W5pu30O5y+k=3D?=
X-Exchange-RoutingPolicyChecked: fq4jMJw1GXUTV5lRcVuI9rYpahTE75lm00TLvMJBhVh1SAWStbxB71BiEjjhVK/Gb1M9P/7UEfqIQm0zmJrl/Ecupq7vCjk/abjK4jWtEadewfGUyZ6NqVi3i8pxwbXsOiU3878IvQG63dUXUUblLSWOXKbhmtQr8iR1UwOwNi1y6RXpbLAmZ/Ua4TWTSFVjCLPs6ph3qDhvR4HtAKoNtExGmvL7IFsInH2XUV7qQThVQDJIJhrdd0618v8l00tl002384siR6V9AgRuLLy5ixP+milJdUDnwpHsCcWyzsLio6lr/AdRwvp08kM1S7j9liYQBvT0nlCxkIKe7MdVfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d97352b4-3809-4c9e-6db0-08dece0a1c5d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 13:53:15.5969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vY3DiTnoELYXYlVUuvUlJeP/uLnUFM74Kscagdy52CACTCsTFEk/qiqZMq/96QoFltV/gmC7M5kt2g5Laz+AhrGSUHBkuZUGX1UUfuzycrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF75D68BA1B
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



On 6/19/2026 1:40 PM, Karthik Poosa wrote:
> Add api get_pcode_version() to read pcode version from PMT telemetry.
> Add PUNIT_VERSION telemetry offset in xe_pmt.h.
> 
> v2:
>  - Pass struct device* instead of struct pci_dev* as xe_pmt_telem_read()
>    got updated.
>  - Support pcode version read from PMT only on BMG and CRI platform as
>    PUNIT_VERSION_OFFSET is currently fixed for these platforms. (Micheal)
>  - Use scope based runtime PM to wakeup device before PMT read.
>  - Update commit message.
> 
> v3:
>  - Move the platform check to xe_debugfs.c where the debugfs entries are
>    created.

nit: we can keep a change log under the --- line

> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
>  drivers/gpu/drm/xe/xe_pcode.c    | 21 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pcode.h    |  7 +++++++
>  3 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index 240d57993ea6..8a70e17912f3 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -15,6 +15,8 @@
>  #define	ENERGY_PKG			REG_GENMASK64(31, 0)
>  #define	ENERGY_CARD			REG_GENMASK64(63, 32)
>  
> +#define PUNIT_VERSION_OFFSET		(0xA0)

no need to wrap number in ( )

> +
>  #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>  #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>  
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 866986694d9c..185d242b642e 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -15,6 +15,9 @@
>  #include "xe_device.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode_api.h"

btw, shouldn't this be in abi/ folder ?

> +#include "xe_vsec.h"
> +#include "regs/xe_pmt.h"
> +#include "xe_pm.h"

please sort includes in alphabetical order 

>  
>  /**
>   * DOC: PCODE
> @@ -350,3 +353,21 @@ int xe_pcode_probe_early(struct xe_device *xe)
>  	return xe_pcode_ready(xe, false);
>  }
>  ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
> +

public functions shall have a kernel-doc

> +int get_pcode_version(struct xe_device *xe, struct pcode_version *version)

missing the xe_pcode_ prefix

	xe_pcode_get_version(xe, version)

> +{
> +	int ret = 0;
> +
> +	guard(xe_pm_runtime)(xe);
> +
> +	ret = xe_pmt_telem_read(xe->drm.dev,
> +				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
> +				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
> +	if (ret != sizeof(*version)) {
> +		drm_warn(&xe->drm, "pcode version read from PMT failed, ret %d\n", ret);

we can use xe_warn(xe, ...) here

nit: and we can use %pe to print user friendly error code

	"pcode: version read from PMT failed (%pe)\n"

> +		return ret;
> +	}
> +	drm_dbg(&xe->drm, "pcode version major %d minor %d engg %d\n", version->major,
> +		version->minor, version->engg);

we can use xe_dbg(xe, ...) here
and we should use %u for unsigned fields

	"pcode: version %u.%u.%u\n"

> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> index 18260c29e620..e496135b8fa2 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -12,6 +12,12 @@ struct drm_device;
>  struct xe_device;
>  struct xe_tile;
>  
> +struct pcode_version {

what about the xe_ prefix? xe_pcode_version?

> +	u16 minor;
> +	u16 major;
> +	u32 engg;
> +};
> +
>  int xe_pcode_init_early(struct xe_tile *tile);
>  int xe_pcode_probe_early(struct xe_device *xe);
>  int xe_pcode_ready(struct xe_device *xe, bool locked);
> @@ -22,6 +28,7 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
>  			   int timeout_ms);
>  int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
>  			     u32 data1, int timeout);
> +int get_pcode_version(struct xe_device *xe, struct pcode_version *version);
>  
>  #define xe_pcode_write(tile, mbox, val) \
>  	xe_pcode_write_timeout(tile, mbox, val, 1)


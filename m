Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37921C61DD3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 22:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F5D10E0C2;
	Tue,  1 Sep 2026 22:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLcR+wHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB08D10E0C2
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 22:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788300838; x=1819836838;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4OejbAPwrB8UylYt1sdAlR7Dtu4Mrn/XZzNtwUjuc9k=;
 b=QLcR+wHF8cRvbRj8DKmGwlstg+SNCI0gpM5jGB+Ss5bqJvAuukj5OK/k
 8ANo0esCX404Sa0qkb5eI/SjBHdnBIE14Dch9Xa5HVKmvW8KxVk15z107
 ccWm8w+K2xa6duj/udlR0FhVWljganRytXzHyYq4AI/UwwjlYkN2+/LZq
 qxgdww+xHaKPSM6K5VTJRQCVqdVsl8bkWa6Nmr3yuT0uatEcuGGOBp8f4
 XcrkgPgyOfs6M9EqebxS90JrZDb+8bwd1B/orakXRsArKEwH1ikgl8XVy
 adsdUqZCu63RcBfA3vhm8EDXi8dZEdzdG4Ecq0/BQc0SUswCR2SR4g+JP w==;
X-CSE-ConnectionGUID: FmXpyFU1Qee4TDkV9HaZEg==
X-CSE-MsgGUID: cW6lrLrpQ4OsT+eGva9fJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100259727"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="100259727"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 15:13:55 -0700
X-CSE-ConnectionGUID: 5UU3EZOxRgejtiTUlBEQUA==
X-CSE-MsgGUID: nbyzUly1T6qYZI6uL0m02w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="307455392"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 15:13:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 15:13:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 15:13:54 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 15:13:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfqDW1aMI7kOX/c4/BcMvmp6JRckz4nEjBrr9psWoJI7/+8gl/dzB5eCzucnCNY7sC61+ikNr4H+3fNUIMJ/mdlcSDsxj37V82j4WLVuIRISVYgc2KlcQnw2BuYoU81/otkcAmTr7D67O/C1GRFANGD1hLBLbFCTM6rT+t5TcbBpt9nm5CJ3goxlwtG60kIoCLFDHYUzjqtRlGL8hn1TFsfyz2Hke9Q7pklkb0XRFqLrv9rc7ir+2jRkGIdMirlia9TuzQd+rhWO5ljAYG2325yh3kZJtfPBv+hHgKCrtx6/zuqHKllynB2aAFaowFa6NSz+fYW9jvteeTrjcWgbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9OLieJylWzfT8Y3RnmTdCYzlvqsLRytoDJTNuEJ/NM=;
 b=ROOfVoUGUb+La2s4XZSt0ZVK1e59kuEO+wO4Moh7SRliiDtJv8389EWBr9wo9QyKYh1gmnXx5uc0w1OXqbVjAmiCCTQFBOn/Suy5K/DaGRvM5000Y5WSt3kqdVCQNV37zda08b+aLK3X2Or1g6nW7yd3UJtfnChN27CbHxgfcudZRBP6ybUz0PCrmw6WIhwQq/gRPobDGuq33xlg+tQZaz7D2rPwW26qggwaDMb7S5y+Qou8/DBruGlCQWaUOsonBCnlZgUHsAhIHmwF16oEFtL5sFKwGqxt4BciWmb/TyciJujSvRV6yTN1MbNXskyFQ4CfERsdCuIv9SXrzi3djg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SJ0PR11MB5007.namprd11.prod.outlook.com (2603:10b6:a03:2d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:13:53 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:13:52 +0000
Date: Tue, 1 Sep 2026 18:13:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/xe_ras: Add Fabric error handling
Message-ID: <apdOHKaTx1KOWmA_@intel.com>
References: <20260825141109.3797483-4-riana.tauro@intel.com>
 <20260825141109.3797483-5-riana.tauro@intel.com>
 <a063221b-7a11-45a7-bac9-12d19f6a2a76@intel.com>
 <ao9T2POk0wXbGf4L@intel.com>
 <6f8e5f5e-7bd8-4fef-b714-ef077f50812a@linux.intel.com>
 <apAtcSNzTKnNGU9q@intel.com>
 <9207fded-4149-4004-953c-5e125cdde176@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9207fded-4149-4004-953c-5e125cdde176@intel.com>
X-ClientProxiedBy: SJ0PR13CA0085.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::30) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SJ0PR11MB5007:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f198c0f-b282-4e74-578d-08df08764e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|4143699003|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: ibArzPEc9wN4WBluUZBydthTqJSG9gTlxtxvUV/aHVfBcQf45MvjmpkhRhmUt7sC4sSPgV1DI3MB7N8iKs3yOiVqmSlcTTpw1FN1e6AaWjlnOg/Ow+BVy1Q7+Jyj/BSylDeOT5LSmDTfp7qxTWqF1Fm8z9RyA5CksphXR3uoqRcEB7lHSE/y6O0hWKj6X9qcxM6Je1PL6g1Iy1i0mrtnip4wUfjwCd5oblWwt0GNlyTcevgRzw+yjbe6wOGSa7BTsBrDb0zc8TKFdqSCKDr8kO6E3yhGHTlwHq7x3ZCZQfwUei4odwat1mZr8H4hprY8JPDgTGZjKhc1jDThtvbrj1Wv9SMi4TL3CE+vcAcP/yLwMwbeLokABAzixJGPfmaDKnHojmrPrAwJXSgQtIx/gkthwMh5030a0X1z1p6/FGB1BN9ajxdc/h9aOMeVcYgOF+4i07Pdr1KfG9Ot3LX/tlNTQHeHrcvULmrsay69NXs5QIJoNbkQ1wbkhHNS1jBJjaKSwUCSeJhL2PNYLs6rRxqmCXuZZwFgNnJj0YBswZ3VeclixA0YlOzX2MRMumylSAefWuKY0Z0CtsKzmer28kYRrTBDxXPOYJCAd7zi7LhDsGJpVdXTve3IN1NEY2HVRZo1/5lDBLXXdVRCbf85om8r/8MCwRSPiMhdVlgX3ts=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?u4lLLXZCne1kclV0XgXPFwtQMit7x3ZHPkgQopwYZCVipPm0jbt6v/aHx4?=
 =?iso-8859-1?Q?yxBkZvVG9u75x/Tsn6qzmKOsVMJgXnA/cWuL063i1PHQgbzCaQl1YYpHc0?=
 =?iso-8859-1?Q?NC7eyrocl6m0AgQqNItQx5NTSkK/W/JQgfPG9gj8WrIYOfd/yB8snIEDPa?=
 =?iso-8859-1?Q?duIwyemUub11HJdY9kau/jPpAVP+u0js4ee6DTwoK1TJtCd7OUW5vvCoJr?=
 =?iso-8859-1?Q?ZQRWwxJ/PGyz1xzCiCTjK8fqnvRxXdJU51QkFMrQsy6JxeBG9AgxA2RkvK?=
 =?iso-8859-1?Q?U4tb+bmUdBRtqjGu+VZYCcfbHnaFPU+ehhj+frbWNH9OM8+nTsIGGXKLqE?=
 =?iso-8859-1?Q?jNaAlV3lTgqshUf91RUJVVmx/suUCX1w8H0Z/iOgiV0TL1q31Nw0ck/mcC?=
 =?iso-8859-1?Q?vq2PUi3H62S+a4Uj7/2Wr3/ip+g+IZybZEXKh7M2jbjt7+dvbo8b/mQBHD?=
 =?iso-8859-1?Q?72HfjE/S21DdkAF5A0LZ8dNGSxxg/2yP+Y8wOrk83CwLo4Vvg26NFOxSmM?=
 =?iso-8859-1?Q?whsnQ2m54ioLIODL/wlQAMWwMU0+RG3LObm6+dhatVVBngjlSwP11YE/4P?=
 =?iso-8859-1?Q?TGg01DLG/3YznMnHcVDzN1JZir+cYPJXOi+lZuTrW+UYpIDn4bPbhNjkwM?=
 =?iso-8859-1?Q?WWpkGyNy/xt8VCCKXJHxKNQkq+pjhcnk0cl/+Km+TmPZot8QI3BUsGxnhj?=
 =?iso-8859-1?Q?QCAwAA3LZyKJ1v6xypk22zGjj4O8gJoAwUHWoo2/COe2FDpQBohCn+sk5S?=
 =?iso-8859-1?Q?W53MAPUXzu964qsKzAJVokn0PK2jP3nxRqPGlpeJylLmVdStzTPlGM8MTV?=
 =?iso-8859-1?Q?7vbYHOO1j0rQafXQMz53m4UO3RDDoH97opfo347znQUePR5KmqHwAMgJKA?=
 =?iso-8859-1?Q?sPpEgJWJ1zKJVdENKlRsvNzkBoo30UL6Z9QhCxXP4f9HOR+2dfqs/ZDnJ0?=
 =?iso-8859-1?Q?hTLpdd7XOzmAGPdOBYS6MXUOriC6YTr5DiDMvgd8RIALNuJ/RmslP0CzoE?=
 =?iso-8859-1?Q?ftVtIG6ugohg1MaUS9JFb+VthErMfOxqG7rvcQUsDJjyZdjiWpwWAW0iVq?=
 =?iso-8859-1?Q?QKxJ7O3EL7lvkxlGlkHF9gxiRVUA517lgmq+ep/wfHZc0fArowzVVaVoAI?=
 =?iso-8859-1?Q?7Gs3H+LQ+JWBHipFfR5IngL117lyxmrjt2UIHFrROsHX7cj0AWWYwmd8h+?=
 =?iso-8859-1?Q?0FsRmg5EEySrDsvDGEaPqpaF+sovzMQS54v3Z1tIamEUckLVkOOmq7NuKn?=
 =?iso-8859-1?Q?nRpW9zLwvEXzv04q+6k4Q6+rEGytxU0wfMhVIEOX4WUrKdrqjFvIjzZCwk?=
 =?iso-8859-1?Q?VBkLnrnhqzDrsE7zsFbAsSIFvhzXnIv/7vG0ub1gjSFIIFp1QcjxeLo5LV?=
 =?iso-8859-1?Q?2kBIL07UtohKEn0rwhuH/z8qustNe7Ij7+M7Q7D/f19TSWQemGY+ULUjuV?=
 =?iso-8859-1?Q?Ry0Uw0AopeORvj3R0B3xXDXBgRT197SBBVEBbBm9cJwpn9cALTAX/V1cNS?=
 =?iso-8859-1?Q?ofl72Dd8AAbODewgwU8NOiBdc3731fxPLQHYm6OoIX1r+jWt7rklTc1L+Q?=
 =?iso-8859-1?Q?uATxAEUL7hhUKXH0gKUMLCkM8ZYuks76rgq/E2iUuzehy26CY0nfaDt/OA?=
 =?iso-8859-1?Q?TjDuL2IMXWCuQy+mHihjJhQSdcteOwaDhxUq5MUTWPxFoET0Ina0tVXDYU?=
 =?iso-8859-1?Q?aCYVAfmqeM4jxnGNiNz9tbFhDqcY3yBGRg9s8c1tVbZheteLA520ksWKbb?=
 =?iso-8859-1?Q?2aA0CsBJlP03mWsZG1p4BsyLB3NQtAFps7Wm0ZCJozD0hkUB+iRHzCbXFz?=
 =?iso-8859-1?Q?/LEdgRklTw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 4xR+z3swWIMUdhej3W3/448b5eLe0QQuKFq1Hk+WR02t4+8MtpC4rtnClJO7TpA+mRzR6QLTLQGGiONFM6TVjY3ZDWbyDPJPwe5jVM7QVdyPgCS9A9IYSInJyFM4LPP4wq1irwb+zI/SzVRxn5ztFrFr/x4ka1znQDl36CgyQyLq6teB18kwgqUHjeWCgCSR/WIDVPLrZzejTRuriSSff3blf7kT/Ympebl5KcOtypIKJYdxm5o58js9cs/wL+qMEs9QezTrV1fvooRcmS9AOaa4Q5Mkngszav7ta2KH7y1vRNW4JfrFszrYUMvrap5YhScKi7YkeawcI/l11QAFPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f198c0f-b282-4e74-578d-08df08764e83
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:13:52.8817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31umZG5M+4Cni5I4u9xQGRSJ7Vx0smZbQPWOQ5iV5PAjq6V1rmlpSBFUbBPLk6FptC1L07CbQp+1jOa/l5Sv5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5007
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

On Tue, Sep 01, 2026 at 10:49:28PM +0530, Nilawar, Badal wrote:
> 
> On 27-08-2026 17:58, Rodrigo Vivi wrote:
> > On Thu, Aug 27, 2026 at 04:25:48PM +0530, Aravind Iddamsetty wrote:
> > > On 27-08-2026 02:30, Rodrigo Vivi wrote:
> > > > On Tue, Aug 25, 2026 at 08:20:36PM +0530, Nilawar, Badal wrote:
> > > > > On 25-08-2026 19:41, Riana Tauro wrote:
> > > > > > SAF MHB errors are collected and classifed under Fabric error component
> > > > > > by System controller. For SAF_MHB errors, if the cause is data
> > > > > > payload parity error then log and return.
> > > > > > 
> > > > > > For all other errors and causes, request a Secondary Bus Reset (SBR)
> > > > > > 
> > > > > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/xe/xe_ras.c       | 20 ++++++++++++++++++++
> > > > > >    drivers/gpu/drm/xe/xe_ras_types.h |  4 ++++
> > > > > >    2 files changed, 24 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > > > > > index d25d25f77531..586dc28a638a 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_ras.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > > > > > @@ -394,6 +394,23 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
> > > > > >    	return XE_RAS_RECOVERY_ACTION_RECOVERED;
> > > > > >    }
> > > > > > +static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
> > > > > > +{
> > > > > > +	struct xe_ras_error_product *product = &arr->counter.product;
> > > > > > +	struct xe_ras_ieh_error *info = (void *)arr->details;
> > > > > > +
> > > > > > +	if ((info->global_error_status & XE_RAS_FAB_IEH_SAF_MHB) &&
> > > > > > +	    product->cause.cause == XE_RAS_FAB_CAUSE_PAYLOAD) {
> > > > > > +		xe_log_comp_recoverable(xe, FABRIC, &arr->counter, sizeof(arr->counter),
> > > > > > +					"SAF MHB error detected\n");
> > > > > > +		return XE_RAS_RECOVERY_ACTION_RECOVERED;
> > > > > > +	}
> > > > > > +
> > > > > > +	xe_log_comp_fatal(xe, FABRIC, &arr->counter, sizeof(arr->counter),
> > > > > > +			  "Other errors detected\n");
> > > > > I think this also should go under recoverable.
> > > > The point is that at this moment in time we don't know if the reset will
> > > > indeed be able to recover the device.
> > > I do not think it is right to say that, for any error we sure for know
> > > what is the recovery needed. The respective error handler shall perform
> > > that needed recovery action and anything that is recoverable by a driver
> > > action is to be categorized under RECOVERABLE CPER severity.
> > > 
> > > The case where driver can't recover the device by itself falls into
> > > FATAL case. Eg: probe failure or wedged cases.
> > Fair enough. Riana, could you please adjust both patches?
> > And while at it, please add a note about this in the documentation.
> 
> In addition, rather than hardcoding xe_log_comp_recoverable(), we should
> preserve and utilize the severity reported by firmware:
> 
> static u8 ras_sev_to_cper_sev(u8 ras_sev)
> {
>         switch (ras_sev) {
>         case XE_RAS_SEV_CORRECTABLE:
>                 return CPER_SEV_CORRECTED;
>         case XE_RAS_SEV_UNCORRECTABLE:
>                 return CPER_SEV_RECOVERABLE;
>         case XE_RAS_SEV_INFORMATIONAL:
>                 return CPER_SEV_INFORMATIONAL;
>         default:
>                 return CPER_SEV_RECOVERABLE;
>         }
> }
> 
> Then use
> 
> xe_log_comp(xe, ras_sev_to_cper_sev(severity), FABRIC, &arr->counter,
> sizeof(arr->counter), "Other errors detected\n");
> 
> This keeps the CPER severity aligned with the severity classified by
> firmware while still treating firmware-reported un-correctable errors as
> CPER recoverable.

I like this idea very much! if FW reports let's just map and propagate that.

> 
> Thanks,
> Badal
> 
> > 
> > Thanks,
> > Rodrigo.
> > 
> > > Thanks,
> > > Aravind.
> > > > It is a moment where we are handling a global uncorrectable (fatal) error
> > > > and we will return the reset action in a hope that the PCI subsystem will
> > > > be able to perform an SBR to save the day and we start everything clean
> > > > after that.
> > > > 
> > > > So, I believe this approach is correct here.
> > > > 
> > > > Aravind, thoughts?
> > > > 
> > > > > Thanks,
> > > > > Badal
> > > > > 
> > > > > > +	return XE_RAS_RECOVERY_ACTION_RESET;
> > > > > > +}
> > > > > > +
> > > > > >    void xe_ras_counter_threshold_crossed(struct xe_device *xe,
> > > > > >    				      struct xe_sysctrl_event_response *response)
> > > > > >    {
> > > > > > @@ -555,6 +572,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
> > > > > >    			case XE_RAS_COMP_DEVICE_MEMORY:
> > > > > >    				action = handle_device_memory_errors(xe, arr);
> > > > > >    				break;
> > > > > > +			case XE_RAS_COMP_FABRIC:
> > > > > > +				action = handle_fabric_errors(xe, arr);
> > > > > > +				break;
> > > > > >    			default:
> > > > > >    				/* For any other component, reset */
> > > > > >    				action = XE_RAS_RECOVERY_ACTION_RESET;
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> > > > > > index 99b2466e2062..73517fd0d415 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_ras_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> > > > > > @@ -12,6 +12,10 @@
> > > > > >    #define XE_RAS_NUM_ERROR_ARR			3
> > > > > >    /* Error bits in IEH global error status register */
> > > > > >    #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
> > > > > > +/* Bits 16-31 represent individual SAF MHB unit */
> > > > > > +#define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
> > > > Riana, please share where I can check to help reviewing these bits.
> > > > 
> > > > Thanks,
> > > > Rodrigo.
> > > > 
> > > > > > +/* Fabric Data payload parity errors */
> > > > > > +#define XE_RAS_FAB_CAUSE_PAYLOAD		BIT(2)
> > > > > >    /* Device memory error categories */
> > > > > >    #define XE_RAS_MEMORY_DB_ECC			BIT(1)
> > > > > >    #define XE_RAS_MEMORY_POISON			BIT(2)

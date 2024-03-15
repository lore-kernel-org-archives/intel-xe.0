Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E31C54E5D
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 02:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE3C10E478;
	Fri, 15 Mar 2024 02:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZFkSr3r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9E710E673
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 02:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710470909; x=1742006909;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F4j8eR2UiWyp7NfF5GtyJi8gMR2N3antfYU6G2qQ+SQ=;
 b=lZFkSr3rQncljwKDrwLUimfW0Duj/AgrCylxmf0Bu6i2W0Ksa4AeUCsg
 TDh+zFeTzrMaGF4BufGxHJWPxZyjsou01es80UO7hIPH9YllfpCArmVZL
 wbBDzfasHU8Jp+7GM/sVXSR5jzESQaemg5KmCYCaWzVEhUrkUiGRUYTgS
 cxuqwbCM1Eaq0Ao4GTHNKCqkqEuBJ7+KvQKXpb1rnp14q+Veh8/bqAIWY
 tXrZm2x++IrhR6gs1HeiILtyeAzZ0MZV/xJ8u4+PQJV4ysj1KZBy59sqS
 k6XXL888PPyRXbMspDxdTwMhxpY5ujXl8FEdEFuzb28HdFpg+Rrth8ZI/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5528875"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5528875"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 19:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="12418338"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 19:48:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 19:48:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 19:48:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 19:48:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 19:48:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCiE/rb3z7rOrZXJ5ANFuV/zBh1qrArY5cRbC2fH3N7ju2KYu1BV1Eb/+tiQx5dF9miBA2NHf9UtGmQ9D6PKzAJ7ZFwlDq5AAxLrEepLapDWqTS1cwqbfwfUzFOX+ymJCSX+sDkNt5e9dYc+z39sCiwHqoCtpBQFi+c2UiPKxhqDtspB+6qeW0MiEW1KwLPzuoBhC67tWYzijrdkt1JmJbs2D+IV4zjL7zbP30xy73Aa4oq8Vv6YsuNl1BLXL1nIyqmlyYBmZ42V4b4+qLvk4RopRaWEXU5VqO+3YvDcG/+dXDsqA8hUAAGlUgKigaZjozZ4iGoTe+shhx2MFClkGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5n6tu74etxhRc8l+F7x1ExjD+I438zdbZLhk9tsTr8=;
 b=n3xPFQLMztFzZlaKmrgjUjf11hxTLp3b6W0xU0Eydj3CqLYBBmp28LQF5nBkX+9wjD7Vgen6XvsBTlzykEMsdB/wU4C445qDWs3HIL+aNtiTXKwJRFVcu1LuWTYBIECU8bVk6gvCMyHavSE0Jc/e0nTXm/jheA4+r9gJI8oA0w+bMsCMpcZSvSE1kIZkI2KgId9aWXx9ClywqzCS6LOepUPuiiNKRMXEa8HLrnzcLoz800F6a2IWsvhMPMdKCfL8ZmXU671HFvqm9VLS0H1db9mY1ufFPP9cy8T1sztQ6cioIpWKuxwhI/YqZvvPvFDfxd/AZXfq1NZJRwcpvWBVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 02:48:17 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Fri, 15 Mar 2024
 02:48:17 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "Welty, Brian" <brian.welty@intel.com>, "Ghimiray, Himal
 Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 2/5] drm/xe: Helper to get memory region from tile
Thread-Topic: [PATCH 2/5] drm/xe: Helper to get memory region from tile
Thread-Index: AQHadb8VdD9G12jg3EWq2rPwn6ixeLE3gvqAgACX0TA=
Date: Fri, 15 Mar 2024 02:48:17 +0000
Message-ID: <SA1PR11MB699173231ECADDF59AEACE7292282@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-3-oak.zeng@intel.com>
 <ZfM3cfawyb+D6bd5@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZfM3cfawyb+D6bd5@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CY5PR11MB6487:EE_
x-ms-office365-filtering-correlation-id: 4e420eda-db2e-4897-087d-08dc449a5e3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pDw+e3A1zlfxsPGB+LUU+PLMn9LNLAyUGCG/RYF9kj4ayIyjtefwBjBZtNXRS4bglqvo11XcMliwruPfKfqYNPzsJvPRiAT9rvCwM1asBwTb5gb2iyIvUbxx6IRMAoE3YHbRdR4qJ5vZauVpCsPxi1bEuFyQ6afSTFNGzoeOHMivMUc7TmE75QFArmLxhul5U59ZRwIlsi3i2w0QS1livhV/lvUHCwa53WdBVnN7SkSef+uju7dy3U7uOJ2tSAAsT7t7Nea0rjrL2tjfaHV6ZxP7TJthxak70H6rJG9bYd2o4yG19l7CkNT3WiHZhgy0D3RTmz1U815hcFJOmOLuA6Fn4ZVuWoBvyEfDLwkeGJ1sWACVV4uTcD3fleAXjLsW9NKZEnLuXmluFByD9pQFoefQ9I7OOjddZHw5NPJrkw/a9pYu5hQ6P5VIF+gaQRNCSD59Yoqw3LVRgLSfggeo9ULx/VkDxVapSK/+Tlm3hypLnbni6yIsiuU+/1nQcjV9lq1OGA0GExKAsecPrYcPRu31BDzkmEMxFDjOqz27Q801TMa3Y+Pvolal65UrJJRKAPpYZBHgJ+4zvgo9lMMVs/esHYrAz32m4S7Usc4hqp3WfzPPBapVVS+skrHqtGkveZTFblp4ZrOVoIYa8EXcbGc1xzBRsDNgNAJN7ls6yTNmIJEgX5eg9FUWtKiKMEEZY41P371dN9Ke1DPg6Mgu2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TCFFSfM55xllkbkK55zgNFk2P9ZAb/DsLebfhwCogjrlOyfoh/T+ft3DQzeh?=
 =?us-ascii?Q?Jo6bBZxeMle8fUaqSxSSEOXklCicB0UzP/fHPNaa+OmzYj9Nuo7YHmf0kbG9?=
 =?us-ascii?Q?sHcn3EWU34mjCafFoZydRBxPH3AUDYAFuAVlyL89VIQOZ/J3AwTBwu1Tedho?=
 =?us-ascii?Q?kjem4MZGF5K0bUsH5kZfBCrrHJi/daSbsrZGj2Ur6ay7N07TddeHmEzsFxge?=
 =?us-ascii?Q?V9FflZ3bsiP5AOK5VMg3ljFwRfj6VxrFmhVeu2AJanQ6N65hLGfyv0scJumw?=
 =?us-ascii?Q?iLWStTSFPmOY0I3Iyq0oFPFvCzCYiEvzZ190MbOBc7/SvOIlTsHR/ztmOhHC?=
 =?us-ascii?Q?RZNQ7GNcKx74dhWMyFgjv0VWbXKyG5nVVOQReE/Lli09rNdYi8Pg2Ik+b5C6?=
 =?us-ascii?Q?TSEDwOkqfWDsnQOkzfT0XwN0QBmpHLlEXb5MIR7o0jR3l+e/WtxKU8ggQ98E?=
 =?us-ascii?Q?lhK18h95VnOFZZOPZgS8Pt9PDlzjuLDsyy1seSUe9G1WC79vplbfvsFewLXB?=
 =?us-ascii?Q?7MulD+acRxMUVDXfTUK5C2O2zAaDDetjA959dScHIcbhp0m13fZTiJrBaFC2?=
 =?us-ascii?Q?yeaQhrKpCLYhMq53SALQmK4JCLI8QKPZMLxcCGUjEyd2hPwLvZqCtGyiZxic?=
 =?us-ascii?Q?gV1650Oea9JsrMUfnuHI0I3xEVPsz6TnBaYYWmedbqxpjTgjl924RQhpbW3X?=
 =?us-ascii?Q?5cNFTgnCWCsJxAGQGXfbcD+07XyjzJIvtxKRAB+Up9T/qV+IQ3uAzwfAyWdt?=
 =?us-ascii?Q?Y5ATdxjzxHhUCvSumgnNFueiitXBDC+NKLZkXXQmpLeLvz83HGZMTMevQsnJ?=
 =?us-ascii?Q?6OkJnVAD2cj6PHDyOyR83pS6KJHY0lQPgwMOcmEADAvNimtRq1Zghzk4rHat?=
 =?us-ascii?Q?8RiOyUMmA5JKA1G0atHLCWj8b71PgOnBTZlLZsbzNTbw+v7Of8VHZ4lETFRg?=
 =?us-ascii?Q?J1BoIv87E8Pgxwd43+CymTTKJFyTcoy/IJJw8aaRzEKELG3vOJHrY8qmbuuV?=
 =?us-ascii?Q?UeLiqkLbwbeJHttdB0hBvRxqCI1o/4BTvv2Ped9CHpobpfPumIBMeEV3aPfe?=
 =?us-ascii?Q?aqfq5PU0djoLQzYvtfDZSqLOCjvMK1sULNZ7JYt3TP6ACl5KS77aDZHFdw38?=
 =?us-ascii?Q?XIrvaXSvRS2z2Cl9x6xwkwa/h5jWTfkMLt3c49BKpLrRUBID8mQ/FZlSCjV4?=
 =?us-ascii?Q?e0udo68KoxozxVJvTqMiUa1O6bCzXkTnGg932q8b+RAKBNQr5q8RQbV4tmMW?=
 =?us-ascii?Q?sLawgpTH4kY7g5WeZt7b4I2q0IXgfG4fi3Eaw2V76WdptbfqJ4XCPlmlpadr?=
 =?us-ascii?Q?Sj9D0NQtKdEiIbjpasf2V1F1n0xidvOmv3666TKzG7VkrpShmNI0U6j6U5VM?=
 =?us-ascii?Q?OhQjO4uNW0KAUnzILlH7bFQIhiITuCfKYJep8VNEUbCGgHJ/iUzaqn1WIw51?=
 =?us-ascii?Q?JPnTJv38TSw0U4M8evnEBsZVW/XddtH1ovTnUgVdjOxrOnNZ2xgY0eg/ECs2?=
 =?us-ascii?Q?nXL/M2CuTlDaNpbA6aZuuHo18La/5bBKV/bhMf7RCBY1g3bJG1LrekhNSSdT?=
 =?us-ascii?Q?QlydHrLTAYIpJER1uQ0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e420eda-db2e-4897-087d-08dc449a5e3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 02:48:17.6317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o0LI61cbAgo+/v+VGXtddm7yNsDcixPaeAKeZFfC8M6qLRG0PLiBJ6jIwD/a6yRZMykh9Tk0NgIrwASx+8pk5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
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



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Thursday, March 14, 2024 1:44 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> <brian.welty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH 2/5] drm/xe: Helper to get memory region from tile
>=20
> On Wed, Mar 13, 2024 at 11:35:50PM -0400, Oak Zeng wrote:
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
>=20
> Missed this. Need a commit message. Also this looks to be unused in this =
series.

Yes... I accidently picked wrong patch. Will drop this one and pick up the =
correct one.

Oak
>=20
> Matt
>=20
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> > index f27c3bee8ce7..bbea40b57e84 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -571,4 +571,9 @@ struct xe_file {
> >  	struct xe_drm_client *client;
> >  };
> >
> > +static inline struct xe_tile *mem_region_to_tile(struct xe_mem_region =
*mr)
> > +{
> > +	return container_of(mr, struct xe_tile, mem.vram);
> > +}
> > +
> >  #endif
> > --
> > 2.26.3
> >

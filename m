Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADAFFED2DD
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 07:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A320810E1B1;
	Thu, 12 Mar 2026 07:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AioFiwRa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2C810E1B1
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 07:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773299896; x=1804835896;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kvAlzzV4qZzdRaMyXkl9CSsfRvnNaEtjCA9htczIKxc=;
 b=AioFiwRacsIGk0HZL8tgVzGBpee1JlEUVZ7L7t2AKz/WQiIcd/HU8aqo
 ZPAEk9kmQDEcNU+Z3ZBam2WvqXEVaOOE0B/1wUUJgNthsdgkEH8KVX5nN
 T+z96Lk2b2H2dpt9WRUTYV41C7PXSxUc0P3LlQkOuOgLO1pk52cxiEOQi
 kO0Rv6EAC2/p07XfyXxWEWim9WaqrvssnXmIk9WmV3nhhC2JBkREr3wQg
 mGJx+IpI+Ig7Yjm1ZuDsYqCXXsw5UWurGURuJf5B1TsI4L/Qo+Q96bZTK
 iIGcccVuPyuHBb9jY2PdUkIh2cB1BJexJ6sVxmIFPUVM8Hea8N8Ta7a/1 A==;
X-CSE-ConnectionGUID: iExX8ZSNQkWPS0TBibUeHQ==
X-CSE-MsgGUID: yP6AJbUjSl2WegbyWOVxAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74349894"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74349894"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 00:18:15 -0700
X-CSE-ConnectionGUID: sp+f8LIGQj2mvLuYzEN+nA==
X-CSE-MsgGUID: X2dPvybeRZWOSYpJRdfKwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="225430276"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 00:18:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 00:17:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 00:17:56 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 00:17:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbHs7KkNKD4IM8WjBEbTOsngfxQ7lPlFl4dk9V67y7DaZxkxaDNx3ia+zWs+5ScHZmwfrx0dTp4U4tjvkAL1VOfSVJ2740rAqFEJyn2B1rpwpW8Sm0RIiouKBFJvPvHab0xscq3fK2SoX/x9vTd/ps0pW8qg7kznBta4QeXlaydZyuX7gOEnc01A6b6ZC7p06q/GwUR3quKblkWrOZChxxU1lZJoEDuqpNSdkUW1rwSqBDVYWdguY6gWScziQqrz9i10zQNzMYYLw5i0qhV30Me1j+QDZOv/BJjhq/uyftnvlG3IDP/7FnBQMVURIFeiZvtvLEWEDRWdd7J9pepH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvAlzzV4qZzdRaMyXkl9CSsfRvnNaEtjCA9htczIKxc=;
 b=CMr3Rid5abzZL49HoSNdbyd/ktC5E77UUp/s47/GXFkGRAgMyIMJByKbjNbNC6S5QlYGIcenvEodvQv2xTEbuUDjZk+lJNWsKvbKck34oS6IqQWLGhNL0B6Kxb0S+Dvefp1MmxHltILHuKsCrLsLNoXJym69A54NHZY9/2brC4XpPSXgvL6V98+wcs39Bg+KO1yqFWm/24JxxHHSrdqyikG+63pNkj+OUORZG6+2lPgyO2a4jxarWPxsdeMXB3nSmalRdT6bIDp/P88Hb6nlJKy0+7KuRZAQ/WmHNBob22xB2ELb5rMCF1uOlGctLFOarKM15GOUcEMGNkLuw8jerw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6271.namprd11.prod.outlook.com (2603:10b6:8:95::6) by
 DS0PR11MB7410.namprd11.prod.outlook.com (2603:10b6:8:151::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.3; Thu, 12 Mar 2026 07:17:22 +0000
Received: from DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3d4e:a313:cb21:144b]) by DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3d4e:a313:cb21:144b%4]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 07:17:22 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH v7 1/3] drm/xe: add VM_BIND DECOMPRESS uapi flag
Thread-Topic: [PATCH v7 1/3] drm/xe: add VM_BIND DECOMPRESS uapi flag
Thread-Index: AQHcq88zDRZNfwMrFEShZIQyZ1YyabWqiN4Q
Date: Thu, 12 Mar 2026 07:17:21 +0000
Message-ID: <DS7PR11MB6271D5C10500B76A3731F5C5E744A@DS7PR11MB6271.namprd11.prod.outlook.com>
References: <20260304123758.3050386-5-nitin.r.gote@intel.com>
 <20260304123758.3050386-6-nitin.r.gote@intel.com>
In-Reply-To: <20260304123758.3050386-6-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6271:EE_|DS0PR11MB7410:EE_
x-ms-office365-filtering-correlation-id: d13d1567-52c5-4a33-c874-08de80076758
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: OwOp1f7hF/sTJRKKO+xq2L/o+8E28xDgEWHAarny2rgU0rFQeadZqUxmdKIb+IbwX37DdkajX8Iu2T2LjzIQQLADK9pWKoPqnjmvVxoykFZp17mTGwbSu21nwSprrFK54Rh0+DWe+VgfZqxAQ4f90kCSS1jneoiNNLxZhqm8UQq/InBpnXyopz5+d2uI4YQBq6wg1XuCjy9u9+Wlj5/S5hibizvgs/+ThO9G/EXirhipvoIRZvHejIMkN4zsFV2fp6Yw4CuJMO/49DH3IkDnCJ3Xq7Q/gQ7A/j+kgYuMirwTPAgaB3Tvf8QrN27MWJ49fL8VwEOO1NZYAHSV3rkV9bd/EEi+AynaImjYFkaZShqp9SuYup3ev2v2ni0NwqTL4agmKg3RLrKCQiqXeKFgaF5/44v7uBjWCZxDDGrZVVR9ik3DQ5HTSY4so17++hYm6kIRGiYIWJTxt4ddZOBMkdjN6Iz9Jnmn+lpNorcnOZ2erfK6IBJL6sdUfzO8vVBM552DyZaVjMJlqsilNhThcGmYM5PH3pRwbyVD9vfmpmBV++z75157n3kkH+2j66rEFsw/d0brXiXf9NDMeJVGQrBLHZbMmHihe7aqc6P4PsD8u7vqb1rzjIlI5rVDZ3g7Fo12JW9b9r4yroe1HQ2gSpNQKngzi9hGvj1vTcHPjnpgw2yeDqyjDpi6L6S3ek2vHWZ/GWf0m4cieZI7LCxf/Coe41R7IgS3JjbV1T9ixTU6dGz+gAkk33eSAsuuDzTqk2FipPdNHkTIt18EOyf8AL6VX2GTOAJx5Fd20UGzpNs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MEsG4f86IaWu8YsDutw/X18KTSzVFG0/OjxvODf4iLu6m5OCh/lhPLGdwGKb?=
 =?us-ascii?Q?9P3Y/rbJ6UFVgAGWWT5R3APzf3HGPTOpB0DC+CSG/vBPwASGOiyJ0suivGC5?=
 =?us-ascii?Q?z7Kigeb9S4xZEwF62IrsSXW+DD6QGLO9c2XKDf2sGl2g5ApoBY+mIy4rPrU3?=
 =?us-ascii?Q?EiFDg/sBPNP7YOmqP5Yiw5+hbhpFfk8M4YncKMs6by5XhBkheHE07smsRaf+?=
 =?us-ascii?Q?EO9CTyUPtJG6PS4swzerqPJ7W1KNjNSbTK1/n93bGurtB3TCRXgHKPNLdKLA?=
 =?us-ascii?Q?NMVhT34Rzi+xiq0rY56y4Ad+U5g2DJ5FgdWBkfYQJOlUWyR8lIzzglojcBSe?=
 =?us-ascii?Q?0vLSOLHijaVfCmCEnC/HNMp4vPjVK0fwi2T053OQvOLITdFAnCcnhGzjW2XU?=
 =?us-ascii?Q?qHHEDip30zSwhwbTs9Hzo5mQi+Uz4PHUsnF5VIrbWPiLfwhuYPtdtyNMI1JF?=
 =?us-ascii?Q?AsZEnCUhE2UoqOy8YJbT81VLVD8a7SD6Mi51J0T1QfiPIRRNZSCMXuHBPEwp?=
 =?us-ascii?Q?Iw7R5mPeSRWNE/yi3UV+kdvK/eyWrkvobIlvYzCA6inp3bmHwc+k73OH+6EK?=
 =?us-ascii?Q?3vnG6rR6+PNx5EwY7+nan19VNJqDhFYu22LpdwnGDE1R30xugc8aeIMLz3MH?=
 =?us-ascii?Q?kNJHMbvKOVs54tsssA+euI9DEAARDe1l8J4Dui9knFZZIXo8vZdrcANa8O4B?=
 =?us-ascii?Q?MtBvbqiPaiT6fehZJKiKNjDvNstRfpiHFloDCTRboHcZJBbZak2J27HyVjVy?=
 =?us-ascii?Q?79OHb6/SRGn8LHqovQXG63ddVWMaePEB4bMzIyv7Ni8wWkGQ0buvTutNX4tW?=
 =?us-ascii?Q?UKjA19+xlQHpWDWNFmkMGok3JEIYT5uyhQtvJYXP6hpxIUosI1hCYoUDDz4Q?=
 =?us-ascii?Q?wJTcw+ez66Jy/mp36Y3HCiwSGFHV0I9bzwFQS6+2tWu0LA0EdsJOpdbUyMUy?=
 =?us-ascii?Q?uRky6it9PQ0U35/YqvhR7tSWEMTbqSKutzDX64kklL6JGZ3yYKmU46XtHU2V?=
 =?us-ascii?Q?tUyv3VjkBg7ppmE6/zy/jl6BAmfndcr6GgzkIP4c7A6WB/VkdTtkN4VOpHse?=
 =?us-ascii?Q?hcIlf9kboaDnwVltqe19Lg18PC5XKEf1Jm1ci6BO3E84ojVs+L5/8ACs1L7r?=
 =?us-ascii?Q?ot0AcfgwNyaSyEpSEPjvXBKklGJsLPIu7oegZjQxBOShUIeROTgcyeMsgDSE?=
 =?us-ascii?Q?1P/Za8gF0oro6lOMyv13fHR66uuACqi3hoOAd6LL2aTPaxLDLyb60Lx533L3?=
 =?us-ascii?Q?VceoWZFLUbGD3AJoP89nP6NSuo7GyKiPk2av4t9guOjqTsqgMqYsvNRrs2AV?=
 =?us-ascii?Q?8xWHtk4cKpgD7ArYQ+5kZNcC5F1nXUtDi0oKGzvq+K1a4amyZSOJSrC8bsY4?=
 =?us-ascii?Q?MqJ6prRZFgCGz02PkG6N/3IuCJiS+ZbsCSoqm8XK9hokj2Tq8AsxEe0kQVAJ?=
 =?us-ascii?Q?1Q3ep7JmUxca9akEOZCQfg4Ze5xb1NvN4k+ku386cVAt3dPCerucoxJjgGfy?=
 =?us-ascii?Q?/aSezoeqVobXskOsypb1nAGNQjeoY9K0Hep9ycY8e5+nCKy9mMCHqhDFiV3y?=
 =?us-ascii?Q?1jYC61PmBgtB+8+eVBiHE008JEhd9ByA6Dpxp/GObrXzquQGQwIaR/SZbULv?=
 =?us-ascii?Q?2jQBruSgW5gYvp10zP/QI3wrEWg9LQfo2/IhZZcxuBoSyJJk+K98BtW9pwen?=
 =?us-ascii?Q?r/1dZr5TmHqJHt9MpJMlszymQjXFhMhU3szVILWqivMo0dwdeMDoukLAmPll?=
 =?us-ascii?Q?4QfuqlqJJg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: f5h2ogtrsFglK5VT06JQiX0+WUIXzXPDGDulmbnX0k0Z8/hCWzZ5FypRcYn2AGj/epOyaW1sJhOZYitWWiNB1F/g16TatUezvh4vyHWHJlp+4ggmTO70475xVubekcKP98YGBs0228aLvGZCVqdxyQ/qXloMZEljTzXvVGibcWjE6iqGeenZKG9M2w5YtCuBOEoTHpuB4OyOKbLw08GJIy7CckhTI7XSY+Z5he0sKa3SD9O3klHw+eT7/OH5eppEFbv7bp5ijoWHMeBMH//xiCnZ/DsPDYBXbCmCOM+jzaoVi+TE5OAdThucdZNnD3bYWoKH7tvSGid9fIRhJSmLCA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13d1567-52c5-4a33-c874-08de80076758
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 07:17:21.9983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +haEw3vNeCZ7pKzwd7ngXziUIMoqh57Os0gmP6orR1FxGQyAzS7pxjdFjy/u/BvXzIBZWbbbTt3TivHosDcabw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7410
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

Acked-by: Michal Mrozek <michal.mrozek@intel.com>

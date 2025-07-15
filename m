Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9180C83F22
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 19:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDB210E64A;
	Tue, 15 Jul 2025 19:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V56AvCfX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AE710E64B
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 19:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752607874; x=1784143874;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SEubbV/QIi0x0dcEhLPLI5Ukp2GDINJiozC4BdeuDTc=;
 b=V56AvCfXh8KeR4dpDCuJawQNzozNuVBeJfi9ZSAcbBbnvjyZ80pztyQp
 flc7xg+0S4nJqjYLu7UmFfkfvbaQrvZ4dYyggGMbjGcfMDk+j+G9uiuQ+
 Lyw24ro+k1YHxwzYYqWQP7AdGBf31ORU/MmuECrfEm3F7CDES6w81Nofw
 xbfivObJ/sPzQBg+CdBKdaakWmzzmsz35sIbJbWQ2u+JFkVcHhRG02cCi
 cDzTHrKs8KL2WtMzN7lmI8bEiFM9pLlAnVQ4O+4aBP4g/CJFoYnjxMXeD
 ChLtU3MXO6e84JqekGoxFB5k0cwQk3PSv7FcXOXGaC0Tpuz6QRYKoPVLi Q==;
X-CSE-ConnectionGUID: 2aCwbEd7QDiQZZRkGhEpTQ==
X-CSE-MsgGUID: 05jo5sEqQhO8cdfo/VQnww==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54987718"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="54987718"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 12:31:02 -0700
X-CSE-ConnectionGUID: naSo1jyES/eJJFAW7YXOxA==
X-CSE-MsgGUID: MLlnQi/eQjiA52536+SzQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="161331599"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 12:31:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 12:30:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 12:30:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.45)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 15 Jul 2025 12:30:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCIvgseGkzh4oxRwTEeSDLa59C6dc8wK8Nhnw86pb1BEBNEE8PdghA9jSevncsvbHpwyPgk9fxRT+c2W4eoPalrDOBpSu+UL4xTUs3wZoRzNKGsIUJRBQEutbO31MH2WoO3PRz7HehNngX8Xm+JJEyQ/V/byWl+M45NOthdM/tbDrWklC1O4T8PI0/qJfOIEH+1RswF34FbebchNtrCXtt8IkJLr51sD2W7Arjmg9hdeGC/SD0wVytUDtL4VrNYht3nkVBG2fjvnAeXn37utXVYhRI6b5Mpmj9lRN7C0hCdZdXBiZ7lBaww2k2RWQjmlBBHUsTWZhVeOjjB2VQCaCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FZwh+rf3QilhsNyDH5Ky4JzdF/X1R9bwInWwJc6luY=;
 b=Y+dkr7F7yCoC1ql+lhNVcv/SQkt2VzQsot5xEGT7q3LrUeUn0NoZhRMO3Daw8I8wwvWHe4WdnGHTxFOIWzCvPmXblXOgfPTOk+O51FWscPCquxJBmurneIybpbs8zrk8lL1We1DwObq+gPXf4cD3mXvg6Y7nsjl/ENaTBqSb15WL5vWgQKDEpVyZNrasc+Jg7gYVl4RrbR++yRkGxi3rVoH//01J4XdDQXWhAhtLrEqD4H4Aezzp+LytA5F8U36UQ6scSXzOUINtEQ9msSCLh6o/LTrpZmeM9CGUEZN4fBnpajzphIdKQEWtISVgMUrQbTCo5e91+zzaKbhRkeRpcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7242.namprd11.prod.outlook.com (2603:10b6:930:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.27; Tue, 15 Jul
 2025 19:30:55 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8922.023; Tue, 15 Jul 2025
 19:30:55 +0000
Date: Tue, 15 Jul 2025 15:30:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Jadav, Raag" <raag.jadav@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>, 
 "Summers, Stuart" <stuart.summers@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v2] drm/xe: Don't fail probe on unsupported mailbox command
Message-ID: <aHasarUENIsby3D4@intel.com>
References: <20250714215503.2897748-1-raag.jadav@intel.com>
 <CH0PR11MB54446B46579C1A88384DE2DDE554A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54446B46579C1A88384DE2DDE554A@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bab5814-39eb-4038-2b2c-08ddc3d61dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9oX574wc2yhJQ1u+R/ViGOhdD5f06WUi2RF+X0IrhgrJLAdAKx+ozmWHLEvw?=
 =?us-ascii?Q?R1GAvm7poejqe9u+XL2bTmU1uOoJAt9ne48KujjY0Ppl6Aa7OvmzaSHRnqCT?=
 =?us-ascii?Q?VfKulx1jyO6XyYrXk/2HsSTIIXDDJcrPReiHnqZgeaS8OUWe/b3QZl4HNz57?=
 =?us-ascii?Q?StalooveJ6gNlLu0JppMVvCvZXVr1UfsIgHAGAk94LAUF8uw5mluI1/r7jKv?=
 =?us-ascii?Q?zl+oDpWu/QCkGaypN+KAoE0s/xzDtKy+26UJZa5DvMut7rYQfmNOpUzMOID9?=
 =?us-ascii?Q?aLW5jVPUgdQlBz8JjUTQb95jBtfq3x9AhuEuo/jxrGMQA4PHUrQ/5A25ryJx?=
 =?us-ascii?Q?EYlfj5rvyM/ds7nBsPNzLljOIszxvx6NWf2IeiI7huvGzWLduP7GD+5PxoUv?=
 =?us-ascii?Q?ODcQ7bhUmHJk6UXdO4HIFzVXTFj/Is0PP/vzqMiK/FiQU3JhMTrOusPs2o+n?=
 =?us-ascii?Q?YmFg9yqFNUUB6EFKkiKAyn8cRCFUe9SdqUQPP0CMppUUneB2wKYbHAkEHY2q?=
 =?us-ascii?Q?nCBeb94pVcVFPD8iwAw7O3jRerbapXp0evF0qeCq43CytdMVGMeqxX8xpdtC?=
 =?us-ascii?Q?NpfGHdMMqAcglhQ85o25Na+rI6e2JbQArlM3xpLeXMRv7zpYBdJv/S7EtKp1?=
 =?us-ascii?Q?A/8RT7cRQaIuAv/xtr0yd2K+B5IQWlh9m2Cv+xnbGCiMNchjXR0+SSeVuOoW?=
 =?us-ascii?Q?XZL+i2yUetAaH50LncFzkdYmECHRd/4f27Bh9YwjxoI1MOFOUl1yx7y1rOeX?=
 =?us-ascii?Q?qrC3ruDaS4uAaaT7IYVwjRLuTNUIvzvpfvEpFC9JzhJrDGZxT7GpXnhAN0z8?=
 =?us-ascii?Q?RN6MKPIj/rRxWFQdYXxJ9QMGv4auRcq7Hv2e1RsEWl3M4rY2sAV3YTDqceuN?=
 =?us-ascii?Q?jNcW1GFOO4iZVRJ2LdlK6CxnFGr9SF6+V9QQeA2bOHmxU+teFMqOOfXjUQ5l?=
 =?us-ascii?Q?y0yI0Stf0Ty5XeRon+jhI60pu0E5M+WIWeAQ5EmpJxR0m3H/hNmOYXgQetV4?=
 =?us-ascii?Q?oSDGu1aOl04zDdqRIGoc3vNl29imRoYC1ZUR0+ZhkB3XRxHQjYUvbCHHp1Ud?=
 =?us-ascii?Q?+9EO9VQEi1uG3GtDJJySXPhqWeHur6hnBus512D7uqjJMYMiZ2UKeFNfx0Eh?=
 =?us-ascii?Q?Bczqk7dWL/p5+zkTI02YJ6ZzKbGAqK9+nl4Ecs33D9wLHNyfT5R7fD6bhvJQ?=
 =?us-ascii?Q?AEHiyLllLjB6AherI5XquxcDoOVsb3ZP/l6pZjnLo+1xNtTj6Re5+RqvqP6o?=
 =?us-ascii?Q?4Kw4obbqAVdi4YBr1IlM67Gmq/fv2gpI2xUBfJ6H/nefM3sNmema0R8FbVPZ?=
 =?us-ascii?Q?e9UXxJ9uUAB5uloh40GiLJPAT6NUdNItSRzHaFCKSquIiOzx+pxQKuEg2QDK?=
 =?us-ascii?Q?4qPNWZe3O8+p/Px42ccxQi5cXvpv1lq5wz0gZP67CN43B5cRo8VzsLm+bK/a?=
 =?us-ascii?Q?maTKpTSmo1s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tsoi+H6uK/B33LbbWz00yqOnicYGCMBjt92bs+RxDhZIsv1ljx5RhGZGKiTC?=
 =?us-ascii?Q?/eSdOOOWCDYTHxYfdyNRJrf0J4Urzun9WLHjEEZplAY4/hwpFyQL9XLMh89r?=
 =?us-ascii?Q?DJjfZ8hYAC/unkqpnXJTW+jXT2mhhRmzefrybKpHX72DY2qqC2GMP1NyJdFw?=
 =?us-ascii?Q?5uAJ6N8uFm0mBuEySmvtXs2MehtlzWkVOAuymb/fZzyi7xkEaqPBfDFrehMz?=
 =?us-ascii?Q?FTVmkGg9ZmtLCH2OmUyMep071D43wku2Hs/Mh1QxnCCsRw9Y5ZWoNLFwZQYW?=
 =?us-ascii?Q?vvcxWkhvGrkT32KTBVW9br3lljdh8nAjaYs+mvXhRazsZjj5GRnaqtZX1xYb?=
 =?us-ascii?Q?KPNIzM9R4Lc5GFMlbuOCfHz0bdY5mjF73Qdb5DifMcsc/xLNfmLuw4khbq6M?=
 =?us-ascii?Q?NBa50aj53NT0aMKVYzOyW3Y2DXHsHLdJq6ZwIxd/tlfFg050u7UsFYWlxKQS?=
 =?us-ascii?Q?5swJDAG1RdFeu4Nx80zg7WyK1sj85BXvmapZEZ3KFZ0CMTd83E0RI4d91DGy?=
 =?us-ascii?Q?HvU28u1WrlQRjh5lxRDbmEQqGk2bocl1wjwz87da3umF2bDMSCqKoxDO4asD?=
 =?us-ascii?Q?fzpOOoTEyM7n5ftCBJ3Cz5pBMH1riVd2WLQizqEyXZRCMkEm5rV+KfXZifj9?=
 =?us-ascii?Q?CgiGg8u3FAJ5PpqnNfqITFsCVTrusrW+bmcx6bHPvtc+g9IgWIpbZhzBz5zO?=
 =?us-ascii?Q?6M7PvL0g+89+N7H8fZehTWnwd2Xn4BmSegATgL1BbvttIQzc3Tynwj7qMOuW?=
 =?us-ascii?Q?2xOVGVZn/98lRmWKPX4o201gZbpLXcAByqPiU5I1NsIXXnYyZ7hNWomHkmYA?=
 =?us-ascii?Q?ESr+GSJpd8TfgJJMAKdpWaDOXdw3tPDAlQLsvg/51guRtrZaJ10bUORAcZdr?=
 =?us-ascii?Q?fbzZsX4dFZhZYL7RJnNEHYI4QWU3OIhdQn54fZYLzbV7ol2j8t2GN75r8gSV?=
 =?us-ascii?Q?2n2RElrvinKObZ0dL5uY3PyXbO7OUZUOFJSAwaFi/X01I7fgiyclDPUT7O0t?=
 =?us-ascii?Q?BHSXF/RKmWlkto1m59kUpUh6P6xUWLmzarjeLnz9dWaf9xXahxW75AGmsjP3?=
 =?us-ascii?Q?Xf2mvHEijm8Ng2kidiYCePlyRK0TE6h6a0FJPA/bmBX1Z+O5966WA8Is+KBz?=
 =?us-ascii?Q?SOUJ+eXRYs40lfbtZc8Dr7cG/zqCal76BOR5ifT1Ok8pqOsLIsznpq5/74mw?=
 =?us-ascii?Q?uzIXtnZyhnYSJnyN30EAUNxbh1AJxYZzCgM77S+Jq0ogQDX5GVZ1To72RZ5s?=
 =?us-ascii?Q?eHq/ua22HoVldtS8kmFFE1GInNC4HYsnVAZGJB/Aq5TDdc62STv58ZtPV+5M?=
 =?us-ascii?Q?Qmty4yR4wwDTDx3gmCkE4QDrfMBAsqoocZG7ME0YtCIEybYsz/cv5KQlkWc2?=
 =?us-ascii?Q?TBoOHTscQAwbslCRZFMoD7/ugUCquEZtJvf1Spc903fTn51ZlJpQMjR+AHU+?=
 =?us-ascii?Q?z52SWTqeWg4K7kVAnyzVs/qfLA2dE0ta9V4XBzAmsoWh7eapy5m7N9WlsHFY?=
 =?us-ascii?Q?uDsKwO0tcOt1SiwFb0I7ctkbwgZ0rtEn+dX+S44xKDFVzDiIjuEMOVnAidNT?=
 =?us-ascii?Q?FvrK5gap+cXKFElt0oMm1FIsRfIpJUJ+JXcNyuD8mOA13i/BDY/l3kcB4BU+?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bab5814-39eb-4038-2b2c-08ddc3d61dd8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 19:30:55.0499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ry9zgHFXO2IXa89Wo2FtAEfDwYZhmHoFYYT1pUMk+UCo5OV+5plmUCJvW00CyxRxPuSs9mEPw1wnbnZHSSLJPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7242
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

On Mon, Jul 14, 2025 at 06:02:55PM -0400, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Raag Jadav
> Sent: Monday, July 14, 2025 2:55 PM
> To: De Marchi, Lucas <lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com>; Summers, Stuart <stuart.summers@intel.com>; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Jadav, Raag <raag.jadav@intel.com>
> Subject: [PATCH v2] drm/xe: Don't fail probe on unsupported mailbox command
> > 
> > If the device is running older pcode firmware, it is possible that newer
> > mailbox commands are not supported by it. The sysfs attributes aren't
> > useful in that case, but we shouldn't fail driver probe because of it.
> > As of now, it is unknown if we can distinguish unsupported commands before
> > attempting them. But until we figure out a way to do that, fix the
> > regressions.
> > 
> > v2: Add debug message (Lucas)
> > 
> > Fixes: cdc36b66cd41 ("drm/xe: Expose fan control and voltage regulator version")
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > Tested-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_sysfs.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > index 8250aa4620ee..fd2ba0da02a2 100644
> > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > @@ -160,8 +160,13 @@ static int late_bind_create_files(struct device *dev)
> >  
> >  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> >  			    &cap, NULL);
> > -	if (ret)
> > +	if (ret) {
> > +		if (ret == -ENXIO) {
> > +			drm_dbg(&xe->drm, "Late binding not supported by firmware\n");
> > +			ret = 0;
> > +		}
> 
> If we're disarming the error value here, then do we need to 'goto out' after this,
> or can we reenter the standard execution path safely here?  I'm guessing we're
> branching unconditionally because we still detected a failure in this function that
> requires handling, and that we're just masking the report to prevent driver probe
> failures on boot as per the commit message description.
> 
> So, assuming there's a compelling reason we still need to branch here:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
> >  		goto out;

                ^ HERE

This code is 'go(ing)to out' right after the error disarming.

For a moment this comment scared me... I had pushed the patch, then I removed with
a force push to be able to look it another time.

There's nothing wrong with this patch, so I pushed it again to drm-xe-next.

(Well, by nothing wrong I mean... I would still prefer something to check the PCODE version
before in a way that the mb command is never submitted to start with, but, let's
live with this fix)

Although it ended up missing the last drm-next pr it will be part of the
-next-fixes flow and still be fixing 6.17 as well.

Thanks,
Rodrigo.

> > +	}
> >  
> >  	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap)) {
> >  		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
> > -- 
> > 2.34.1
> > 
> > 

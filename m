Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA6AD0E6C5
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 11:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB21E10E3B4;
	Tue, 25 Nov 2025 11:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLpQJ1Mo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05B410E3B4
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 11:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764068876; x=1795604876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vwvXIaz/1qfMhmZd2Zk2+KAdSCHy/idUG0szOX5OOIU=;
 b=GLpQJ1MoLMdngZJJJo/9kiH0krMKr6r8f4oGfCeBnrjLmfOjLWAomjfz
 HmzSXqUAAHAm72wlO86XVU0P0zRtDM6bb3S6rYrZ82RydBwAyHsB2p89e
 y2WVhg287aEGlvJCepkgJUkjTwPkGaLHILEi7DnqscBr9YHEfqog8KgFE
 zehkpu6dQnCrjlml+RxtTAw9c2dra+0UtBswlRdi0eUyCnxhm7y3p61yo
 AgIBzSiGGVUPHWyUHmILZm85EjG/WzBrBmA4cnS9TEyIAeslu8/7BeWc2
 cm7jhfd0WfFWcEpGvmOfb9SgtJU/x4khNUUsSUUAHFqjloh4RMre9LKt8 g==;
X-CSE-ConnectionGUID: +exmhZYWS6qjTZAEAPvCjQ==
X-CSE-MsgGUID: qqlqKNPSQR+UQGJKOdFq/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69708831"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="69708831"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 03:07:56 -0800
X-CSE-ConnectionGUID: Qk53k7XERqSWY2b5xYqaDg==
X-CSE-MsgGUID: lV5NXYSwTdGvKTivCwxI8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="215962241"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 03:07:56 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 03:07:55 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 03:07:55 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 03:07:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ou3q/dCNlmipx7yfHziCYjKlsOkpKe38/NJbN1noUl8jQp/xJ1SutTQ16xftRebYv7oZFcUQbSLdL6J2d0jO1imFKDy62UDRknFZS6FtYXE1fYNPyatXl54mahQHkA0lkch38yPNFugPwKkPhRzDGdCQ8Bcdl3gfF+fLdFZhJ/D0vJBntlMMop7B2sc49/o9okHGWLv4MAeMgH04r/JA89db4vbTLTpgIhcGNzvA/Dvp4JZja37Ib8gV4yzUQWL/UIMWoIYNiQzzLhm3aVu8nqbX2pOjI08cbsVunMoAXV0Qqv707Uvcfj0SX96C6VmxNTB36IokpsZwiFVrmam+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEOD6DfQKeCwNFNfS6t+tPglSBA+2DUXZ5E8ZNwIYNE=;
 b=WaTY2qn1azBfIU4I2VBGJ2ZVGhFhqU5fnZMz2PQJkAv5sFeRVpRmIBKB0nrFJg+P6pzjAporp9f0U5m3IKf2WGx6hxT0SkO4CKhuFEUwqwUpY5b8Ddk1WMjSkAVamGYfeCk/0b4BHaRE42vWRy5T/0Z956EQcIdDwpOayfgqL+NRZxhDg0TIvXpO/Hvc2NBhPb7ssPd48OfauXeBr9DoAQ8s9cEYYwO+44b4/uO+nDW30/rrFKuANrvK6FOwh6qNfdYNdFTQuoOKuAG/0WbdtXjAn8U4R5LWTrluFkssartP/Naq7lrz/Ol/OvsNb6fMSyEX8B1eUR8LMoDCg5rHfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by PH7PR11MB6795.namprd11.prod.outlook.com (2603:10b6:510:1b9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Tue, 25 Nov
 2025 11:07:52 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 11:07:52 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 03/11] drm/xe/xe_tlb_inval: Modify fence interface to
 support PPC flush
Thread-Topic: [PATCH 03/11] drm/xe/xe_tlb_inval: Modify fence interface to
 support PPC flush
Thread-Index: AQHcWGqVM1mB+DpWc0uEi08qflVNwbT/HL2AgAMYNFA=
Date: Tue, 25 Nov 2025 11:07:52 +0000
Message-ID: <SA1PR11MB8839E42E88EB91BD3F6172C0AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-4-brian3.nguyen@intel.com>
 <aSIP4QQRfts2PAtg@lstrano-desk.jf.intel.com>
In-Reply-To: <aSIP4QQRfts2PAtg@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|PH7PR11MB6795:EE_
x-ms-office365-filtering-correlation-id: 33818ae2-e89d-409a-edf6-08de2c12e0d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?K0YiWp5hlV2DD/YERwudTh8gMD9MIPY2ir9MyinKCf/DyANza4NZTrRfU9nk?=
 =?us-ascii?Q?hhrBFnqHyqP7G8wHQ3AShJa52eSJEANwX5m7uDLkQGAc9syl+9rYzLdgyHMX?=
 =?us-ascii?Q?Xz8OOndQfVGuht5mcxeszT6H1ph71+pla4a4F6AgREqg0ADvqVDXo32yjJy7?=
 =?us-ascii?Q?MR31XL7IWvvxWlHyLE/0Dmm24dTg+Pnyab+tnJe976X7+xpOdawmON1/Pi9k?=
 =?us-ascii?Q?c1OkKUvu/lCQsN+XDkjqIEaSs6FsWJ4JpzrkuLypajNbMisfGmf+h8vHxWKU?=
 =?us-ascii?Q?w4gI+9q2rl0RaFxv0I8UkzOB3GjkBNue+cVDZa7sdtsu/Arght5KTU8hdzK9?=
 =?us-ascii?Q?7oF2zX9nMUR8oP4bi/qZdqzYfqYpXZ2uo7r0mTQNAzDbqpJ1cpEl+Flwhuy0?=
 =?us-ascii?Q?X3dpgALhhAp+Pv8JtPD5u4H5PXa57GYuiM622j8m7J3rFB8m7/7ICDqtrXnm?=
 =?us-ascii?Q?QbA/1SQT0HN1G5BxPqVPUxaOaOpazcfFq2ZfMiG56CSTD6vaz8Gnw6vLka2Y?=
 =?us-ascii?Q?34VNi4KIZiXoK0KNP8XM9gMbpsh3y3D3CF5b5oJLBl4XYNB6GYwbt3gUzrwE?=
 =?us-ascii?Q?jGah+rUUaYxCNHvFdk38ATy1jjCFXZ4guUauodaYimzcVTKMfu4QHUBrAFND?=
 =?us-ascii?Q?LEzQnVryhKJVF4oJrynW95MPO8dAgmoE8Ci0w+4Quu0jw5KPpG1Ca+aZZ48n?=
 =?us-ascii?Q?4IA1ryKEsrX7fjok0mVOaJYiJ6GyLs+VZlsXPFuanTzetVl3n6RfXl4Z+tMV?=
 =?us-ascii?Q?Ya/NOLtvY7gj+S4WfsjtbpidhRhOUWTYY0KM6FzK0qCmTSLdiSVd72xvHRTr?=
 =?us-ascii?Q?8StEHcdmoErwSQlK11r/e8JGUlWmSihX3GHVNonwJhUu8QTmmrgVzq7gOam8?=
 =?us-ascii?Q?73xwna0uWU1RXaVs0TC4BDkrCLzFShK5Wg9SFHHorWBaS8Is3SBdTtxT7Ltu?=
 =?us-ascii?Q?LWB8CzU44PdIz9ztr0SzXGGzunImiXkChDMRkBThDLdJ1zbd0ztUoicewmDp?=
 =?us-ascii?Q?iuaGUd12STn33813xRmqNYAMlQIeVrgLEF0Gr13bez43MDHO1Cl0vt3E6HSD?=
 =?us-ascii?Q?bMx4CQjFBv4AIQPNIgXT4oqFYtH9jJLi97EFNuUIViqt0XWlWzf/qM8VWSOM?=
 =?us-ascii?Q?Jxo1btirbx4kAO24ry2vkUQZhrFDumbu1HVRDCKyUlMTdcarX5fPw+wqHWxq?=
 =?us-ascii?Q?9W4Jq7gRAW8PWeYcvO/3S5FukA9Miq4z+QDR1wNSLhTeRPel36qOFwUMVLYH?=
 =?us-ascii?Q?BnxLypj/dktNyv8Ewfhjmqoic/O2+1U3HrhW22SyjU5IW44exDdskkKccoqQ?=
 =?us-ascii?Q?NSRM+xWOogzwEhbP/S5/4TxtFh9WJwqIAAurOvllx/rRgaIW9Io4wUK+eEU4?=
 =?us-ascii?Q?5BYUOaSId8XIrQUtE7nifHjJLNx2cwcSnFA81MGE3enXHN10XPt+DxbvFw10?=
 =?us-ascii?Q?XzZ9XStr5vM7tC3XCFShVuGwVYfYGJz5bb3PFEAwG7zWd/XxRb4+snjWAixl?=
 =?us-ascii?Q?s83g789QM6m8hbR4XAz1nGkw7b0Jew4htJIE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IO+vmJKYkVLWj8u+AhHTbvI8l+Pgupi5NViO7G8k12wy58ihSuK9ykYVfAa5?=
 =?us-ascii?Q?6p3oBvl7Li4a1PRayhhfOzX10nEsG9pHWT6fSl1f39qv58xtj+wWoZT+y+jO?=
 =?us-ascii?Q?fpCEsYiGfAJN5FVgCbcxcy/BjCP5K8Fl+Demm2MucwKMEjRJl5NUCHG/1mL2?=
 =?us-ascii?Q?RjbuzvzYaWEZ/VDsNE9BI+WfHCPFLKHzP4tRNJhpzkWQBE+oIu2EABLlRgBb?=
 =?us-ascii?Q?zxlROL/yW3CamGA+zLJTa9Uqv9vUodF7syVvhsLWJ/vPjgs3kFKZVWGNZmbO?=
 =?us-ascii?Q?hQFQlF+O2U0LruvG4zgEB8M81qqROTlQM7mbNsBtfCvhLFj/tjpwqc9JOaon?=
 =?us-ascii?Q?m1ZAJbvZExTtuA7QTriUvS1sT4ypUCKyNEKdMD+e4HNsgdNv2pxIqMI/ld7H?=
 =?us-ascii?Q?lkDDPanMooYfdk5FA7AdZd92G/GhNon2BCyHfLbfQbkwovA2g27/XQDWDOix?=
 =?us-ascii?Q?Zl3Uq0LJAfXHY4Up+BdG7A/H5XoX2ara7vnOe5w3Ym/tqAsa/xHvxRQdUf/t?=
 =?us-ascii?Q?QjY4NGFwRJiHUcPh1CtUBrYyHZ0D0oIRdOsP2P1eTMF2u53/wvR1N2DsHjHx?=
 =?us-ascii?Q?0FTV4wBeR1QwCD9jKQMV2WVLF9yRfGi/Bp3wGeSTmsD5X48RuuzmibGRvFpm?=
 =?us-ascii?Q?HDhTFVbc6ghEUbjqo/K0ON+Gi0SEXAVmRe6mLnLGstcyrbO8bi5+/k7iFRzf?=
 =?us-ascii?Q?qENisdr1reB7nUgf5hvt9qsEvJYF+F5usvh2DRsnNeV7MqNUfdAulhxCYdzp?=
 =?us-ascii?Q?+ajDfV7oMXBdinexrXCm6wI3beRBWPaKfkkOq9Xn0p25qxH+zGV00vjpP1sl?=
 =?us-ascii?Q?iMKblZ+85noR5ZhON+wjuO5ikNu6oycglOBM1nq4vC5dO5fwh3FZBUL2y0QM?=
 =?us-ascii?Q?6xtu+qzZDjlRigOzXWBfsxlhVUysb1lKIM/XgoNw39Wm6vIcB6ZWspSso/99?=
 =?us-ascii?Q?ut9VuiPyv1DngUXRyFhgPo0IV0etd0iTaEXweNSc1gHORqZyUY7y+334JbLv?=
 =?us-ascii?Q?r+/IvSo9toJcQ5LTWP8ssIUawHu4y2c7QA1rmPQ163Nv7jnWRhsWahdGCNjH?=
 =?us-ascii?Q?XlYGzMTTzdds4G6RM8t5Hru0rp0xHDqx6Q51nzzanGN9DSgbR+eKv4lCQzYD?=
 =?us-ascii?Q?Z5j03xkaRwms87aeoWQEiKVK4ALYwnfftlOHm+iC38nL6Iucpk0/WF2UyFW2?=
 =?us-ascii?Q?C74CsqyEAXRT6JL4KAeJsItYLuLrwAVe9iM9LUUearriFcE2xInndCsSUR9d?=
 =?us-ascii?Q?ybqaBMnzZAQ/3TdHem9YPk19fq1p3ptqqQ+f2f2arJH2P5dlMZF5NMt+nagG?=
 =?us-ascii?Q?+4Q+oomi8cBmr9nM1iG4tjVGbACK3ZBaZKXyXoVneUwiIim3J2MclGXKBZte?=
 =?us-ascii?Q?aKhrW5lGdonOmy9h5hTn8I3i+OQHaQJbkV95AocPJeoOFJFgfdldAcQGSf8K?=
 =?us-ascii?Q?OM13PyaYH6GZd7/o5gigVjBy1xUD0lKPArGZtI/UKDg6G7jNA5t2/Hx3m+B3?=
 =?us-ascii?Q?5YDpXeeydsepNzwFJeEj6ZDuiO+V9GvLk1bA5JwLsv7soxw24B2whs7XRmeF?=
 =?us-ascii?Q?G1Rdk8L2EhcdVoDQVyP8lFu5awOHGw9LX6H5HCROHKJ7wpsfwMP2QOgug1AM?=
 =?us-ascii?Q?84A1dquRjdp4UVRpxgAGqKYER8vLNQxxLe0vWIT7TaWJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33818ae2-e89d-409a-edf6-08de2c12e0d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 11:07:52.6237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u9A/D0CmTmsnrwAXkRbDEIOvGjUCeyLhqjZllm1HEVCwbTxcQab6nJyPqUxlqGBe2OXImI14rudwjHwuF7RtJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6795
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

On Saturday, November 22, 2025 11:33 AM, Matthew Brost wrote:
> On Tue, Nov 18, 2025 at 05:05:44PM +0800, Brian Nguyen wrote:
> > Allow for tlb_invalidation to configure when driver wants to flush the
> > Private Physical Cache (PPC) as a process of the tlb invalidation
> > process.
> >
> > Default behavior is still to always flush the PPC but driver now has
> > the option to disable it.
> >
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 11 +++++++----
> >  drivers/gpu/drm/xe/xe_tlb_inval.c       | 21 ++++++++++++++++++---
> >  drivers/gpu/drm/xe/xe_tlb_inval.h       |  5 +++--
> >  drivers/gpu/drm/xe/xe_tlb_inval_job.c   |  2 +-
> >  drivers/gpu/drm/xe/xe_tlb_inval_types.h |  5 ++++-
> >  drivers/gpu/drm/xe/xe_vm.c              |  4 ++--
> >  6 files changed, 35 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index cd126c53faab..c05709a5bc98 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -34,9 +34,12 @@ static int send_tlb_inval(struct xe_guc *guc, const =
u32
> *action, int len)
> >  			      G2H_LEN_DW_TLB_INVALIDATE, 1);  }
> >
> > -#define MAKE_INVAL_OP(type)	((type <<
> XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> > +#define MAKE_INVAL_OP_FLUSH(type, flush_cache)	((type <<
> XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> >  		XE_GUC_TLB_INVAL_MODE_HEAVY <<
> XE_GUC_TLB_INVAL_MODE_SHIFT | \
> > -		XE_GUC_TLB_INVAL_FLUSH_CACHE)
> > +		(flush_cache ? \
> > +		XE_GUC_TLB_INVAL_FLUSH_CACHE : 0))
> > +
> > +#define MAKE_INVAL_OP(type)	MAKE_INVAL_OP_FLUSH(type, true)
> >
> >  static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval, u32
> > seqno)  { @@ -100,7 +103,7 @@ static int send_tlb_inval_ggtt(struct
> > xe_tlb_inval *tlb_inval, u32 seqno)  #define
> > MAX_RANGE_TLB_INVALIDATION_LENGTH
> (rounddown_pow_of_two(ULONG_MAX))
> >
> >  static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 se=
qno,
> > -				u64 start, u64 end, u32 asid)
> > +				u64 start, u64 end, u32 asid, bool flush_cache)
>=20
> Later in the series a drm_suballoc is passed in as an argument here.
> Isn't that enough to know if we need to flush the cache?
>=20

My original intentions here were accounting for the scenario we may not
not be using page reclaim, but some other feature was handling the HW
flush, such as the HW transient display/app flushing. However it may not
be necessary anymore. I'll remove it for now.

> >  {
> >  #define MAX_TLB_INVALIDATION_LEN	7
> >  	struct xe_guc *guc =3D tlb_inval->private; @@ -154,7 +157,7 @@ static
> > int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
> >  						    ilog2(SZ_2M) + 1)));
> >  		xe_gt_assert(gt, IS_ALIGNED(start, length));
> >
> > -		action[len++] =3D
> MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> > +		action[len++] =3D
> > +MAKE_INVAL_OP_FLUSH(XE_GUC_TLB_INVAL_PAGE_SELECTIVE, flush_cache);
> >  		action[len++] =3D asid;
> >  		action[len++] =3D lower_32_bits(start);
> >  		action[len++] =3D upper_32_bits(start); diff --git
> > a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > index 50f05d6b5672..de275759743c 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > @@ -324,10 +324,10 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_in=
val)
> >   */
> >  int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
> >  		       struct xe_tlb_inval_fence *fence, u64 start, u64 end,
> > -		       u32 asid)
> > +		       u32 asid, bool flush_cache)
>=20
> Then here, later in the series PRL is attached to the fence but can we ch=
ange that
> to an argument here?
>=20

Sure, will pass the prl_sa here later in the series and do allocation in tl=
b_inval_job.
I'll remove these flush_cache through all the range and consider the prl_sa=
 as
the primary indicator to flush PPC or not.

> >  {
> >  	return xe_tlb_inval_issue(tlb_inval, fence, tlb_inval->ops->ppgtt,
> > -				  start, end, asid);
> > +				  start, end, asid, flush_cache);
> >  }
> >
> >  /**
> > @@ -343,7 +343,7 @@ void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval=
,
> struct xe_vm *vm)
> >  	u64 range =3D 1ull << vm->xe->info.va_bits;
> >
> >  	xe_tlb_inval_fence_init(tlb_inval, &fence, true);
> > -	xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm->usm.asid);
> > +	xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm->usm.asid, true);
> >  	xe_tlb_inval_fence_wait(&fence);
> >  }
> >
> > @@ -420,6 +420,20 @@ static const struct dma_fence_ops inval_fence_ops =
=3D {
> >  	.get_timeline_name =3D xe_inval_fence_get_timeline_name,  };
> >
> > +/**
> > + * xe_tlb_inval_fence_flush_cache - Control PPC flush at invalidation
> > + * @fence: TLB inval fence
> > + * @flush_cache: whether to perform PPC cache flush
> > + *
> > + * Helper function to modify the tlb_inval fence to control the PPC fl=
ush.
> > + * Other components shouldn't modify fence directly.
> > + */
> > +void xe_tlb_inval_fence_flush_cache(struct xe_tlb_inval_fence *fence,
> > +				    bool flush_cache)
> > +{
> > +	fence->flush_cache =3D flush_cache;
> > +}
> > +
> >  /**
> >   * xe_tlb_inval_fence_init() - Initialize TLB invalidation fence
> >   * @tlb_inval: TLB invalidation client @@ -446,4 +460,5 @@ void
> > xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
> >  	else
> >  		dma_fence_get(&fence->base);
> >  	fence->tlb_inval =3D tlb_inval;
> > +	fence->flush_cache =3D true;
>=20
> I don't think we want PRL (later in the series) or flush_cache stored in =
the fence
> (i.e., don't modify the fence structure in this series) rather store the =
PRL in the job
> and pass into xe_tlb_inval_range as argument, NULL implictly implies flus=
h the
> cache.
>=20
> Matt
>=20

Got it. I'll transition over using the PRL pointer to indicate flushing the=
 BO, and
drop these flush_cache inputs here.

Brian

> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > index 9dbddc310eb9..b84ce3e6f294 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > @@ -24,8 +24,9 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval
> > *tlb_inval);  void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval,
> > struct xe_vm *vm);  int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inv=
al,
> >  		       struct xe_tlb_inval_fence *fence,
> > -		       u64 start, u64 end, u32 asid);
> > -
> > +		       u64 start, u64 end, u32 asid, bool flush_cache); void
> > +xe_tlb_inval_fence_flush_cache(struct xe_tlb_inval_fence *fence,
> > +				    bool flush_cache);
> >  void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
> >  			     struct xe_tlb_inval_fence *fence,
> >  			     bool stack);
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > index 1ae0dec2cf31..6248f90323a9 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > @@ -49,7 +49,7 @@ static struct dma_fence *xe_tlb_inval_job_run(struct
> xe_dep_job *dep_job)
> >  		container_of(job->fence, typeof(*ifence), base);
> >
> >  	xe_tlb_inval_range(job->tlb_inval, ifence, job->start,
> > -			   job->end, job->vm->usm.asid);
> > +			   job->end, job->vm->usm.asid, ifence->flush_cache);
> >
> >  	return job->fence;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > index 7a6967ce3b76..c3c3943fb07e 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > @@ -40,12 +40,13 @@ struct xe_tlb_inval_ops {
> >  	 * @start: Start address
> >  	 * @end: End address
> >  	 * @asid: Address space ID
> > +	 * @flush_cache: PPC flush control
> >  	 *
> >  	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
> >  	 * failure
> >  	 */
> >  	int (*ppgtt)(struct xe_tlb_inval *tlb_inval, u32 seqno, u64 start,
> > -		     u64 end, u32 asid);
> > +		     u64 end, u32 asid, bool flush_cache);
> >
> >  	/**
> >  	 * @initialized: Backend is initialized @@ -126,6 +127,8 @@ struct
> > xe_tlb_inval_fence {
> >  	int seqno;
> >  	/** @inval_time: time of TLB invalidation */
> >  	ktime_t inval_time;
> > +	/** @flush_cache: bool for PPC flush, default is true */
> > +	bool flush_cache;
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 7cac646bdf1c..5fb5226574c5 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3907,7 +3907,7 @@ int xe_vm_range_tilemask_tlb_inval(struct xe_vm
> > *vm, u64 start,
> >
> >  		err =3D xe_tlb_inval_range(&tile->primary_gt->tlb_inval,
> >  					 &fence[fence_id], start, end,
> > -					 vm->usm.asid);
> > +					 vm->usm.asid, true);
> >  		if (err)
> >  			goto wait;
> >  		++fence_id;
> > @@ -3920,7 +3920,7 @@ int xe_vm_range_tilemask_tlb_inval(struct xe_vm
> > *vm, u64 start,
> >
> >  		err =3D xe_tlb_inval_range(&tile->media_gt->tlb_inval,
> >  					 &fence[fence_id], start, end,
> > -					 vm->usm.asid);
> > +					 vm->usm.asid, true);
> >  		if (err)
> >  			goto wait;
> >  		++fence_id;
> > --
> > 2.51.2
> >

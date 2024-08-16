Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAC1C531DE
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 08:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588E210E5E4;
	Fri, 16 Aug 2024 08:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kiXeVI9Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA08310E5E0
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 08:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723797674; x=1755333674;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nPdH40TlrFvyROeTS+CwtUMTKlgVLzOzxyvGQDPUEDY=;
 b=kiXeVI9ZhOA2C7HYcdgsCczWf7D0qcOcT7XFrhdwxr5Eu4yhxubFdjkB
 ehoON9MF9K8XkBqb3Oaj+t/86gpsaga3zdFyX4PtjZO649MiDSM4xUO4g
 xmFTetAOXBjW9mdLSn8v3dIwfvm17zHT8hcgft1PQMi7B+kxy9MY/O2XV
 l5kaTlxQjNmbKRvN1Pf8oypn4kw2QyMFIV/QcPaMzBaEI37wHCEGldIHA
 KwEMwBJEGeDU+WtWyMUUN4YoYube9QNLvwC7UoHWDKrUfXYqF3jNPj02w
 C4+XLZFdyymcs8gLNddbuObjJZZtS+IfhfEPQ8kEYF2TfvJqkWKebpkWt g==;
X-CSE-ConnectionGUID: dRWXZdiKQn6SErgWhzkL1g==
X-CSE-MsgGUID: tEd4EcCXQWeUMCLHbgGkHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21943221"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="21943221"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 01:41:13 -0700
X-CSE-ConnectionGUID: RvbC3Re1SpiV97OcVpEF4w==
X-CSE-MsgGUID: diRzXFJkQT6PRi7AXCpNbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="59448303"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 01:41:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 01:41:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 01:41:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 01:41:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnqOdvVqDii8x4nllJMJhv2qF0YzYMra56JZDTOBlfEYmqN+8/+BHSqDAX9TTP3Jc6aLykZHnZHm4YHpZW6yHr8bkCi3tvjMQWy+zmFh6/F/pSQhiWb1KKDXLxgYnjmSMA88LmUkQiC+GFG27fh4C9/cfqcgtAJ/TVCw7n/JLg+bXZrZZA7RPWlXNNrxkSvRJUR0D21jFbz7YjtR/xdaH9OyXPtrFv1WEv7lVhpBH39CvShSYGofj2oLytBtenCjRkGf5Mn7YvM5LLPNyrRfnrZu78yXXVaPBdZBaKCuB4JztV2n+nBeIBjaFLnccFDu/5oqYKoBVL8rLwqXW/mFHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoeEOLtna/9pq5w+SQWy7kfca2mDvxZJ95BWT7xNZWo=;
 b=zUpWkvMRrqL5Kcvy3UNfCdc+fdlYIkemOcGnlJVBW9DBba4mbGL5vQj7BwvlJnD7jvu8G8n2yOYOfSQqMxjetSlwQPOe425XNvcAchZUguWPs60/SZ767uGrIap+seCAlJUhBmRtjOj075+jH3DYnwh4C0rnTByItYJDjYgcErPE4Zu2q0hZsoq0SFf+OCQ0OqGh1KqK8bktEQPrCGSZUWrerWbGwax8eLBWu6Q9a4bKr5MRo6yd4gAmYFBwqyatEI2RjCnIyp+geY6kjp3OBd99opb5m4H+AqTiFs4aRuu9yaWnTu8KOWaw+uTSY1x/xzmA8SskaD3E4koBElhJ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13)
 by DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.17; Fri, 16 Aug 2024 08:41:04 +0000
Received: from CY8PR11MB6868.namprd11.prod.outlook.com
 ([fe80::1eb4:7d0d:53f:6923]) by CY8PR11MB6868.namprd11.prod.outlook.com
 ([fe80::1eb4:7d0d:53f:6923%6]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 08:41:04 +0000
From: "Singh, Apoorva" <apoorva.singh@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Remove a redundant NULL lrc->bo check as a lrc
 will always have a bo
Thread-Topic: [PATCH] drm/xe: Remove a redundant NULL lrc->bo check as a lrc
 will always have a bo
Thread-Index: AQHa77ZoWa/tGQ7rGE2mmJIDtaqjabIpkBfw
Date: Fri, 16 Aug 2024 08:41:04 +0000
Message-ID: <CY8PR11MB6868B5EA999CD390952A922AEE812@CY8PR11MB6868.namprd11.prod.outlook.com>
References: <20240816082820.897326-1-apoorva.singh@intel.com>
In-Reply-To: <20240816082820.897326-1-apoorva.singh@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6868:EE_|DS0PR11MB6519:EE_
x-ms-office365-filtering-correlation-id: d14a775a-ae98-4aec-47d3-08dcbdcf2a40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?B4Wji2AhmjoEHCUyF0QzB1OgYuuVW/Rn3kyr2WStLaoIQdUyi+jKYEVmQLg8?=
 =?us-ascii?Q?H623Wr1KPNSYrhsbb/SCO/oRszl4zipZQAOmAZe5wfokSCKq2mEI4Q5FRUkp?=
 =?us-ascii?Q?4rmRHkrXQHAUYWWUVYLUyrNNjXzygFGal/D8Zsre+2e4d5FBrrdJ1i9X3Kgx?=
 =?us-ascii?Q?Y+8b/20IO6EEsdsFhLXyqhZxyvGxHTb2AgoquiweelGTsXPiQaZ+J8h+9cjV?=
 =?us-ascii?Q?r81GEUPdnqtMR5b/3d7s/IQJu5vvhSt7XpqPMP7/h77P1wXJhOCFhuFi8tde?=
 =?us-ascii?Q?gLyu3EJ/GOnK0OVgyEDnUqW4qDiEvV9/ZD2AJsVJmTKFxqJaMTdMpC7uur3U?=
 =?us-ascii?Q?QX6fmpjIzm75zLFXnoF/XlCgcqKg4OrOvTUD38kGCaEp59yHi/m3ZtFkfBhi?=
 =?us-ascii?Q?VzLQ9qXY94Pf1dWiBmHJcyfgY26d8O52TgIQF785ekP1MWVf7U6SK6fuVpXN?=
 =?us-ascii?Q?aqbWJoK+dkgKZW3oQIbi7ygfZhDUB9XFd9hNqAhwoyuVs/fh6MLVzeTk1VyD?=
 =?us-ascii?Q?SkDxvAQTIinNWCxZ3BTc1iTITjIUx1OCLC2vv4xaegoUWMlnmxNF22gDa4dt?=
 =?us-ascii?Q?YM6nIgohm0+rJFlydSzfsKgLvdhjbrWuk0vX2dHq8pP1ptHMT0kE7edQhoMQ?=
 =?us-ascii?Q?xOPVV/RiP9CsWBr7f1EzHyutfCCvqr2wcVOc9aPQxjSSlN1r/d4YL2uSDQfI?=
 =?us-ascii?Q?PG1qvUspV1mxYZ8gjdTB5APCNvrEQ9V9yaCxvP4rRmh3qTPktzXMVr3zsR0V?=
 =?us-ascii?Q?QrUm8I7mHPe328yqzkqV2Lr15YfOrZy96me2aB9lCPmRsLYWGxJyUxNRNUDL?=
 =?us-ascii?Q?wfCRu1vsqEq4vwlMUplGgO5f0tIGnRcHzymVVcXD9shgZx0LrGoGgUZoRNmJ?=
 =?us-ascii?Q?wzbrQa2Y1w0uJo0B7q7nP4IbSnghojEM7nncUM4GVSd+5zBr4z7Nul04QDnB?=
 =?us-ascii?Q?paeUdsBSN+/fzsIvbkbJWtm/hnKex3ytgzvWkTt9cbKdrUlDJZXzs5uprr4w?=
 =?us-ascii?Q?G7wDlgSqUweVMEPUU0apMIQrLlDBBkmWev6YryHKbGFitU/rpnIEwKYa8By4?=
 =?us-ascii?Q?mnwIjOnWVauj7K9FuK6cnCCAQXlrs7pLB3HXHxDHY2D1K2mjQ89SpNIJFHII?=
 =?us-ascii?Q?vqm6w9olPVuVo4vk0U+P+H9TYLQ5djaSNJQWkrmkm0yKN002sf6mwcAsB6QV?=
 =?us-ascii?Q?oZPnAzUOV+wuV6Ka/mOUNAqWEOwKN9e6ifIfBs9EkaJ1w4ECnueXfnxaZjCN?=
 =?us-ascii?Q?hwSkMpH9YWHl1iX+y7QHp80zDtDT5zc9UP01s9kWiTsIfZ28GfeaQBHNN4zI?=
 =?us-ascii?Q?AmVsydNxV8WWwhSKU9i+VvPFseopGorhUEO/6WEAYjV5+4IfQdQVhCGS+m3D?=
 =?us-ascii?Q?gtj37L4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6868.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?34iFGU/rWy0HEBlhtYg5JdWWvpM9TWR7IKrr2vLIKWqRUgJKdKbeTibyQw8X?=
 =?us-ascii?Q?jhJlaiirz4MqNKIVQ3TTXf5chN/OCdWIlwitKemrDri8dnVXVlXRpaDym0HX?=
 =?us-ascii?Q?E1HngHuuWdG8MAtC0Oq/nxpRI+5j9iqmr+HFl1P1C3mHuXgTm4K/UqYJESVP?=
 =?us-ascii?Q?MXzMpPHwVYwdJeYReKFizcqP3kgiPiIA7lB6wGVM0wbKHXHcH82Ts8WnKJja?=
 =?us-ascii?Q?AUAAiBfZ+b5fJJtzlclG+uasCls4vhyLMRzlmu6WmD3H8aTv7rdgpprVMTP/?=
 =?us-ascii?Q?yFr1YlDBuUzKY8bYLWRq81v8PML9UILki2AUn0+03DxxMP263mTf0X3QR93g?=
 =?us-ascii?Q?NkflTkDZ1SJAnpn+PtQZzW1x3ZVodoUJiZVsi5dx7sKpPdkOpqIu78iXBZxF?=
 =?us-ascii?Q?8AMJZN8vrjiFUpYeWM07RWWLQXV9anIa0pTFsaBTN0m0MpdYlc/hsgsSPxZH?=
 =?us-ascii?Q?1bGQR7H7xx5OEBj//geMDWDY9FghmWLbnjxMjyhxoqiXdl7DoIrqgdM19vaD?=
 =?us-ascii?Q?GEHzfaC4Dm+5h6q0sgsCWyEh64K+qKpn4eLrxsZ4tw1P95LT50ClgJTeTCpA?=
 =?us-ascii?Q?UV5Wrn5zPLbwN1myDX2e1nnkF01Q1Qn2wamNs0VbUt8y+YvQUgVwA1WAz0pR?=
 =?us-ascii?Q?whq+ASAk65uIqsSSDEcgFUehj+uxi7Fla96HR3uCSBPH5g1zKXbJITmvCJh4?=
 =?us-ascii?Q?aHPT4EPwdNM1cALpK5jNK5ZZ6f4PAcIhJVD+0Z7VueukZ3p4NcTHsQk7hBVZ?=
 =?us-ascii?Q?EaRxb6j7mBkwSJ0EHjZKyqAvlcYF1/nDquFzQhkuYNUGiBtCsO8sdbyKUydD?=
 =?us-ascii?Q?iX7JLLmaXSi1x2D6GQrojQcnGc341jI6SnvhTBw5cAQT2UW7anCC3vyNOymc?=
 =?us-ascii?Q?4fUFDXlWIk4gnfQwPwB62dof1OYK534ITpbk6TpTPjCDTuFsAzRDgxeutit9?=
 =?us-ascii?Q?p/yUXpxHmSZNukiZ/QkUQHn2aTpaKYD3vTx6sby6Zy9rxB5jCiCiGm2wjiZp?=
 =?us-ascii?Q?4RhuTZ/AYuBtD99ORmbJdbJtUlIbI44dMt0AYNLcxZbsK0vO83sor/P7OjWy?=
 =?us-ascii?Q?e4sQ2v1tsoVldSfWAaqHmgXO1SFguzjTqEOjS+jNuYe23n2bUSKP8kw2I4Nx?=
 =?us-ascii?Q?KrwVzGYEf8WWSOOj3DL2m24oueYg3Olb0OrLLGfJ61wzbHMtCF/kd22qSo4e?=
 =?us-ascii?Q?Nc6b4KHVg41Jfj1+KV7CHcscLBZIDbrAHneqOEv4FQdJKH8JLR+s2n9O4ZSD?=
 =?us-ascii?Q?qHMTrhjvvGgmi0XPa1Vt5D5O0oHBUoPNrKayc5cA6II999iCtUhRo/1WN9H4?=
 =?us-ascii?Q?eyMx5IUX4I9l1WMWwI73RolkeVVjpMSf0wxoPsfNZ/XqWDWlMxdzSsl/NXrd?=
 =?us-ascii?Q?FqcQ0+eAVGMA6ZUOtHTncslZ6h1ikmaLRNl4wKRIkoFoltINmME5bo/widAn?=
 =?us-ascii?Q?IoUOhKp5fxslWoEWTKI99xAFvzZDmhiRiQk84VGCNYCE6UBVDSpcqV/HDIEI?=
 =?us-ascii?Q?g6CGuTwmyFecdT7FdwaffMkArO0fqHOZHriYZh/HI7N9tSqEFa1GkossXnbx?=
 =?us-ascii?Q?XK4tXaNN4AQY8CbX4CNv1zKGBJHWAlwXQA/SJhoR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6868.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d14a775a-ae98-4aec-47d3-08dcbdcf2a40
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 08:41:04.3968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pj7LtXgSdLHY5wvCbT4dZ2FZSAgT2l3gIcb0Q0c0d7zrlrdwXcOZaucl2BHKLQ+B7z1pzu+LqlS7HR8KB7Ff4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6519
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

This patch is superseded by: https://patchwork.freedesktop.org/series/13736=
7/

> -----Original Message-----
> From: Singh, Apoorva <apoorva.singh@intel.com>
> Sent: Friday, August 16, 2024 1:58 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Singh, Apoorva <apoorva.singh@intel.com>
> Subject: [PATCH] drm/xe: Remove a redundant NULL lrc->bo check as a lrc w=
ill
> always have a bo
>=20
> From: Apoorva Singh <apoorva.singh@intel.com>
>=20
> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c in=
dex
> 974a9cd8c379..aec7db39c061 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1649,7 +1649,7 @@ struct xe_lrc_snapshot
> *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  	if (!snapshot)
>  		return NULL;
>=20
> -	if (lrc->bo && lrc->bo->vm)
> +	if (lrc->bo->vm)
>  		xe_vm_get(lrc->bo->vm);
>=20
>  	snapshot->context_desc =3D xe_lrc_ggtt_addr(lrc);
> --
> 2.34.1


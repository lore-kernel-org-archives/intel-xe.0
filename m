Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A3F606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 22:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vu2ObiwI;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=VyTugTHp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990CE10ECE5;
	Wed, 18 Nov 2026 22:49:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6641120AE
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 22:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795042146; x=1826578146;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ov0s77PFkgXnffujCieJvE5eb4/hat2STqqb9P/TT80=;
 b=Vu2ObiwIJWhneebrrOjNelbeFDsp1MOFf1YiVSXqStiI/NgGm27fTPKa
 fB3UMdM2GNzrTuNUKsTx7IQRZQL7jRkB4oc1AA/EyDQulO1N33gbxLfCa
 mRgsLa83d2DKK2Pdcqt5FGeVoZ0Q97qNlIU2cgdvRtlBSZsRGVd30bvfQ
 0Q0R0Aw5Fwkl4zIYDoEOvX2bHnbE31jDHKptzm3MGd5X+9iBdu0Znfy2h
 Eiq7TjwwD3RpDdax4vQykEA4sTuyLduc0U88Wer9M5mnk7IYWTtqUTvAT
 oPjCPj9sguChW1JOH2lgCQ7TULvpzaZ1FGdVS1rjyqGQ5QnCWhnRnqSo1 w==;
X-CSE-ConnectionGUID: ezQa30c0TNCKMtax8GDNtQ==
X-CSE-MsgGUID: Bi7eXI3wTGyHoHtvEUf8vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3774836"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3774836"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:49:06 -0800
X-CSE-ConnectionGUID: hfmxm2y2S52h3cBZhp2C1g==
X-CSE-MsgGUID: F87T9ud2SDW/HEupSXahcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10659632"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:49:06 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 14:49:04 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 14:49:04 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 14:49:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4OetFQ8/M2oHIY6WrUkUuqSVoAN7oQtbXjkQOnE0DOcPldbtykvcNuBIK4RAxvIaYeVKPZMo9AYlsRO4gZ487vvIkMDOnz4cxTXJAOT9XfZcwgtSIfRDAsPo0XKV+SFOoRyX+Sy3p3BQBAGg7CUwPNJa2OiXucFCCYCA/fqb/SHMMrBezNVKuT+Z6NYBd91dbQ+PoAHNmgWCR4iI7zU6PBome2kmg18XaXEhAMVf5WW/kX+PmQDKUk3gxV2Klrd+bj1ixjfz1pL7whgTgGRKYBN8wlARwzUuGnXuh95ZXkRklg6DJwgzyV+z5U5N4Ei4R/oSySkWxL2fsMRxH92Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFJv4eX9YzB1wzzUl/9+7j04tmKMhdpSOeiTilACSRg=;
 b=HflnKzVysDNCpLTKxnUeepdgi9WgMMlxFTu4td30xu8wDvSS7FBjsjF4lrqMBUAMdfUdr0MR3klTqpUByjHsmrWu+Jl0WgtZLvFub2le48OWj56+J78BZP4zGJtIc8IcOk5kaILy2aSREqUtOT2V2zN8GXPRxLsdld5XSlgkn7sOuTP5N6qhe7hbqUCgyGIXR1Lr+uObNQJfQkT6fzxI6qlZZMJj3PbMkF1K5IBtR1ZFCO1QhQvOenlGzLEWTqkNgQI3DH/hDGr2BRHMYYfKmWLr451ru5jVGg/kFEucR7q8rav9vDTck9XE243lzkNz5+QpXcJlzSnwsK/uNUkyuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFJv4eX9YzB1wzzUl/9+7j04tmKMhdpSOeiTilACSRg=;
 b=VyTugTHpo7ZfsJDfaAX2hVle5TfN7bxo4TP8rQwV3j10dbG4YZqTlWoTLw+oFgfx/+NXjOwZR8sm+E0Pjn+jXdsOCQe0PQWPjIwul32RbC6TsnGltMdVmJ9RJJEywz2cDWR/YVtPx1uQTonX/wDD8KC3QtmgkyICSS6DEpTrsag=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8516.namprd11.prod.outlook.com (2603:10b6:a03:56c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 22:48:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 22:48:58 +0000
Date: Wed, 18 Nov 2026 14:48:55 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe/wopcm: Use the size from HW when excluding
 the wopcm range from GGTT
Message-ID: <20261118224855.GG6134@mdroper-desk1>
References: <20261118220120.109186-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118220120.109186-3-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: 912fac30-f96b-4143-24ea-08df45c62180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|6133799003|22082099003|18002099003|261009223027099003|261009221227099003|3023799007|261022113327099003|261022075727099003|261021121427099003|261022105027099003|261021123027099003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 9LlzCXO5cYqfP6+MvpINOKbl18EbCfJpxgynrgxC7LCT1KeBTDm8WeDsT7BhOppopEbGyvomVCVMli89DHjvK+aBa8OCQjv4ubks8Zz9QaGeqawPMIh4fAbM3XO7zt0kDxMA/Ve8/y77OHSVbIIu2Z+z1kO10tG0IQ0z/JPxNYT0W/7glCcRCYq17g47jBCiIz3O1qq07YfHuai35xlskLmQrA1aReopZPtt5ydla+sfVVi1NnrqZwZKHAzIRelhqaFHxkF0//OGXUoYXYEe5MY9mLmHSpvs1oOXaohkPpvva3eW/gWXLPODsq+sZ0PrvsKDkCkQ8NcOjsZTBRJuaspx9O+dbYY2WrvCpI1EA9sf/eC0+2XDuVXepZ+L1vi4Op72tpxqfqTNBDNZz7hz0LYXAFWABRU5SqXtYvhpx3fSVGcUfhsllumiHgT8VTfuI11z0+aAQS2sJMigRIC+YJP8OWK6FbBuBUgFqZpUr3uE7dYEirEAZ8sztrY9Tf312MRScbiuDsvcQazkhK5aYqQR1lutIszFrm9V7YyB68qRuzJUAQJtu8BbgdsDIGf3BRGDPiMz6EbLED6nbZaMhvaRjI0P1L8jby9GP44vWOAFPcOKsGF3kXMhn1Odjh/er4n3MMqK9W5hQzoxX1nW+c6zCil3bHxEtyGO0jp4UCU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(261009221227099003)(3023799007)(261022113327099003)(261022075727099003)(261021121427099003)(261022105027099003)(261021123027099003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?t1rZU2wdKwe5EhPeeSoaboR3v7Ue7qNIZABH6j3ytfK/BYLSjC9SfjGKRn?=
 =?iso-8859-1?Q?ypniP1kwL3hJ+UrWr6oxNfnkYHyOo4Ld5IqOCXhL21/YVYKRcE2l58vbhx?=
 =?iso-8859-1?Q?gmRhO+DD2+bBVM9Uy4bV+v6+adgvkStVwOBIgPettCkaM1xL4R5q500cnc?=
 =?iso-8859-1?Q?CdieEcXR+e/xSE14VcXsQkdPoth/C2aA0ryUQNV3R/Bw9zU+VX8QCrCi6b?=
 =?iso-8859-1?Q?CqB+mrTEsOam6+CgkGAd37oDuXxhBanmcXOVT/8jPNmbmUrkOwI/yBSYB1?=
 =?iso-8859-1?Q?ZtDdZOnx/TBTcJZ0dcqNYxhq8Nzm+FNTa4t7dWcf2m2wnd8/o3ov1EU9MQ?=
 =?iso-8859-1?Q?oeaeqUZ0mN0a8M/BeGuzafPBAHetUA/oYZ/7oNUSzX1G4vJGeZa1Sgw7CU?=
 =?iso-8859-1?Q?TNvvPBWnNqZ9wNBSP73hKqLPVl6gmBIouVqO/5ywXXobg81R4K6Wl++Mk0?=
 =?iso-8859-1?Q?wmPy/IcpjMr/Ou/K2xW9rg5rU1d4ntwrgwBDQako5D/aylPUJvKJCygcHH?=
 =?iso-8859-1?Q?ht19k1wo34qd+oZCV4N93c9B2P6vg8REnNT7nGVAuEBDo2AmPCnVz1E3ae?=
 =?iso-8859-1?Q?JPlu94QJgxy2LNRhadc1RO/eGcOX+RzI//LDy2mtzurhzNsYRB3jIYDLQ7?=
 =?iso-8859-1?Q?O7Y2ujyVIkh4RV99FyZJGNEM0wzoBhrtP6u81JuRIzLDZZLKMrssvMhDCL?=
 =?iso-8859-1?Q?yd+vBvoaumIqZX2w//FQn7wv1GoRS5R+me42DiOSGjGuAF7nTf9FN1ny5x?=
 =?iso-8859-1?Q?SGOwFug6AnyNhJCfwI5XSlmQfLew+BLZzjkNTkEV9bKXzRlMkab+FrJvQK?=
 =?iso-8859-1?Q?SHxN889FfO8f9Zjv65/18Eu8L1S+IIKU0vXIteSGe0lbvxap0uHRUVEH66?=
 =?iso-8859-1?Q?piFIeS+Rd6/5qu2Ir/zX6XtkTw8nobn8IFwzUOGavWtuqV7LeK8ElHhdhS?=
 =?iso-8859-1?Q?X4uA9rl7uBLaG2TaN1f+Ln7xPIYXOJ5aAfW6zhUdxt7Ce0gIGdxb7iHOhs?=
 =?iso-8859-1?Q?okW0kpfmKiNvWOBtLkZAT3TsO1wilnpg+g5fT5flqibCJHWAxNlq794vno?=
 =?iso-8859-1?Q?0QFhI1IK8sSl52ETtfR4aebpFOc4ZWM0+vdo58P59Tz7BZRSFBl2gkCSF/?=
 =?iso-8859-1?Q?KTGlWp9e+8RFijLB1P87xqk5gjye90bJynaaePXgvjum/lJvEF/bPq9PPq?=
 =?iso-8859-1?Q?AacDZ2mQ3F/bL+knPE3IPz8ew5GvRiJVmVMSEnw6nPuPjzLSelRtInwhKV?=
 =?iso-8859-1?Q?hh45m1QI+85I0+v0aNQwMhwG2yeWGE7wj9sqYiMV6lx6/XqqrUKMwDObfY?=
 =?iso-8859-1?Q?Yob/naFo8XaR/KJoHPbO8V+zvlWCEBlnkMctO/5dpz4qMxS4umWw1HgZun?=
 =?iso-8859-1?Q?dY4URpFCG3bbqo7Mr4N3CLN8EoTKKNShXxEY3n5vIv8fD1aJuJzr477iCI?=
 =?iso-8859-1?Q?UsxoJUtJIEEvL4EiZmILQaTG9LXJdf3C86RRN9rKwy7NghtXb7JXkTohiQ?=
 =?iso-8859-1?Q?iZlhOreJmogSHMBn6DxM2cy/wUKfuoJhFghy6D/vOK8EVJiU5PLx2XZHvM?=
 =?iso-8859-1?Q?uKirRtJiMYdg7PG+8sEDieC/tCakAm1sxER5PN+C1j3hxB76qcuKDujxi0?=
 =?iso-8859-1?Q?A/GcUOJTx3aJS9W/Z7KThMsdqMSSvWirTjHVWUW27HhYOWydT3R3kFiZ9m?=
 =?iso-8859-1?Q?fxEfrYCF1BB1nP1Zl8idIBQVTBes/+Tx7mpNQnnvKJ3VyAyMIL8no7qZBJ?=
 =?iso-8859-1?Q?x1bmWQEt2d3PFeW+fZpB6t7hysoD+tiYqr+xq3FIMXDukJwIxWNaXQ0p+t?=
 =?iso-8859-1?Q?2eRigiC/L3UQvJqUaoBPrC3STp8ct8g=3D?=
X-Exchange-RoutingPolicyChecked: x80d9l1eBtqZ2b/LdZvG1tPIqzrEPmAetLDMs+eLkq0OxooizUVo3JZ7igWMQfvNfPFRPc9qpRCeF2ihuyQtWruqmzUqrDXnFyWL74GUeXUcfbrX2A+/t2fjfmRaHu104hDgELJPcdK2xMRZ7Gumo6eL8smGaI8a94t+KHKD47Gus9Ch7YlwHLFLwSQ09USHFZGqFQudY7yoTVzOlfbmhCsza8NzEnAdaPERfw3Nu/F/BQ+LRNdKqWYtOWma40K8hl/RM9elnRe8BLtL65Tr0v0pMYtpZ4uTH9K9Yg1/hT7PlrlxnwJdl0Irm1V/D/blGZ8yTtA3pv9QJ6A3guXNyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 912fac30-f96b-4143-24ea-08df45c62180
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 22:48:57.9684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n12kjm8/foPVGG4dZHrSR/LYZGE/EyHR8scac5xewfCJ8Q+UgvFR5ZXQUygocTZ+kT9wsPic8GSEM2qXocXkaeEGZq0cGw7v4VIVzEqNGYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8516
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 10:01:20PM +0000, Daniele Ceraolo Spurio wrote:
> The WOPCM size is available in HW (we read it during the stolen memory
> init), so when excluding the WOPCM range from the base of GGTT we can
> use the HW value instead of a hardcoded one (which needs to be updated
> any time the config changes on newer HW). This value is not available to
> VFs, but the only use VF has for it is to make sure that the PF has done
> its programming correctly, so we can just trust PF and drop the checks.
> Since the WOPCM is a per-tile value, we can store its size in the tile
> structure and re-use it for both GGTT and stolen memory setup.
> We also have a kunit that uses the wopcm size, but as a static kunit it
> doesn't actually require a real value but just a non-zero one for
> testing, so we can use the already defined GGTT_TEST_START.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com> #v2

With the Sashiko feedback addressed, my r-b still stands.

Thanks.


Matt

> ---
> v2: drop wopcm size usage from VF
> v3: move guc_ggtt assert from next patch to this one (Sashiko), rebase
> on SRIOV updates, add kernel-doc for new functions.
> v4: fix kunit
> ---
>  drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c |  4 +-
>  drivers/gpu/drm/xe/xe_device.c           |  4 ++
>  drivers/gpu/drm/xe/xe_ggtt.c             | 19 +++-----
>  drivers/gpu/drm/xe/xe_guc.c              | 11 +++--
>  drivers/gpu/drm/xe/xe_tile.c             | 61 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile.h             |  3 ++
>  drivers/gpu/drm/xe/xe_tile_types.h       |  3 ++
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c   | 53 +++++++++-----------
>  8 files changed, 107 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
> index 25471317d781..202b48b0c984 100644
> --- a/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
> @@ -12,9 +12,7 @@
>  
>  static u64 ggtt_test_accessible_size(struct kunit *test)
>  {
> -	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> -
> -	return GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> +	return GUC_GGTT_TOP - GGTT_TEST_START;
>  }
>  
>  static void ggtt_test_fini(void *data)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 6911c2ac39f8..93cd91fb620d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -934,6 +934,10 @@ int xe_device_probe(struct xe_device *xe)
>  	override_has_cached_pt(xe);
>  
>  	for_each_tile(tile, xe, id) {
> +		err = xe_tile_wopcm_init(tile);
> +		if (err)
> +			return err;
> +
>  		err = xe_ggtt_init_early(tile->mem.ggtt);
>  		if (err)
>  			return err;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 44480fad2767..1bc5b8c0f2b9 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -30,11 +30,11 @@
>  #include "xe_pm.h"
>  #include "xe_res_cursor.h"
>  #include "xe_sriov.h"
> +#include "xe_tile.h"
>  #include "xe_tile_printk.h"
>  #include "xe_tile_sriov_vf.h"
>  #include "xe_tlb_inval.h"
>  #include "xe_wa.h"
> -#include "xe_wopcm.h"
>  
>  /**
>   * DOC: Global Graphics Translation Table (GGTT)
> @@ -414,7 +414,7 @@ static int ggtt_probe(struct xe_ggtt *ggtt, u64 *start, u64 *size)
>  		return -ENOMEM;
>  	}
>  
> -	*start = xe_wopcm_size(xe);
> +	*start = xe_tile_wopcm_size(ggtt->tile);
>  	*size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - *start;
>  
>  	return 0;
> @@ -422,13 +422,11 @@ static int ggtt_probe(struct xe_ggtt *ggtt, u64 *start, u64 *size)
>  
>  static int ggtt_get_range_from_guc(struct xe_ggtt *ggtt, u64 *start, u64 *size)
>  {
> -	struct xe_device *xe = tile_to_xe(ggtt->tile);
> -	u64 wopcm = xe_wopcm_size(xe);
> -
>  	*start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
>  	*size = xe_tile_sriov_vf_ggtt(ggtt->tile);
>  
> -	if (*start < wopcm || *start + *size > GUC_GGTT_TOP) {
> +	/* We can't check start against WOPCM as VF doesn't have access to the WOPCM size */
> +	if (*size > GUC_GGTT_TOP) {
>  		xe_log_err_fatal(ggtt->tile, GGTT, -ERANGE,
>  				 "Invalid GGTT configuration: %#llx-%#llx\n",
>  				 *start, *start + *size - 1);
> @@ -734,11 +732,6 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
>  	ggtt_invalidate_gt_engine_tlb(ggtt->tile->media_gt);
>  }
>  
> -static inline u64 xe_ggtt_bottom(struct xe_ggtt *ggtt)
> -{
> -	return xe_wopcm_size(tile_to_xe(ggtt->tile));
> -}
> -
>  /**
>   * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change in usable address range.
>   * @ggtt: the &xe_ggtt struct instance
> @@ -750,13 +743,13 @@ static inline u64 xe_ggtt_bottom(struct xe_ggtt *ggtt)
>   * This function may be called multiple times during recovery, but if
>   * @new_start is unchanged from the current base, it's a noop.
>   *
> - * @new_start should be a value between the GGTT bottom and #GUC_GGTT_TOP.
> + * @new_start should be a value between the WOPCM size and #GUC_GGTT_TOP. VFs
> + * don't have access to the WOPCM size so we can't test against that.
>   */
>  void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
>  {
>  	guard(mutex)(&ggtt->lock);
>  
> -	xe_tile_assert(ggtt->tile, new_start >= xe_ggtt_bottom(ggtt));
>  	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
>  #ifdef CONFIG_PCI_IOV
>  	xe_tile_assert(ggtt->tile, ggtt->shareable_size == 0);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index c4fb34e64cd6..e7e818897bf5 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -47,15 +47,16 @@
>  #include "xe_sleep.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_migration.h"
> +#include "xe_tile.h"
>  #include "xe_uc.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wa.h"
> -#include "xe_wopcm.h"
>  
>  static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>  			    struct xe_bo *bo)
>  {
> -	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
> +	struct xe_device *xe = tile_to_xe(tile);
>  	u32 addr;
>  
>  	/*
> @@ -64,10 +65,12 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>  	 * might be different for each tile. So, just always ask for the address
>  	 * on the target GuC.
>  	 */
> -	addr = __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))->id);
> +	addr = __xe_bo_ggtt_addr(bo, tile->id);
> +
> +	if (!IS_SRIOV_VF(xe))
> +		xe_assert(xe, addr >= xe_tile_wopcm_size(tile));
>  
>  	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
> -	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
>  	xe_assert(xe, addr < GUC_GGTT_TOP);
>  	xe_assert(xe, xe_bo_size(bo) <= GUC_GGTT_TOP - addr);
>  
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 810dfd98d830..014b5efdb152 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -13,15 +13,18 @@
>  #include "xe_ggtt.h"
>  #include "xe_memirq.h"
>  #include "xe_migrate.h"
> +#include "xe_mmio.h"
>  #include "xe_pcode.h"
>  #include "xe_sa.h"
>  #include "xe_svm.h"
>  #include "xe_tile.h"
> +#include "xe_tile_printk.h"
>  #include "xe_tile_sysfs.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vram.h"
>  #include "xe_vram_types.h"
>  #include "xe_wa.h"
> +#include "regs/xe_regs.h"
>  
>  /**
>   * DOC: Multi-tile Design
> @@ -225,6 +228,64 @@ void xe_tile_migrate_wait(struct xe_tile *tile)
>  	xe_migrate_wait(tile->migrate);
>  }
>  
> +/**
> + * xe_tile_wopcm_init() - cache the WOPCM size for the tile.
> + * @tile: The tile for which to cache the WOPCM size.
> + *
> + * This function reads the WOPCM size from the hardware and caches it in the tile
> + * structure. It does not perform any memory allocations. The cached value can
> + * be retrieved later using xe_tile_wopcm_size().
> + * This function can't be called on VFs since VFs don't have access to the
> + * register holding the WOPCM size.
> + *
> + * Returns: 0 on success, negative error code on error.
> + */
> +int xe_tile_wopcm_init(struct xe_tile *tile)
> +{
> +	u32 wopcm_size;
> +	u64 val;
> +
> +	if (IS_SRIOV_VF(tile_to_xe(tile)))
> +		return 0;
> +
> +	val = xe_mmio_read64_2x32(&tile->mmio, STOLEN_RESERVED);
> +	val = REG_FIELD_GET64(WOPCM_SIZE_MASK, val);
> +
> +	switch (val) {
> +	case 0x5 ... 0x6:
> +		val--;
> +		fallthrough;
> +	case 0x0 ... 0x3:
> +		wopcm_size = (1U << val) * SZ_1M;
> +		break;
> +	default:
> +		WARN(1, "Missing case wopcm_size=%llx\n", val);
> +		return -EIO;
> +	}
> +
> +	tile->mem.wopcm_size = wopcm_size;
> +
> +	xe_tile_info(tile, "WOPCM size: %uKB\n", wopcm_size / 1024);
> +	return 0;
> +}
> +
> +/**
> + * xe_tile_wopcm_size() - get the WOPCM size for the tile.
> + * @tile: The tile for which to get the WOPCM size.
> + *
> + * This function returns the cached WOPCM size for the tile. This function must
> + * be called after xe_tile_wopcm_init() has been called for the tile.
> + * This function can't be called on VFs since VFs don't have access to the
> + * register holding the WOPCM size.
> + *
> + * Returns: The cached WOPCM size in bytes.
> + */
> +u32 xe_tile_wopcm_size(struct xe_tile *tile)
> +{
> +	xe_assert(tile_to_xe(tile), tile->mem.wopcm_size != 0);
> +	return tile->mem.wopcm_size;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>  /**
>   * xe_tile_local_pagemap() - Return a pointer to the tile's local drm_pagemap if any
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index a2a2c0e936b8..5ae9f6753f96 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -19,6 +19,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile);
>  
>  void xe_tile_migrate_wait(struct xe_tile *tile);
>  
> +int xe_tile_wopcm_init(struct xe_tile *tile);
> +u32 xe_tile_wopcm_size(struct xe_tile *tile);
> +
>  static inline bool xe_tile_is_root(struct xe_tile *tile)
>  {
>  	return tile->id == 0;
> diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
> index 3dc011f111a4..dea17282501c 100644
> --- a/drivers/gpu/drm/xe/xe_tile_types.h
> +++ b/drivers/gpu/drm/xe/xe_tile_types.h
> @@ -84,6 +84,9 @@ struct xe_tile {
>  		/** @mem.ggtt: Global graphics translation table */
>  		struct xe_ggtt *ggtt;
>  
> +		/** @mem.wopcm_size: Size of the WOPCM for this tile */
> +		u32 wopcm_size;
> +
>  		/**
>  		 * @mem.kernel_bb_pool: Pool from which batchbuffers are allocated.
>  		 *
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 60f39efb02d0..5983b6c0ac3f 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -20,6 +20,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vram.h"
>  #include "xe_wa.h"
> @@ -38,34 +39,12 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
>  	return GRAPHICS_VERx100(xe) < 1270 && !IS_DGFX(xe);
>  }
>  
> -static u32 get_wopcm_size(struct xe_device *xe)
> -{
> -	u32 wopcm_size;
> -	u64 val;
> -
> -	val = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), STOLEN_RESERVED);
> -	val = REG_FIELD_GET64(WOPCM_SIZE_MASK, val);
> -
> -	switch (val) {
> -	case 0x5 ... 0x6:
> -		val--;
> -		fallthrough;
> -	case 0x0 ... 0x3:
> -		wopcm_size = (1U << val) * SZ_1M;
> -		break;
> -	default:
> -		WARN(1, "Missing case wopcm_size=%llx\n", val);
> -		wopcm_size = 0;
> -	}
> -
> -	return wopcm_size;
> -}
> -
>  static u64 detect_lmembar_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  {
> -	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)->mem.vram;
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	struct xe_vram_region *tile_vram = root_tile->mem.vram;
>  	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);
> -	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	struct xe_mmio *mmio = &root_tile->mmio;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	u64 stolen_size, wopcm_size;
>  	u64 tile_offset;
> @@ -79,8 +58,14 @@ static u64 detect_lmembar_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *m
>  	if (drm_WARN_ON(&xe->drm, tile_size < mgr->stolen_base))
>  		return 0;
>  
> -	/* Carve out the top of DSM as it contains the reserved WOPCM region */
> -	wopcm_size = get_wopcm_size(xe);
> +	/*
> +	 * Carve out the top of DSM as it contains the reserved WOPCM region.
> +	 * Note that the WOPCM region is per-tile, but the code below only looks
> +	 * at the root tile values for both stolen and WOPCM; this works because
> +	 * on PVC there is no driver-usable stolen, so stolen_size is 0 for
> +	 * both tiles, but if that changes we'll need to rework this.
> +	 */
> +	wopcm_size = xe_tile_wopcm_size(root_tile);
>  	if (drm_WARN_ON(&xe->drm, !wopcm_size))
>  		return 0;
>  
> @@ -105,11 +90,12 @@ static u64 detect_lmembar_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *m
>  static u32 detect_lmembar_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	struct xe_gt *media_gt = xe_device_get_root_tile(xe)->media_gt;
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	struct xe_gt *media_gt = root_tile->media_gt;
>  	u32 stolen_size, wopcm_size;
>  	u32 ggc, gms;
>  
> -	ggc = xe_mmio_read32(xe_root_tile_mmio(xe), GGC);
> +	ggc = xe_mmio_read32(&root_tile->mmio, GGC);
>  
>  	/*
>  	 * Check GGMS: it should be fixed 0x3 (8MB), which corresponds to the
> @@ -141,8 +127,13 @@ static u32 detect_lmembar_integrated(struct xe_device *xe, struct xe_ttm_stolen_
>  		return 0;
>  	}
>  
> -	/* Carve out the top of DSM as it contains the reserved WOPCM region */
> -	wopcm_size = get_wopcm_size(xe);
> +	/*
> +	 * Carve out the top of DSM as it contains the reserved WOPCM region. We
> +	 * assume only the root tile is present, so we don't need to worry about
> +	 * the WOPCM size for the remote tiles.
> +	 */
> +	xe_assert(xe, xe->info.tile_count == 1);
> +	wopcm_size = xe_tile_wopcm_size(root_tile);
>  	if (drm_WARN_ON(&xe->drm, !wopcm_size))
>  		return 0;
>  
> -- 
> 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

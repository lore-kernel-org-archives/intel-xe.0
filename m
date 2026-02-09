Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BD1E94620
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 23:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAA810E492;
	Mon,  9 Feb 2026 23:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDBu3doa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D20A10E492;
 Mon,  9 Feb 2026 23:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770678785; x=1802214785;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zFZY2xv2XWrZC9x2DXxss4l9u0sL+6Zm2AEbkpwZkjc=;
 b=mDBu3doasEz4t6YbgAEG7LLDUDUbEJYqg0/U4dy9J8+Tzv3RgnOce9H8
 qGjbBYZ1ZFWFfKxm9jJqAgkAnFwyUkKwpMD9Cx4pspiaCEdCPxB6ZHc4Y
 qiRkVx/LLzIj3u7Q5dH3xBDLJRuM0CFIiYlNigWU73Gjwhbym6O6029dR
 noSHYe2DBsvS/WJalTfNgbjqupoP6t6HtvYGjiX95iybciZkCPcrGu+ps
 /N51Y9J1Lrguj/DGOVGci+G2NSTR04Ll080T8b5N4UAJSjJk0347JUZ1s
 +TPFQwdBQmTzOjbhERPEN5tz475ptvU7dw89nVAKis1HmhuLfm9N5PiF7 Q==;
X-CSE-ConnectionGUID: zYscKcavSlaggH15pjebPg==
X-CSE-MsgGUID: QbIal+hWScyUwMej3+ipcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="97260061"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="97260061"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 15:13:05 -0800
X-CSE-ConnectionGUID: fmnSAbYWT1WVMISQuFM7IQ==
X-CSE-MsgGUID: 2T0SE7sBT9yWRXEkoh6zXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216706047"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 15:13:05 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 15:13:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 15:13:04 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 15:13:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVGV7Y8BCSLjqQj5okDgxCXYwV2rKLemVWBLT4xY//cb7SSBh4eDldNPbBG78yh/yaj1wPmTKpGIPhCYYxbudNXU+NL76gPP1guZL2nNVcvpky4sn4kzXq5CL6uBiXgsuQ7lK/B/6wM87hVYcYdTu45g10PFnW6XHYBQlTax8KS1zFhJc2rN3/7x/u5P4n89AiW7DEYkgXcp9DmkOuQxCKn0KbTFdoXL6YTOsWRVS0C2nZayr3efyvgsdnHl98ulATTEy9mVFbAyu7b1pFCkmYmSmZF42d2crGdcF1EVD4SO1wq/t3HcHoYyJNyzMfJEygx/6UTw27esJtu2uzuoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSZAlTlNcGJOztqWoWW8nNWXEqIkbj9hKEfLUw6mciE=;
 b=Vpmeo1H6wUyFU7EGtXNUS7LD4k79KaDYhWyM//rF3gWIDSAxBPxu4p95r9VpS4Ag6ZyqkKaIgrRsyhzpxnzxMKCI1Nu1HP2D8OB60685zGnEZX75s24FQoxe+VBOXxgwF+3x+V3FyBX6wsn6i7sY063SgiibDSYyEwU12DbaG1dQ3p7A/Pyoklk56/zCTfa4oFhifPSbcpGtNYnLcxWcRRtZXlqFakluDwVO6WMP6oJgE0bZ1ayXeYKZIncRdLTWtKQnORnNPhBKJaSHF5r2+ghEHP0UE9PIT03XrPhtRDHM0LLWea6xTondfUSBewdKcX9t8egunaBIBkrW5jyYQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB5106.namprd11.prod.outlook.com (2603:10b6:303:93::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 23:13:01 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 23:13:01 +0000
Date: Mon, 9 Feb 2026 15:12:59 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re?= for
 drm/xe/mmio: Avoid double-adjust in 64-bit reads (rev3)
Message-ID: <20260209231259.GA1516718@mdroper-desk1.amr.corp.intel.com>
References: <20260130165621.471408-2-shuicheng.lin@intel.com>
 <DM4PR11MB54567201F6778E27B128B018EA99A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB54567201F6778E27B128B018EA99A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: 931e786f-fc0d-44e0-22a6-08de6830c59a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u61gzSQWpxe0wILvIZNL+HFMlWe6ATa+GTHj+zVDdYSytrmdbZiZOvON/W04?=
 =?us-ascii?Q?vdpyWY7HzaUS0jMi8rn+v/bZayAm8WEglqNSxIcYdG3Gg81ixqKqR/BtnNyf?=
 =?us-ascii?Q?lhQ0psvC7ogsTLcDPPJaJVFmzgBL3e+3fmX22YRw17Oawa+hjPvkiEqpdlNv?=
 =?us-ascii?Q?TEU3On0CfhjaAv7PMFEqvi5lvRhgKi1+QOAx+j+eFGEkOm7ck+qGs7TxQ4jZ?=
 =?us-ascii?Q?L22qPTH6UaXjN7HKSEyck9RG/5PimTKWoTinKjtwJ9WtnBp3WUQCMqQWcrOF?=
 =?us-ascii?Q?c9j81oaA+mC3RN2mWO22hXfxh+d5XoTx5zc5Esf3nBuG/uk9uS2HwE555IiA?=
 =?us-ascii?Q?eCZLhbu8rqBq4xJAMaAsAh/9fhXKlWJwrFhTschnggMxyaki1x/UYf4JFpyI?=
 =?us-ascii?Q?q8uR82l27gIe82aaeYqlmbqcVfeyZqJFwoF97dazVL3fVG10PofGHMwAwmkZ?=
 =?us-ascii?Q?Pd3t9IKE+nLAcZOQX/YcMA/bjyQG7i9xYJovJC/ppLvxiZDqhCQY9ve+nG+B?=
 =?us-ascii?Q?C8ofd2BVUenp8AOVeDERSzv0sG1GTomU4pBLudO2zJ85qxRilxc74TXe385s?=
 =?us-ascii?Q?c8imivxO332tEUMwOnFFRnxhT+C7QBfaJSAOQxp83bkblIzdmesSYkYv3AQH?=
 =?us-ascii?Q?+3z9cx/P/h3h87p3bldyAvmZphpK8ON8G7Y2nWgab6WI5EFMosHsdX720BPg?=
 =?us-ascii?Q?FyW2mYypek4nEhq7LtrhhrCaJPBEGoluhkCf+MgWW8yP4D9axQuXZSfnHfKs?=
 =?us-ascii?Q?wVDFKnjGEZGw2wBbksCoBM7tf4oItKRZKM1oETDvyg8Xgz5MyEiYVSuFs3oM?=
 =?us-ascii?Q?GXoDYN1Pz5BG++howdq9tXXAPFg3YCQ+Vw3payITEWEzVq9W6JELDNXf4UwA?=
 =?us-ascii?Q?bLDkKJURZhGOussRClAdK2me8BaAPSHFU5/PmZcm6GseYhWkdt4FO4vQlYNv?=
 =?us-ascii?Q?Fp1gvTCCEEdE51GtLS58b+fyi/XcSouUGbLoXN75gJVvpfWvDkYTAcTdpukS?=
 =?us-ascii?Q?624avg46XFp5gI5T24qbKNCrGqsFP8wqdl0tZ27Fkmhqrr4Yd6LjSZD1mP2g?=
 =?us-ascii?Q?bZjj+cRtMIh/UrYCljKv8lpkv3vBGz9NnYArsq6SywO0AMy2QVSl2ZY+bbDs?=
 =?us-ascii?Q?Dhc//2j6VbbSfl2etf2uyqMYCqe6PrbWxAO63fJdCYTlxEH/DFEM0SH9JGzc?=
 =?us-ascii?Q?3PqrN4lBJtLkrQWFNcaLcEB7rMqDSz/Vbv30YazOZ1QWF/ekQD0ZpKPyWsZh?=
 =?us-ascii?Q?A7+KwE1S5ZkrkRqUrIWfwrGoO5Vizq/pIthmnUQI+ipkZAEALrIBCEiYNa6N?=
 =?us-ascii?Q?VdH68aaNiuHtPJ/JAVJJ2QytmCudWixa1V9K0iZgUyIpEIbtGxmoy7Zijiao?=
 =?us-ascii?Q?QWgz/Bp/3Qct0BAo/O1OY+N+UScT5MBaFIljzE88VigxCkbrTFk6jfwdog3B?=
 =?us-ascii?Q?q966PAhNa+BbnBLnYN0ELKamNKElkFpebw+Nk8LTmNJ6q/yNTTWTMT0x0ONj?=
 =?us-ascii?Q?gELuVIFR7WXxsY246If9Ce9It1f6WSMSK457zt02da2CN+Js1TCLLkOQgtln?=
 =?us-ascii?Q?ybEH/bu+KExuRJ/KXbk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G18YQBmIdLav9oR10BjzjHoEbtVdr6Ws6/2OLvlEs1PKvRlzGBZs+0fWx+9M?=
 =?us-ascii?Q?2VVePwK9ShHPNQXSSZHNuXsJAbUy7JyCTZ+9urpnQ1ql0901O0yxVaa7Dk7S?=
 =?us-ascii?Q?f3DuK1M7ktiQ2/06ZdfvxUtt+VTOniu0r22QGgRSHzKC1TDf/qV0Hfza4Y9n?=
 =?us-ascii?Q?ccd0ZrvU7Sal3Yz3Tr0cTxgPvp6CRGvtrnmxWhCp3uw1/x5qGmMHdhMd3nZ6?=
 =?us-ascii?Q?PhEbzW0lamJ9Ift77SXlNUqOVw2rfNqLRW0o1EcZWQ1rDwiutY7tzoeMGGh+?=
 =?us-ascii?Q?TyWroD87VJO62pRWmHIxi91VMOh5unT2M66tITwY1yDSH4qn1LaIXJ51+NJS?=
 =?us-ascii?Q?KekQL5iLIPTjnp9JR9137dRjlJxBalPVQgfOaZO0CzLfPoKh5MN9WaSghZVi?=
 =?us-ascii?Q?7IvzmZR9igAqZO75ozF2PWaVKVPnt2uR3i9fVDKzDOymqHflhyL+v2He2sRY?=
 =?us-ascii?Q?WsqXtk5YcZ3M9fqGlPuYQB7egSbpWtI8A3XiLgbyMHyZvVgz76+qtpj60Z55?=
 =?us-ascii?Q?MiB1egxJzyqILlArzm4fFp2pz/bcy1c47/dzv9Hjr5763RQMAHf6LMLiveNX?=
 =?us-ascii?Q?XvhpumryxXdqAWW2/9wcM0E3187k3axtUxreufwB2zH2SZcU9IEyYhhEpRaY?=
 =?us-ascii?Q?5RGT6ddb4LPJBwMGquCez6MXHV0aapw1PAIcaIB0aWSxgxgqc07XZjkmp6TO?=
 =?us-ascii?Q?i1USD8P4AXRt49ERMPR+Izv8MbPeqUWFEqO+cwwaErSB1tXA1Z5cnrpP29Eu?=
 =?us-ascii?Q?ep74sOSDtsfLp5PMOo1dW/7II4r/3eLUJ2U4+xm0nKS3AM7GxnSGGtDlDpWU?=
 =?us-ascii?Q?sq3UItwT12sa7exvwgdZDbV1+3iTRvOEh91jQzH0bmSoKclf/d0xtpzzFkjx?=
 =?us-ascii?Q?jEdxkAPPcOsXDCajBVMg0KYo/3zc5w/z42XGDEOXYSsgRUDkfZ1cp/PA1R8S?=
 =?us-ascii?Q?qp2Syel2OgFScvyrh7zMKv1HC5GhhjX/Tlld/UMnuwygfLfAKR1cmGo2rYRb?=
 =?us-ascii?Q?I3eH7TIhzt1jj+NwDE+hRoM9WToE3KJPp6hrtwyDPODrtkww0PLZDjQgmxx1?=
 =?us-ascii?Q?aTmvk+p5gJ9VvBVMmMG6m6CDkGJz0OmlXb2l3MpIZV+P4tlFodCyluct8Uf4?=
 =?us-ascii?Q?jGMUkWJxasPvnarjrkpNJ+HCVWCdsBykNKMyXRu/MfGeqxpp/zmwoRwWt2dH?=
 =?us-ascii?Q?KcVgEmcVVL8EUFc2vYgBcOZKJZ7U/4NHEjh/GMvt0ejLmiDw8FW5yUmCrxMN?=
 =?us-ascii?Q?YbLIlMK31FjuEDcVtG4eV0Q6owXC7kQ+gFV0unnQzPjGF3mFIwo4U2YQs68S?=
 =?us-ascii?Q?5a/tXs3QS+6quG/BruU/fPiJt/NKIGIhaKCOank74m7fw4Qq6EafCWcPKHfL?=
 =?us-ascii?Q?B0eFUwA8QE6J38bZqHOhi5saIcf1Vhl5oJQSjTUgDdlt0KqWZRex+VHHWg3T?=
 =?us-ascii?Q?hiwUWGO+TusM/lbx/DdjipmPnQm/0gAKuKNsP6PbItcX0kK2IGjB81dUb/WW?=
 =?us-ascii?Q?o+abu4bH1D88uEfGzVmW+Pa8dYivncqTVQNh3CphUnioH8r5YxseeEVSnEbP?=
 =?us-ascii?Q?B/TZB5G4QoaAIgpIvifqwsuVl9GURJ1jglEVtuXWNxMF2yCkOzgN2L1nqx0L?=
 =?us-ascii?Q?YiD6olYZbggLYn3h94x5iKHczLZ1fwdNX4J15inDeZbPvxqHgj9ZptR5Tbfv?=
 =?us-ascii?Q?vo+u8BJYEXZvWFDrMSbneg19owHJYZ0snhf2VI6PkL95CVEQ5NuIq9JZKCJr?=
 =?us-ascii?Q?i2w3ND4Z8eteJP0xAwYTmNTpYuyZq+8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 931e786f-fc0d-44e0-22a6-08de6830c59a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 23:13:01.7532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdoi6TWEn+mozx9rDNB5J+AyYnJwkErUC6VVzVvzyaDNya5RyZ2XjJ9DjC2wevmYufSEkOVo4PwdLbaJqCZKOIqZq898oROUJq/Ce/0lus0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5106
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

On Thu, Feb 05, 2026 at 04:31:22PM +0000, Lin, Shuicheng wrote:
> >IGT changes
> >Possible regressions
> >igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
> >shard-lnl: NOTRUN -> SKIP
> >igt@kms_vblank@wait-forked-hang:
> 
> >shard-bmg: PASS -> FAIL +1 other test fail
> >Warnings
> >igt@kms_rotation_crc@sprite-rotation-90:
> 
> >shard-bmg: SKIP (Intel XE#3414 / Intel XE#3904) -> ABORT
> >igt@xe_module_load@force-load:
> 
> >shard-lnl: DMESG-WARN (Intel XE#7145) -> ABORT
> 
> I checked the failure logs, and I don't think it is caused by my patch.
> Thanks.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
> Shuicheng

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C57EFD377B
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 18:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A69810E7E5;
	Wed, 25 Feb 2026 18:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yl8XLcsu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98C910E7E5
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 18:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772042902; x=1803578902;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dpzP9Pf1sh+4mtzS+fv8kNNTVEf+76WJdDHD18phlOQ=;
 b=Yl8XLcsu79NcByap5ogr+Pv+8QQWkffDCVugw2ozV/HlNmILkuI0FIDK
 9DnLX4hhRz/pyZR0n8l3dY1wHJtiaRnBEkjVgQvIslm0BgM46u3RPKltM
 dt3+8sLEKYFjy51YtmZUTXiQxwwGoEwofIXVR6VerPhng5NLaWmDf/+2/
 huLZdoGpvmfsg6ga7xxwWQzX3KvuZMEtx6vWq2bphF6088HkYFachkmVm
 GmNYtRp2g2K8NQLLSZWG5C1H2CSadhA3cX/NxVV+a+FN/7cxf3t2FnMAw
 Gt1xxLd7cPw4StYqhoWe40sUDKfPLk7GEvC3fgfimg80Xa6vVlD369BNp Q==;
X-CSE-ConnectionGUID: PKeN/N/dRmyoTXi/ELFduQ==
X-CSE-MsgGUID: hblT51t6TkuJTCR5P0sdXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72794924"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="72794924"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 10:08:22 -0800
X-CSE-ConnectionGUID: VmE0rJgATsu0uw/b/eaLXQ==
X-CSE-MsgGUID: aVdC4FwoQu+foKYTlOsJag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="214586897"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 10:08:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 10:08:18 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 10:08:18 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 10:08:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpFkYp8QgHspnZluLbgOPjkkE9yb07dHMyp6/FlejbV4pA95OJPCdu3/m3s8NppNIr5v8XmJTY6rzc1SoK7E8RT2T4qW37Hdoa3CdPiFDJjF/jlZjpTILzkxNGLdSo+z0aLxd+qFJ+Zfz4vqNgxI00ko9yPZKK3g9Riwf6iyqsoPZVAcIJKuvLF0jPpFwc+QCcnWxc7JfO40arwz4NFqeu6jo9z9/ovSkAfcqok6HXv5cOzL28zRKOQzjIDhDuc6+dqqnZkd/x/qECHhW8qkEH6XzxXvrv12FCyLeFXLgYIxENew2lSITgbpbdJYziLc3e0Iqn615FERJXsNh7mhtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QzNZa2l4UphswcGYqBBRPkIj+yKCREYvMyC39nfjIU=;
 b=sL1idsoAozWI6p1HwJru2osDvpaM7vRAGHNLqcF4TY/SrFsNBfYVI3M8jNTBGFjwVajnKorNc9NwkJCw0X83YJDWa7/v4WcOZBJ28ki4X18dZq58ulHeW2RNqDblK0w7r2kVJh4S7+rKvrQnQO3Qw/0yDyVw6GT25Viqvw5os/qOObNxUTZnOliLe8X4X8Qs0AwkW36bGb34qG147k+jg5TNhQDXmr+mlvrU0WADThQNOfv6hRaevcDRNc0n4rbyAG0I91Z0JPp+wkNWeecXIILT1L9DLukFRYNWBRjOJdSbTTRDpWXcNh9Ec2iBOG6rvuJaOUl1WufjhP8dwIVytA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5166.namprd11.prod.outlook.com (2603:10b6:a03:2d8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Wed, 25 Feb
 2026 18:08:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 18:08:14 +0000
Date: Wed, 25 Feb 2026 10:08:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <francois.dugast@intel.com>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe: Split H2G and G2H into separate buffer
 objects
Message-ID: <aZ86i8DWtNikdN6k@lstrano-desk.jf.intel.com>
References: <20260218043319.809548-1-matthew.brost@intel.com>
 <20260218043319.809548-2-matthew.brost@intel.com>
 <3033abb2dfe6755ff3559a480e0d21b5665436d5.camel@linux.intel.com>
 <aZ3N+CwyKRARMW6m@lstrano-desk.jf.intel.com>
 <b052bef6590a73a3ea726b81b1af55dea36db272.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b052bef6590a73a3ea726b81b1af55dea36db272.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0324.namprd04.prod.outlook.com
 (2603:10b6:303:82::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: 5866b27d-68df-4c3b-9734-08de7498d802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: tO324xwGx/tJHuIjHwE+7eTbrT/Gn0AgLBwdyi11x+os6WcH+l2BNsRwAuFDuIcOlaLTs3C1inC9fWwShEdAopbBOq4BhP6GO6d30SzRwkZL1KBAGgvkCN2j+kcVMeo8F/HP/tB1oglq33ihqBHHghgdlyN85XOuOyikVj3l1EcoM3SpHXHnr3PyNrciSLjiaiI0pDA5eMUrmWvYRH2bWYelYK42XLI8C1RsbkvnNanB2vLhcLflz6xR9Ad3+wIQySijbbWAehaAH87zqyHol4to50Q9KdvxbPofApBILLW7XzBI+A7DjQ+d8jMWI/9BRUe6NsyR+OJT7P1CkcCOaOJPEi8YT1aZjs2yM1tL+KGJmZmmwPlBCEfElYhgNcO1Ar2aMeYgAyEfnUV09zWjrc3uns7EvYlOXoE+EgDGxh6txCFO5yZvmZaVMskHMbZrhO48UT3nMBfieE4/E/e0pDFWVEX+rJxQgdJ46mYPphI+aD1cRtmFcA3jijg/odH5Jbjfk6PFDZxyfOYZj4EkcDg2ZXvWtQnA3406RudzvWUH7rAFAXrFkh7fpppumfzcntkfHJsUjSsBKla4ncQ1i9QwZScZMfyq2LpD70beOxC1qvpbfqdEstQtOu2QkP/sq+21TiZuKYLVGqnPzw5ZAi1MEXsMpvMbcbi75zuMiR/iG5Hiv4p0RQGITXzm0R9JDKjfipafRfLKadOEVQJemH1CIxWI0qWsNpyLItEAWQA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1hScWQ0b3BJcWEwK1NpM1NUV05iV25QL3J5YWJzNXBCbk1Ua1pjVVp4dDM0?=
 =?utf-8?B?T1FuWEVEQktxSmdIUHlFZ3NqSzVJelpHMiswS2dvanBITDlLaGJPYjgrMVh4?=
 =?utf-8?B?SEhBUTBlQlFrZ2pYaWp2NXpMWkFKNkNQMyt2dWNZU2dBVWxUWlpES1ducExR?=
 =?utf-8?B?MVAycXh1a3A4Z09wNXZtbDdUaHZ1KzRYTDFuVFRnUEd6OVlyWjd4V2ZydDJG?=
 =?utf-8?B?VFdjR2ZKM2MyOHZ4b1hHRVFkZ3BwdndzV1ZUUkg2ZWQ0TEMyanFuQTBEbG1D?=
 =?utf-8?B?cmtCVUVIVUtDS3lJMmxMRkZRdFVkOXJmOG4yZDQreVZTS1JpVE9mbmFSZk9x?=
 =?utf-8?B?eGhTODBCQWpLRzlBS1UwWEIvQUx6Z2lhWkVlRFh5TmN2QS9OU214WERDMTBS?=
 =?utf-8?B?SHpwSFNpb3l0NFVZS01jaDBkS09pLzZ6NFQxWTI3QVF1YU1XM01VdnJaUmdz?=
 =?utf-8?B?SlhKVVRiaWNCWEh5UWZzVTFuUFNiQ09EdkkrR0RrRCtTN2xvaGZPd0xqNFNS?=
 =?utf-8?B?cVpIdXJ4azVGUE5wekc2NFE1SmpmV3dIL1p5aUZNejlnZFRUcmlQNWRiZTJk?=
 =?utf-8?B?ZjQxMkdWT1l5RVo2Y041Qm9PdW9HQ3pVbGdvSUhnWnNFcjNJcExSc0JqemJO?=
 =?utf-8?B?VHFlcWM5UVJJNTQwL3NaN0o1YjE1TWp3KzZHOXZsQ1ZLMm5BUDUwOWs2Y2ty?=
 =?utf-8?B?Tk56VnJ5T1pURzlQVG5wamlpbEgzSkk3aXlXZmIweGE5TnZlNHQyWmRDS21Q?=
 =?utf-8?B?SjhLNnVCRlY2b2wxY3hkcWhncnNFdUJEVjgvTVJrdGQrL1IzRkhJU2k5djdZ?=
 =?utf-8?B?cGpKdVF1TGNheXRlckhlRHNPUGRzem5CaUJFV3FjV2hwYlhxWlhJNnpQYW84?=
 =?utf-8?B?ejRwQjFvdGRzcE5zODlVVzlBVGVYbCt6d1RYWXFTa1BMMkhZcHJVbVVDalQv?=
 =?utf-8?B?cHF0RlptOGcwdGZrWWVwcS9DY0ducit0bmRsZmpEems5TWN6U3hROFNLY1RX?=
 =?utf-8?B?RVZiQ0NqZEtTYVRNQUhlQ0RjRWJuMmRtTDgxbFRHTm1JL080VkxUcnBsdW5k?=
 =?utf-8?B?dStMVVdVS3p6azFLU0o1VWZHWExDWlJpTVJCR1YwbnlJN3lzMzkzNnhrZkZE?=
 =?utf-8?B?dE5yTFhtcFhEZEtsbmcwSWN4aUpJWFR6azB4Nk5lUndYamIzUFBKdHpJalpF?=
 =?utf-8?B?Q1hoUmJqQngxUnRxVUkzbkc1b01QZ25lTkxPdnVGeE1LdVJZQVZDaWNIU3dv?=
 =?utf-8?B?cklrOUN2ME5UOEk5Qkh5V21Sald5eWhIa3RkK3llcUhWeTByK3Z3aHNEZTh0?=
 =?utf-8?B?UzU3Ums2T0FveTF6cUhwQnBPK2Y0Y1ZrWk1PNHpGRlJteTZsTEJXTEZJZEZ3?=
 =?utf-8?B?alRLNVBweDNKMmhGNWpWcmlUM3lqQkFsclR6c2gwb3IyZWF0SThqRDVOSGhL?=
 =?utf-8?B?UW94WmJFUFJ2dVRpenlPYm5aTGRFa2FIYlBFZy82eHByaEtsVk4vc1dCeUk2?=
 =?utf-8?B?NUoxOGRicnpYWGNlY0pRc2FoTHJBSEUwa09zUlFNRmVaQy8vRXdTbTNCRDhy?=
 =?utf-8?B?QkU1ZkViaGFhbDB5OXE2TFdpQXBCOTlFemt6anE4NTFrL21hVUMzaEVaZisv?=
 =?utf-8?B?eVF5cVpvd1lTS2FQRmdEWmZLZUhZTjM1SDRVWkZrL1MwMEl5clFIRFZsVWNU?=
 =?utf-8?B?QTJHS0tNT2w1ZmVHTWdENHZlaUcrZGxwWXg5eEtocGNnZThEajdleHZRY0xJ?=
 =?utf-8?B?K1NRVENvYjFidy9Oc1psRGpWbTVnN01zbUlSSCtrblp1YWo2ZG9zUUhqMVBH?=
 =?utf-8?B?bThUMlpJMWNQTUpjK3FJcE15TitDV2ZzZGUvanduVmJVYUdxanJqVmtmNTI5?=
 =?utf-8?B?ayszZjlkUENjYWwzcU9GcjdCVE1Ya2c0a3AwRzBnK3kza2RValh4ZlNGVXlv?=
 =?utf-8?B?RURaYXcxVDVvWHdVODVJc05scmM2TmdYb25PN0Z2cnlEdUtTUUxCTithazF4?=
 =?utf-8?B?cDF3YStNTDl6QzJsTG1MNVpkbjNIci9HRFJzamRIWWtoUGJWYVByQnp0S0NL?=
 =?utf-8?B?TmgzY0JHbzNlTS9paHUzcXhnTlNEaWdjZGlaSlM5V2FEVjBSRVRaS1N5SXE5?=
 =?utf-8?B?UXIxbERsWk50ejJRVUtlcjNBc0loSitleHpTSVFhVC96YTc5dFR5M2ZvTzdK?=
 =?utf-8?B?WFF3L2xIV3ZESjBMUGRoeVowaXM5NVlkMWp1cGFzbU85a2dBcXpFUFV1M2lK?=
 =?utf-8?B?OG05cWg0Y21nVzAwUWVudjMvQi9XVjdjdzFhM0tna1BMOS9BelRxb1ZDa3dH?=
 =?utf-8?B?RnVvRGdDTWtKOUJ3UU9zQ1k0RDE2blREOGN4b2h6OU1nczJOOG96VGJidklR?=
 =?utf-8?Q?q0U2wIWvqPSv7AXc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5866b27d-68df-4c3b-9734-08de7498d802
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 18:08:14.2875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ML7v8HIj47QtZCBnOioyZ+VIhzH0Vy0asf5GBdi2+4tTim3S+MKMd0jHucqTPHmoPwET9TelOo+RkTLTy646IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5166
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

On Wed, Feb 25, 2026 at 11:55:28AM +0100, Thomas Hellström wrote:
> On Tue, 2026-02-24 at 08:12 -0800, Matthew Brost wrote:
> > On Tue, Feb 24, 2026 at 04:58:35PM +0100, Thomas Hellström wrote:
> > > On Tue, 2026-02-17 at 20:33 -0800, Matthew Brost wrote:
> > > > H2G and G2H buffers have different access patterns (H2G is CPU-
> > > > write,
> > > > GuC-read, while G2H is GPU-write, CPU-read). On dGPU, these
> > > > patterns
> > > > benefit from different memory placements: H2G in VRAM and G2H in
> > > > system
> > > > memory. Split the CT buffer into two separate buffers—one for H2G
> > > > and
> > > > one for G2H—and select the optimal placement for each.
> > > > 
> > > > This provides a significant performance improvement on the G2H
> > > > read
> > > > path, reducing a single read from ~20 µs to under 1 µs on BMG.
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > 
> > > Perhaps one could experiment with reading the data from the g2h bo
> > > using MOVNTDQA, like the write-combining memcopy. That would avoid
> > > caching the data and the GuC having to invalidate the cache line
> > > while
> > > snooping on the next write.
> > 
> > We can try that, but G2H messages are variable-sized, so I believe it
> > will get a little tricky. Once these are system-memory reads, I
> > recall
> > G2H handling being something like 15 per µs of page faults (maybe
> > that
> > isn’t correct — I’ll double-check), and that included my not-yet-
> > posted
> > caching implementation, which also takes a spinlock, examines the
> > page-fault cache, and chains the fault onto a list. So I don’t think
> > this will end up in the critical path.
> > 
> > > 
> > > But that should probably have a less impact, but perhaps speeding
> > > up
> > > GuC writes.
> > 
> > We can play around with this and bounce ideas around. On the H2G
> > side,
> > xe_device_wmb() before the tail update is actually fairly expensive,
> > so
> > if we can use some asm instructions to avoid that, it might be
> > worthwhile.
> 
> That is probably the latency of flushing out buffered writes. I don't
> think there is much to be done on improving that.
> 

I came up with periodically advancing the tail and issuing
xe_device_wmb() when acking a storm of faults. For example, if we need
to ack 40 faults at once, we send out the first few acks immediately,
then rate-control the rest. This gives roughly a 5× speedup (e.g.,
increasing from ~3 H2Gs per µs to ~15 H2Gs per µs).

I'm asking the GuC to apply the same strategy when generating G2Hs
during fault storms as well.

My KMD portion of this should be posted shortly as part of fault storm
caching.

Matt

> /Thomas
> 
> > 
> > Matt
> > 
> > > 
> > > /Thomas
> > > 
> > > 
> > > > 
> > > > ---
> > > > v3:
> > > >  - Move BO to ctbs h2g or g2h structure (Michal)
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_guc_ct.c       | 67 +++++++++++++++++++---
> > > > ----
> > > > --
> > > >  drivers/gpu/drm/xe/xe_guc_ct_types.h |  4 +-
> > > >  2 files changed, 47 insertions(+), 24 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > index 8a45573f8812..ea07a27757d5 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > @@ -255,6 +255,7 @@ static bool g2h_fence_needs_alloc(struct
> > > > g2h_fence *g2h_fence)
> > > >  
> > > >  #define CTB_DESC_SIZE		ALIGN(sizeof(struct
> > > > guc_ct_buffer_desc), SZ_2K)
> > > >  #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> > > > +#define CTB_G2H_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> > > >  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> > > >  #define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE /
> > > > sizeof(u32))
> > > >  #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
> > > > @@ -279,10 +280,14 @@ long
> > > > xe_guc_ct_queue_proc_time_jiffies(struct
> > > > xe_guc_ct *ct)
> > > >  	return (CTB_H2G_BUFFER_SIZE / SZ_4K) * HZ;
> > > >  }
> > > >  
> > > > -static size_t guc_ct_size(void)
> > > > +static size_t guc_h2g_size(void)
> > > >  {
> > > > -	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
> > > > -		CTB_G2H_BUFFER_SIZE;
> > > > +	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE;
> > > > +}
> > > > +
> > > > +static size_t guc_g2h_size(void)
> > > > +{
> > > > +	return CTB_G2H_BUFFER_OFFSET + CTB_G2H_BUFFER_SIZE;
> > > >  }
> > > >  
> > > >  static void guc_ct_fini(struct drm_device *drm, void *arg)
> > > > @@ -311,7 +316,8 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct
> > > > *ct)
> > > >  	struct xe_gt *gt = ct_to_gt(ct);
> > > >  	int err;
> > > >  
> > > > -	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
> > > > +	xe_gt_assert(gt, !(guc_h2g_size() % PAGE_SIZE));
> > > > +	xe_gt_assert(gt, !(guc_g2h_size() % PAGE_SIZE));
> > > >  
> > > >  	err = drmm_mutex_init(&xe->drm, &ct->lock);
> > > >  	if (err)
> > > > @@ -356,7 +362,17 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > > >  	struct xe_tile *tile = gt_to_tile(gt);
> > > >  	struct xe_bo *bo;
> > > >  
> > > > -	bo = xe_managed_bo_create_pin_map(xe, tile,
> > > > guc_ct_size(),
> > > > +	bo = xe_managed_bo_create_pin_map(xe, tile,
> > > > guc_h2g_size(),
> > > > +					  XE_BO_FLAG_SYSTEM |
> > > > +					  XE_BO_FLAG_GGTT |
> > > > +					 
> > > > XE_BO_FLAG_GGTT_INVALIDATE
> > > > > 
> > > > +					 
> > > > XE_BO_FLAG_PINNED_NORESTORE);
> > > > +	if (IS_ERR(bo))
> > > > +		return PTR_ERR(bo);
> > > > +
> > > > +	ct->ctbs.h2g.bo = bo;
> > > > +
> > > > +	bo = xe_managed_bo_create_pin_map(xe, tile,
> > > > guc_g2h_size(),
> > > >  					  XE_BO_FLAG_SYSTEM |
> > > >  					  XE_BO_FLAG_GGTT |
> > > >  					 
> > > > XE_BO_FLAG_GGTT_INVALIDATE
> > > > > 
> > > > @@ -364,7 +380,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > > >  	if (IS_ERR(bo))
> > > >  		return PTR_ERR(bo);
> > > >  
> > > > -	ct->bo = bo;
> > > > +	ct->ctbs.g2h.bo = bo;
> > > >  
> > > >  	return devm_add_action_or_reset(xe->drm.dev,
> > > > guc_action_disable_ct, ct);
> > > >  }
> > > > @@ -389,7 +405,7 @@ int xe_guc_ct_init_post_hwconfig(struct
> > > > xe_guc_ct
> > > > *ct)
> > > >  	xe_assert(xe, !xe_guc_ct_enabled(ct));
> > > >  
> > > >  	if (IS_DGFX(xe)) {
> > > > -		ret = xe_managed_bo_reinit_in_vram(xe, tile,
> > > > &ct-
> > > > > bo);
> > > > +		ret = xe_managed_bo_reinit_in_vram(xe, tile,
> > > > &ct-
> > > > > ctbs.h2g.bo);
> > > >  		if (ret)
> > > >  			return ret;
> > > >  	}
> > > > @@ -439,8 +455,7 @@ static void guc_ct_ctb_g2h_init(struct
> > > > xe_device
> > > > *xe, struct guc_ctb *g2h,
> > > >  	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
> > > >  	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct
> > > > guc_ct_buffer_desc));
> > > >  
> > > > -	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map,
> > > > CTB_H2G_BUFFER_OFFSET
> > > > +
> > > > -					   
> > > > CTB_H2G_BUFFER_SIZE);
> > > > +	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map,
> > > > CTB_G2H_BUFFER_OFFSET);
> > > >  }
> > > >  
> > > >  static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
> > > > @@ -449,8 +464,8 @@ static int guc_ct_ctb_h2g_register(struct
> > > > xe_guc_ct *ct)
> > > >  	u32 desc_addr, ctb_addr, size;
> > > >  	int err;
> > > >  
> > > > -	desc_addr = xe_bo_ggtt_addr(ct->bo);
> > > > -	ctb_addr = xe_bo_ggtt_addr(ct->bo) +
> > > > CTB_H2G_BUFFER_OFFSET;
> > > > +	desc_addr = xe_bo_ggtt_addr(ct->ctbs.h2g.bo);
> > > > +	ctb_addr = xe_bo_ggtt_addr(ct->ctbs.h2g.bo) +
> > > > CTB_H2G_BUFFER_OFFSET;
> > > >  	size = ct->ctbs.h2g.info.size * sizeof(u32);
> > > >  
> > > >  	err = xe_guc_self_cfg64(guc,
> > > > @@ -476,9 +491,8 @@ static int guc_ct_ctb_g2h_register(struct
> > > > xe_guc_ct *ct)
> > > >  	u32 desc_addr, ctb_addr, size;
> > > >  	int err;
> > > >  
> > > > -	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
> > > > -	ctb_addr = xe_bo_ggtt_addr(ct->bo) +
> > > > CTB_H2G_BUFFER_OFFSET +
> > > > -		CTB_H2G_BUFFER_SIZE;
> > > > +	desc_addr = xe_bo_ggtt_addr(ct->ctbs.g2h.bo) +
> > > > CTB_DESC_SIZE;
> > > > +	ctb_addr = xe_bo_ggtt_addr(ct->ctbs.g2h.bo) +
> > > > CTB_G2H_BUFFER_OFFSET;
> > > >  	size = ct->ctbs.g2h.info.size * sizeof(u32);
> > > >  
> > > >  	err = xe_guc_self_cfg64(guc,
> > > > @@ -605,9 +619,12 @@ static int __xe_guc_ct_start(struct
> > > > xe_guc_ct
> > > > *ct, bool needs_register)
> > > >  	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
> > > >  
> > > >  	if (needs_register) {
> > > > -		xe_map_memset(xe, &ct->bo->vmap, 0, 0,
> > > > xe_bo_size(ct->bo));
> > > > -		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo-
> > > > > vmap);
> > > > -		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo-
> > > > > vmap);
> > > > +		xe_map_memset(xe, &ct->ctbs.h2g.bo->vmap, 0, 0,
> > > > +			      xe_bo_size(ct->ctbs.h2g.bo));
> > > > +		xe_map_memset(xe, &ct->ctbs.g2h.bo->vmap, 0, 0,
> > > > +			      xe_bo_size(ct->ctbs.g2h.bo));
> > > > +		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct-
> > > > > ctbs.h2g.bo->vmap);
> > > > +		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct-
> > > > > ctbs.g2h.bo->vmap);
> > > >  
> > > >  		err = guc_ct_ctb_h2g_register(ct);
> > > >  		if (err)
> > > > @@ -624,7 +641,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct
> > > > *ct, bool needs_register)
> > > >  		ct->ctbs.h2g.info.broken = false;
> > > >  		ct->ctbs.g2h.info.broken = false;
> > > >  		/* Skip everything in H2G buffer */
> > > > -		xe_map_memset(xe, &ct->bo->vmap,
> > > > CTB_H2G_BUFFER_OFFSET, 0,
> > > > +		xe_map_memset(xe, &ct->ctbs.h2g.bo->vmap,
> > > > CTB_H2G_BUFFER_OFFSET, 0,
> > > >  			      CTB_H2G_BUFFER_SIZE);
> > > >  	}
> > > >  
> > > > @@ -1963,8 +1980,9 @@ static struct xe_guc_ct_snapshot
> > > > *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bo
> > > >  	if (!snapshot)
> > > >  		return NULL;
> > > >  
> > > > -	if (ct->bo && want_ctb) {
> > > > -		snapshot->ctb_size = xe_bo_size(ct->bo);
> > > > +	if (ct->ctbs.h2g.bo && ct->ctbs.g2h.bo && want_ctb) {
> > > > +		snapshot->ctb_size = xe_bo_size(ct->ctbs.h2g.bo)
> > > > +
> > > > +			xe_bo_size(ct->ctbs.g2h.bo);
> > > >  		snapshot->ctb = kmalloc(snapshot->ctb_size,
> > > > atomic ?
> > > > GFP_ATOMIC : GFP_KERNEL);
> > > >  	}
> > > >  
> > > > @@ -2012,8 +2030,13 @@ static struct xe_guc_ct_snapshot
> > > > *guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> > > >  		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h,
> > > > &snapshot->g2h);
> > > >  	}
> > > >  
> > > > -	if (ct->bo && snapshot->ctb)
> > > > -		xe_map_memcpy_from(xe, snapshot->ctb, &ct->bo-
> > > > >vmap,
> > > > 0, snapshot->ctb_size);
> > > > +	if (ct->ctbs.h2g.bo && ct->ctbs.g2h.bo && snapshot->ctb)
> > > > {
> > > > +		xe_map_memcpy_from(xe, snapshot->ctb, &ct-
> > > > > ctbs.h2g.bo->vmap, 0,
> > > > +				   xe_bo_size(ct->ctbs.h2g.bo));
> > > > +		xe_map_memcpy_from(xe, snapshot->ctb +
> > > > xe_bo_size(ct->ctbs.h2g.bo),
> > > > +				   &ct->ctbs.g2h.bo->vmap, 0,
> > > > +				   xe_bo_size(ct->ctbs.g2h.bo));
> > > > +	}
> > > >  
> > > >  	return snapshot;
> > > >  }
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > > b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > > index 09d7ff1ef42a..46ad1402347d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > > @@ -39,6 +39,8 @@ struct guc_ctb_info {
> > > >   * struct guc_ctb - GuC command transport buffer (CTB)
> > > >   */
> > > >  struct guc_ctb {
> > > > +	/** @bo: Xe BO for CTB */
> > > > +	struct xe_bo *bo;
> > > >  	/** @desc: dma buffer map for CTB descriptor */
> > > >  	struct iosys_map desc;
> > > >  	/** @cmds: dma buffer map for CTB commands */
> > > > @@ -126,8 +128,6 @@ struct xe_fast_req_fence {
> > > >   * for the H2G and G2H requests sent and received through the
> > > > buffers.
> > > >   */
> > > >  struct xe_guc_ct {
> > > > -	/** @bo: Xe BO for CT */
> > > > -	struct xe_bo *bo;
> > > >  	/** @lock: protects everything in CT layer */
> > > >  	struct mutex lock;
> > > >  	/** @fast_lock: protects G2H channel and credits */

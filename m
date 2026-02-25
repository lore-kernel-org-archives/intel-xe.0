Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B0DFD377A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 18:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854E010E199;
	Wed, 25 Feb 2026 18:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCAzNArZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3787E10E199
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 18:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772044375; x=1803580375;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wV2gh8x9lRK2GuFoyqZ3fGtws70U2YJnGRmaStTveWQ=;
 b=eCAzNArZ46SY5FkFkObolSBU6pk0J5Kp1DH14+9fZTiFskKA4bIYeIJb
 FGEk6HfNfkNzS1SberrDdRHS6gLi8/3sKSt8G78wHQUfiu+wTzWXQO+4D
 zTpHcaly1R/osS+VN4w7Qa+aBa3ibf4sNW18x3IZSpuNxg/tSVh73QzUK
 S0MybKFgKJbdBsvFlMrjgnm521mFobEiJMqh68NIBPI6S1oeqB2ax/aJ0
 ejSK8BWLu+3Jwde8mdzecx1mFb1sSGJ/klrsSzULXGYFiDBbTUp1LaOVo
 Ue0O167lY0fj+63id140JCLRq2oAM5dnFcjKEL5WS+/FNYFXIq27Al9AS w==;
X-CSE-ConnectionGUID: rL0ek6oMS9KJGLskPjMCug==
X-CSE-MsgGUID: 5KM8zYfIRvC280vmxIraFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="83718325"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="83718325"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 10:32:53 -0800
X-CSE-ConnectionGUID: yFeS1/NdRAiwY0Na+YblUA==
X-CSE-MsgGUID: O4dFaqTRT72uK1lZuE+Ttg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="216458411"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 10:32:54 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 10:32:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 10:32:52 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 10:32:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvtWrCRRMmtrpxsaHlb5Ct8qU8piADcVwS58+ZLHanA7TJcL+PdlIga539oRwPgUQBCKm/uX/U546ajAyEpfVjSRxD1UE6NK7JpstomAV2mbmv8SeGopkV5adUWpaoExYUSIFRGXDv5okpXzcdJQT2q9R/ygZIRyoFoWpU6jzXOZLDqqrC1TVS89coyhrb7il4R4xgMzTiX6cTzrLRUXTwUvIsEv161G756jdVrl8FeTh5uYN8CLBjc86xkVm1cmFUe9vRd6H5AOAH4gmWDCgjfXq4lSWZagrLxENwqmsuL1mbg4/rfHzU0HHMjo0ut+lGCkJykmzPA0VrjbtcLd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kHIOPXnrj8YsVs9n/Pa8681+DnuGpPPifKKA8H102Q=;
 b=GmmpvbFzp02SXFngpudXuIQG6XQzygkzL8tRLAxC6gPlRpYlQdh2E8wkyJrW6vXJo0ECoqnPpeab7ytL+in3b1e82Z6LviLNFunlnjHQ8zStXPYcjJCXq/5vtFC7DGOGuIaz1VxZnJ+YSfPoh7A7GFk6FlTNo7vir+YlFFZZNQg+LAv+eF9pIC2RVhe0zq9AidH6lfZbZobZuVuRTZWRPbAkUwuP2RJv102eZdMOtwecEg2EMjPkllEnzixlSxgfxF4EeDWFcPl0q5g3nG9Q/DUobamXr74oJv8ky8wYxtTlkMPt6fZtR2g7yZcNE31IUdCHGbV13d7G+VZTsRPzHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 18:32:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 18:32:48 +0000
Date: Wed, 25 Feb 2026 10:32:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
Subject: Re: [PATCH v5 6/9] drm/xe/madvise: Implement per-VMA purgeable state
 tracking
Message-ID: <aZ9ATVr6L3+U+CeZ@lstrano-desk.jf.intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-7-arvind.yadav@intel.com>
 <823a16af4733d5b82470b6ed6da203de09644caa.camel@linux.intel.com>
 <5aaab739-2291-441e-937b-746495ce7d58@intel.com>
 <aZ3TpuSFKzY4y9sg@lstrano-desk.jf.intel.com>
 <14753c79-df95-4c14-b78b-cbee2670dac4@intel.com>
 <de396c52e6ca7377cd9f6e58b172b2232da4de4c.camel@linux.intel.com>
 <aZ67AoEmxHz9rkly@lstrano-desk.jf.intel.com>
 <1fd477061dedf58f0e23d6b8e6715fdab50f88ef.camel@linux.intel.com>
 <02b79322-f378-4e4f-befc-3f9bba9f7830@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02b79322-f378-4e4f-befc-3f9bba9f7830@intel.com>
X-ClientProxiedBy: MW4PR04CA0203.namprd04.prod.outlook.com
 (2603:10b6:303:86::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e142f8b-2344-45b9-2d27-08de749c46e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: ZMAAn7/d/Eja5DS0jOINK2Fmtepu4ssZmRnn8TvAzWzodQaX0FKPOFDIlIeOZW3T4WGNv2SMvm0635ff/5G11V9x6cL74axNuv26fS9IsiTyjS6Pn/Vfc0k6+EryvY83FX4mXDRh1SD0b1uof8Db9lpAUpz+AkCmhbXL59L0HUBFD3IzDWBO8Bp3sD5GQoINNXoF/0FJt5hN65XXsqPy8RhUuZde+MlH0nNN/hWTlYF27zECKnA0HXNaEdxKdOGffxrF+6Wv7QKDkYhyauOzQxzkX3poD/zF76oGsoqByz9h8DKiTh09ykMRPaaeliYFGy/xvE+b5PXk+LdQjpN4R3gRaMiAJUR8xPsBQoA5JB+zTshuR9rDfUful3SM1R/ZQisvDyrcgkWaVk1cWprZGtg9tFz0Xu6J5Kn37DbeHW6GGUk76SwmSQnFqr/fSeBwlbZtbilznQvVmmm/BscTNLknT9oJ2HoDom/4ggD95c8cd4jiImKe1wcBkETuXCOk2qNFwfSWypd+OB8EBFRqClp0Io21KyADy1DVwupryHDQolZoK0r8OKCUkKN+9dPYB3D5TLISzAySC6O3T9N2kLjHEL0Qry2bGrQ3GQkgiw3O3JMsA3sB30l4r5R2QG7b9TO9/cP+ika++uUV0r64uoKa+jJIolnqivsotD3haGq5GzM4kUGu3rB7A4gG7Z5r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHRLcU5nd1RXUTBxR2JTcEZlNVFLWDNuWlJNZ0I5bXRmZVdaMHF1N2Nha3Z2?=
 =?utf-8?B?OTU1dElSTG9vazJzVWdZMnI1aXB2VVhETXVaVTZuVWVhT0lidGRhTk5uc0NO?=
 =?utf-8?B?ZXV3elVTcy9hdWpWYjE1bkwyRlAxMHJXS0l1MzJkVEwxcVk0R0E4QWxueUdp?=
 =?utf-8?B?d3ZnRzE1ME45RGFtaUd6UUVYSW45cFE5SmxvUjV3TkU5S2lzL1E1dUt5ZDdK?=
 =?utf-8?B?eXozVHlkZzNadVpLSVhrTHlrT0ZqRTZ4SWFZNGJiOEdvMDZ3V1VwNTh5RmJO?=
 =?utf-8?B?UWtIN1pmQnJPeFVMeXU5b08rN0VrYjhxbW04bzFLblVGTzJETEJMYm1yU0pL?=
 =?utf-8?B?c2NBYWV5eU4xUUdybmlnK3lEVG1DVktQWGROMERPNzZXMWJWd1Jkb1VVaU9o?=
 =?utf-8?B?YTVNcTcrRXVSZlV1RUd5WW1rL0ZUR2dHd29JQVFKclNyL3h1MG5Nb1N1bmdS?=
 =?utf-8?B?dkVnbkp3Y2tYZEY1aTlUZlNWTHh0K2g1Q1FrVHZLa2dQT2wrSTczUTJtdFlC?=
 =?utf-8?B?aVo2aXk4ZmovN2Y0VjNZZkpQTk5ybUZzVVRYclA3MCtBZFJLYi9idE45SUcz?=
 =?utf-8?B?YW1VZ3lRaXE1WkhhMjNOUmhPOEZQOGJSSTUyL0V1L3YydWNCclZzdDNHNGhK?=
 =?utf-8?B?WkF0NTFYSFlvR0tVbWFBc1FkUnh1NlhjZWUyeC8zS1N4dmdGYk04UnhBZkNT?=
 =?utf-8?B?V2x5T215WThhUUVXK0J6ZE53QjBHZ0ZIeUZvUStJWTJSVldzNThId1V3RzhC?=
 =?utf-8?B?Q2JwMWMwOU9mbnRBTU9aMVJUMkVIVGRBcVVxQjN3aHNKQzdjQjdTTmZhclBX?=
 =?utf-8?B?QUhWWWFVS1lIMno3Mjc4UkUySUkwYlpsMHdZQXpoSjJkSnpsUXI3UzhQN3lK?=
 =?utf-8?B?NkNTYWh3YzlDeHpHZFc3MnB1cGlHNnRrd2RDaGRXMFpEc2h1NTQzWms4UjVk?=
 =?utf-8?B?OW1FMEZyUC9RSmtKcENyT0t6dmJXMTIxNGd1a1RMZ2lGdDFqMStPYVdHS1Z6?=
 =?utf-8?B?YzhSYkNLTHN6NUpyT3dadWg0NWgxOVYrUzJnQS9SRHJOeTNLdDJ1WmQ4RXp5?=
 =?utf-8?B?bVJPbGl0Qy93cSt4Y0RmUW9ZbmMxYnZFR2xrQ1pkbnVmN2d0RSs0RHFYU21v?=
 =?utf-8?B?S1gxRzVLYitIM0pyYzBTWEpLVVVDZ1FUQ0I2VzYva2tOQ2Fmalp6QnNmRElz?=
 =?utf-8?B?bk1ZR2tNVnZqemo2MU51U0xUa09FWVUyQjhoWWhPNzJhTFVBSUFFSjRReC9I?=
 =?utf-8?B?RTV6My9pVmw0SWROSlRnYUJFdTZTU2pKYklocE8yWjRtbEV5clQ5L1JIWm5z?=
 =?utf-8?B?NWxseDhBVEhWOXcvN0FrN1d4Tm9sSUkwSGlmODhFcHRSQitINUFUR0NHRFJY?=
 =?utf-8?B?MGdNZkRGeEVLTWhIb0NxQzB2VTgvdWJ3MmFINFpiRiszdm5GV296d3p4b0N2?=
 =?utf-8?B?emQxRS9Pd21jSUxabStiM2hIOVlLWGJmWWVoUTZ5QlVZb3FtK2FDaWVxYmdG?=
 =?utf-8?B?RmdFOUpWTHB0Q0hiNXdkVmd5MDA1UVc4VlJEdS9aVnFXM1RrZnl6OHE1SnZB?=
 =?utf-8?B?QkZVL3h0SEYyb2xjZXdjZmczK1ZVVGpLSlBSOGhDNUJUNUFmMFIzQUVNeEdr?=
 =?utf-8?B?eFk4NlMrOWs4VlZ4T09TbEx1SFBDamZTZmJxbTdvVlRRSThYYW56Q2VnZFJD?=
 =?utf-8?B?ZkxvZzF2REFFN24vMGFxSW5ZVk1CRHRqaVI5VGNvTnNpNHd3RzFKZnRoQ2Qr?=
 =?utf-8?B?b0hsREc1aVY2NVhPL3p1cFYvMWFSdWlSZmdqVTRJVCtTSDZZNit4YW9ockxL?=
 =?utf-8?B?bFd0cHl5ZytGVUdERisvYTNrRFVBM1B5Z1lYMEtOYktvbHBOb2JTdTdZT1da?=
 =?utf-8?B?R0lsRUx3L1ArVkVRTHhYTjF4NytHNFpSemxTY09YcnVjbDlzdk9kemRDZ05B?=
 =?utf-8?B?b0J0bU5Jdys4bmxSMGJseUk4N2dTWkxSOVB3R1AybEZoSXRaNDRicmQ1OFlh?=
 =?utf-8?B?Wi9lUlQvSmFIeVJXSzNidDU5N3MyaWZIZVNJTHVuSDB1VXpRTlhiM1lyLzI1?=
 =?utf-8?B?c3ZCKzhnYURra2NCNFUycEZVRmtIVWxtcG5kMWtrT1huRnNWU3RjWFRUaWRz?=
 =?utf-8?B?REVxcFFpZjFxYnErZWlnVUVRdTh5VkN6QkM2V1l5R2taQVZCSFVOQ3l4OHlX?=
 =?utf-8?B?ZEpCaGgzcGNDM1FlNjYvZjZEb0drQ3lLTG1CTWZhMkMvb1dyalJUa3J1clRu?=
 =?utf-8?B?bGZLKzVtWFJQRHNTOEdaaUl4UVFydHQ5OUJKdXVJU0JtZzJTZm9MdW50cHBI?=
 =?utf-8?B?bklybVZQRkcrdE1mZGlESnc5eTNwLzljVkRYYnF4UzBxZUJpVXlNYUsrSDNM?=
 =?utf-8?Q?uXRLSyTRsZ3qEUX4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e142f8b-2344-45b9-2d27-08de749c46e2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 18:32:48.8213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: biEMuSgseFvozyuMa9yw30I2/ZIMJtpWLI792b0jPD7er8fJERW7dki20TxpwvKnwgjYK32eeTqDlZC7RWY7+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
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

On Wed, Feb 25, 2026 at 03:10:46PM +0530, Yadav, Arvind wrote:
> 
> On 25-02-2026 14:48, Thomas Hellström wrote:
> > On Wed, 2026-02-25 at 01:04 -0800, Matthew Brost wrote:
> > > On Wed, Feb 25, 2026 at 09:21:10AM +0100, Thomas Hellström wrote:
> > > > On Wed, 2026-02-25 at 11:05 +0530, Yadav, Arvind wrote:
> > > > > On 24-02-2026 22:06, Matthew Brost wrote:
> > > > > > On Tue, Feb 24, 2026 at 08:37:44PM +0530, Yadav, Arvind wrote:
> > > > > > > On 24-02-2026 18:18, Thomas Hellström wrote:
> > > > > > > > On Wed, 2026-02-11 at 20:56 +0530, Arvind Yadav wrote:
> > > > > > > > > Track purgeable state per-VMA instead of using a coarse
> > > > > > > > > shared
> > > > > > > > > BO check. This prevents purging shared BOs until all VMAs
> > > > > > > > > across
> > > > > > > > > all VMs are marked DONTNEED.
> > > > > > > > > 
> > > > > > > > > Add xe_bo_all_vmas_dontneed() to check all VMAs before
> > > > > > > > > marking
> > > > > > > > > a BO purgeable. Add
> > > > > > > > > xe_bo_recheck_purgeable_on_vma_unbind()
> > > > > > > > > to
> > > > > > > > > handle state transitions when VMAs are destroyed - if all
> > > > > > > > > remaining VMAs are DONTNEED the BO can become purgeable,
> > > > > > > > > or
> > > > > > > > > if
> > > > > > > > > no VMAs remain it transitions to WILLNEED.
> > > > > > > > > 
> > > > > > > > > The per-VMA purgeable_state field stores the madvise hint
> > > > > > > > > for
> > > > > > > > > each mapping. Shared BOs can only be purged when all VMAs
> > > > > > > > > unanimously indicate DONTNEED.
> > > > > > > > > 
> > > > > > > > > One thing to note: when the last VMA goes away, we
> > > > > > > > > default
> > > > > > > > > back to
> > > > > > > > > WILLNEED. DONTNEED is a per-mapping hint, and without any
> > > > > > > > > mappings
> > > > > > > > > there is no remaining madvise state to justify purging.
> > > > > > > > > This
> > > > > > > > > prevents
> > > > > > > > > BOs from becoming purgeable solely due to being
> > > > > > > > > temporarily
> > > > > > > > > unmapped.
> > > > > > > > > 
> > > > > > > > > v3:
> > > > > > > > >      - This addresses Thomas Hellström's feedback: "loop
> > > > > > > > > over
> > > > > > > > > all vmas
> > > > > > > > >        attached to the bo and check that they all say
> > > > > > > > > DONTNEED. This
> > > > > > > > > will
> > > > > > > > >        also need a check at VMA unbinding"
> > > > > > > > > 
> > > > > > > > > v4:
> > > > > > > > >      - @madv_purgeable atomic_t → u32 change across all
> > > > > > > > > relevant
> > > > > > > > >        patches (Matt)
> > > > > > > > > 
> > > > > > > > > v5:
> > > > > > > > >      - Call xe_bo_recheck_purgeable_on_vma_unbind() from
> > > > > > > > > xe_vma_destroy()
> > > > > > > > >        right after drm_gpuva_unlink() where we already
> > > > > > > > > hold
> > > > > > > > > the BO lock,
> > > > > > > > >        drop the trylock-based late destroy path (Matt)
> > > > > > > > >      - Move purgeable_state into xe_vma_mem_attr with the
> > > > > > > > > other madvise
> > > > > > > > >        attributes (Matt)
> > > > > > > > >      - Drop READ_ONCE since the BO lock already protects
> > > > > > > > > us
> > > > > > > > > (Matt)
> > > > > > > > >      - Keep returning false when there are no VMAs -
> > > > > > > > > otherwise
> > > > > > > > > we'd mark
> > > > > > > > >        BOs purgeable without any user hint (Matt)
> > > > > > > > >      - Use xe_bo_set_purgeable_state() instead of direct
> > > > > > > > > initialization(Matt)
> > > > > > > > >      - use xe_assert instead of drm_war (Thomas)
> > > > > > > > Typo.
> > > > > > > Noted,
> > > > > > > 
> > > > > > > > There were also a couple of review issues in my reply here:
> > > > > > > > 
> > > > > > > > https://patchwork.freedesktop.org/patch/699451/?series=156651&rev=5
> > > > > > > > 
> > > > > > > > that were never addressed or at least commented upon.
> > > > > > > > 
> > > > > > > > The comment there on retaining purgeable state after the
> > > > > > > > last
> > > > > > > > vma is
> > > > > > > > unmapped could be discussed, though.
> > > > > > > > 
> > > > > > > > Let's say we unmap a vma marking a bo purgeable. It then
> > > > > > > > becomes either
> > > > > > > > purged or non-purgeable.
> > > > > > > > 
> > > > > > > > Then an app tries to access it either using a new vma or
> > > > > > > > CPU
> > > > > > > > map. Then
> > > > > > > > it will typically succeed, or might occasionally fail if
> > > > > > > > the bo
> > > > > > > > happened to be purged in between.
> > > > > > > > 
> > > > > > > > How do we handle new vma map requests and cpu-faults to a
> > > > > > > > bo in
> > > > > > > > purgeable state? Do we block those?
> > > > > > > @Thomas,
> > > > > > > 
> > > > > > > The implementation already blocks new access to purged BOs:
> > > > > > >    1. New VMA mappings (Patch 0005): vma_lock_and_validate()
> > > > > > > rejects MAP
> > > > > > > operations to purged BOs with -EINVAL via the check_purged
> > > > > > > flag.
> > > > > > >    2. CPU faults (Patch 0004): Both xe_bo_cpu_prep() and
> > > > > > > xe_gem_mmap_offset()
> > > > > > > return errors (-EFAULT / VM_FAULT_SIGBUS) when accessing
> > > > > > > purged
> > > > > > > BOs.
> > > > > > >    3 . "Once purged, always purged": Even when the last VMA is
> > > > > > > unmapped,
> > > > > > > xe_bo_recompute_purgeable_state() preserves the PURGED state
> > > > > > > - it
> > > > > > > never
> > > > > > > transitions back to WILLNEED or DONTNEED (see early return at
> > > > > > > the
> > > > > > > top of the
> > > > > > > function).
> > > > > > > 
> > > > > > > The only way forward for the application is to destroy the
> > > > > > > purged
> > > > > > > BO and
> > > > > > > create a new one.
> > > > > > > 
> > > > > > > Regarding the 'no VMAs → WILLNEED' logic: this only applies
> > > > > > > to
> > > > > > > non-purged
> > > > > > > BOs that happen to be temporarily unmapped. Purged BOs remain
> > > > > > > permanently
> > > > > > > invalid.
> > > > > > So I think xe_bo_all_vmas_dontneed() isn't 100% correct...
> > > > > > 
> > > > > > I think should return an enum...
> > > > > > 
> > > > > > enum xe_bo_vmas_purge_state {	/* Maybe a better name? */
> > > > > > 	XE_BO_VMAS_STATE_DONTNEED = 0,
> > > > > > 	XE_BO_VMAS_STATE_WILLNEED = 1,
> > > > > > 	XE_BO_VMAS_STATE_NO_VMAS = 2,
> > > > > > };
> > > > > > 
> > > > > > 
> > > > > > Then in xe_bo_recompute_purgeable_state() something like this:
> > > > > > 
> > > > > > void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
> > > > > > {
> > > > > > 	enum xe_bo_vma_purge_state state;
> > > > > > 
> > > > > > 	if (!bo)
> > > > > > 		return;
> > > > > > 
> > > > > > 	xe_bo_assert_held(bo);
> > > > > > 
> > > > > > 	/*
> > > > > > 	 * Once purged, always purged. Cannot transition back
> > > > > > to
> > > > > > WILLNEED.
> > > > > > 	 * This matches i915 semantics where purged BOs are
> > > > > > permanently invalid.
> > > > > > 	 */
> > > > > > 	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
> > > > > > 		return;
> > > > > > 
> > > > > > 	state = xe_bo_all_vmas_dontneed(bo);
> > > > > > 	if (state == XE_BO_VMAS_STATE_DONTNEED) {
> > > > > > 		/* All VMAs are DONTNEED - mark BO purgeable
> > > > > > */
> > > > > > 		if (bo->madv_purgeable !=
> > > > > > XE_MADV_PURGEABLE_DONTNEED)
> > > > > > 			xe_bo_set_purgeable_state(bo,
> > > > > > XE_MADV_PURGEABLE_DONTNEED);
> > > > > > 	} else if (state == XE_BO_VMAS_STATE_WILLNEED) {
> > > > > > 		/* At least one VMA is WILLNEED - BO must not
> > > > > > be
> > > > > > purgeable */
> > > > > > 		if (bo->madv_purgeable !=
> > > > > > XE_MADV_PURGEABLE_WILLNEED)
> > > > > > 			xe_bo_set_purgeable_state(bo,
> > > > > > XE_MADV_PURGEABLE_WILLNEED);
> > > > > > 	}
> > > > > > }
> > > > > > 
> > > > > > I think would avoid the last unbind unintentionally flipping
> > > > > > from
> > > > > > DONTNEED -> WILLNEED.
> > > > > > 
> > > > > > What do you both of you (Thomas, Arvind) think?
> > > > > 
> > > > > @Matt,
> > > > > 
> > > > > Good catch—I missed that transition. You’re right: when the last
> > > > > VMA
> > > > > is
> > > > > unmapped from a DONTNEED BO, the current logic can flip it back
> > > > > to
> > > > > WILLNEED, which discards the user’s hint. That’s wrong.
> > > > > 
> > > > >     I like the enum approach to distinguish:
> > > > >       -  *_DONTNEED: all VMAs are DONTNEED
> > > > >       - *_WILLNEED: at least one VMA is WILLNEED
> > > > >       - *_NO_VMAS: no VMAs present
> > > > > 
> > > > > With that, xe_bo_recompute_purgeable_state() can avoid changing
> > > > > state
> > > > > on
> > > > > NO_VMAS and preserve "once purged, always purged," matching i915
> > > > > semantics. This also addresses Thomas's earlier question about
> > > > > new
> > > > > VMA/CPU access to purgeable BOs—the enum makes it clear we only
> > > > > transition on explicit VMA state, not on absence of VMAs.
> > > > > 
> > > > > I'll rework xe_bo_all_vmas_dontneed() to return the enum and
> > > > > update
> > > > > the
> > > > > recompute path accordingly.
> > > > > 
> > > > > 
> > > > > @Thomas,
> > > > > 
> > > > > Does this direction look good to you? If yes, I will send updated
> > > > > patch.
> > > > Yes, but I'm also as mentioned concerned about whether we can add
> > > > new
> > > > vmas, cpu faults and exports in the DONTNEED state. If we can do
> > > > that,
> > > > it might succeed most of the time making a well-behave appearance
> > > > in
> > > > user-space, but if on occation the bo gets purged, the app would
> > > > seeming unexpectedly fail.
> > > > 
> > > > So do we block new vmas cpu-faults and exports in the DONTNEED
> > > > state?
> > > > 
> > > I’ve thought about the same thing. The new vmas semantics are a bit
> > > odd,
> > > because if you unbind the BO in DONTNEED and disallow creating new
> > > VMAs,
> > > the BO can never be used again—madvise requires a VMA to operate thus
> > > you can't move a BO out of DONTNEED. Maybe that’s acceptable or even
> > > desirable, but it would need to be documented, and ultimately we’d
> > > need
> > > a UMD ack for those semantics.
> > > 
> > > CPU faults or exports in DONTNEED also seem like they should be
> > > disallowed with less odd sematics, but again, this should be
> > > documented
> > > and require UMD ack.
> > Hmm. With DONTNEED really to do as little as possible. So we shouldn't
> > go to into any sort of unmapping GPU- or CPU ptes. That means the end

I agree DONTNEED should be light weight and not invalidate anything.

> > behaviour might still be a bit erratic on access of a DONTNEED bo,
> > depending on previous access pattern we may or may not fault.
> > 
> > So we should probably disallow mmap(), VM_BIND and export, but allow
> > CPU- and GPU pagefaults. And document.
> > 

I think this is reasonable, but any CPU/GPU access after marking memory
as DONTNEED is fundamentally a user bug, and behavior will be erratic.
Consider that if we don’t invalidate CPU/GPU mappings on DONTNEED, those
accesses may appear to work for a while, but once the memory is actually
purged, things will suddenly fail. The only way to make this consistent
would be to invalidate CPU/GPU pages at DONTNEED time + disallow all
access, but I agree we don’t want to do that—DONTNEED should be as
lightweight as possible.

So perhaps the best we can do is restrict future access requests
(mmap(), VM_BIND, export, etc.) and state that any existing access after
DONTNEED is undefined behavior. More on this below.

> > Speaking of pagefaults, I noticed that when *purged*, it looks like we
> > populate with scratch PTEs also on faulting VMs. I think this is the
> > correct approach, though, to avoid the prefetch pagefaults wreaking
> > havoc if accessing vmas with purged bos.
> 
> 
> @Thomas, @Matt,
> 
> Got it. So the plan is:
> 
> DONTNEED BOs:
>    - Block: new mmap(), VM_BIND, dma-buf export
>    - Allow: CPU/GPU faults on existing mappings (fail if purged)

Torn on CPU/GPU faults here, since the DONTNEED → PURGED transition can
happen at any time, meaning a fault can eventually fail anyway. So why
not just fail the fault immediately at DONTNEED?

>    - Keep PTEs intact, just mark as purgeable

Yes, agreed. Invalidations are pretty expensive outside of ring
instructions, so issuing them at DONTNEED defeats the purpose of
DONTNEED being lightweight.

> 
> I'll add checks in:
> 1. xe_gem_mmap_offset() - reject new mmap to DONTNEED BO
> 2. VM_BIND path (vma_lock_and_validate) - reject new VMA to DONTNEED BO
> 3. dma-buf export path - reject export of DONTNEED BO
> 

I'm fine with this if that's the preference, but let's close on this
point—especially regarding CPU/GPU faults—before the next rev.

Matt

> Let me know if I am missing something.
> 
> Thanks,
> Arvind
> 
> 
> > /Thomas
> > 
> > 
> > > Matt
> > > 
> > > > /Thomas
> > > > 
> > > > 
> > > > > Thanks,
> > > > > Arvind
> > > > > 
> > > > > 
> > > > > > Matt
> > > > > > 
> > > > > > > Thanks,
> > > > > > > Arvind
> > > > > > > > Thanks,
> > > > > > > > Thomas
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > > > > Cc: Himal Prasad Ghimiray
> > > > > > > > > <himal.prasad.ghimiray@intel.com>
> > > > > > > > > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > > > > > > > > ---
> > > > > > > > >     drivers/gpu/drm/xe/xe_svm.c        |  1 +
> > > > > > > > >     drivers/gpu/drm/xe/xe_vm.c         |  9 ++-
> > > > > > > > >     drivers/gpu/drm/xe/xe_vm_madvise.c | 98
> > > > > > > > > ++++++++++++++++++++++++++++--
> > > > > > > > >     drivers/gpu/drm/xe/xe_vm_madvise.h |  3 +
> > > > > > > > >     drivers/gpu/drm/xe/xe_vm_types.h   | 11 ++++
> > > > > > > > >     5 files changed, 116 insertions(+), 6 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_svm.c
> > > > > > > > > index cda3bf7e2418..329c77aa5c20 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > > > > > > @@ -318,6 +318,7 @@ static void
> > > > > > > > > xe_vma_set_default_attributes(struct
> > > > > > > > > xe_vma *vma)
> > > > > > > > >     		.preferred_loc.migration_policy =
> > > > > > > > > DRM_XE_MIGRATE_ALL_PAGES,
> > > > > > > > >     		.pat_index = vma-
> > > > > > > > > > attr.default_pat_index,
> > > > > > > > >     		.atomic_access =
> > > > > > > > > DRM_XE_ATOMIC_UNDEFINED,
> > > > > > > > > +		.purgeable_state =
> > > > > > > > > XE_MADV_PURGEABLE_WILLNEED,
> > > > > > > > >     	};
> > > > > > > > >     	xe_vma_mem_attr_copy(&vma->attr, &default_attr);
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > > > index 71cf3ce6c62b..e84b9e7cb5eb 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > > > @@ -39,6 +39,7 @@
> > > > > > > > >     #include "xe_tile.h"
> > > > > > > > >     #include "xe_tlb_inval.h"
> > > > > > > > >     #include "xe_trace_bo.h"
> > > > > > > > > +#include "xe_vm_madvise.h"
> > > > > > > > >     #include "xe_wa.h"
> > > > > > > > >     static struct drm_gem_object *xe_vm_obj(struct xe_vm
> > > > > > > > > *vm)
> > > > > > > > > @@ -1085,6 +1086,7 @@ static struct xe_vma
> > > > > > > > > *xe_vma_create(struct
> > > > > > > > > xe_vm *vm,
> > > > > > > > >     static void xe_vma_destroy_late(struct xe_vma *vma)
> > > > > > > > >     {
> > > > > > > > >     	struct xe_vm *vm = xe_vma_vm(vma);
> > > > > > > > > +	struct xe_bo *bo = xe_vma_bo(vma);
> > > > > > > > >     	if (vma->ufence) {
> > > > > > > > >     		xe_sync_ufence_put(vma->ufence);
> > > > > > > > > @@ -1099,7 +1101,7 @@ static void
> > > > > > > > > xe_vma_destroy_late(struct
> > > > > > > > > xe_vma
> > > > > > > > > *vma)
> > > > > > > > >     	} else if (xe_vma_is_null(vma) ||
> > > > > > > > > xe_vma_is_cpu_addr_mirror(vma)) {
> > > > > > > > >     		xe_vm_put(vm);
> > > > > > > > >     	} else {
> > > > > > > > > -		xe_bo_put(xe_vma_bo(vma));
> > > > > > > > > +		xe_bo_put(bo);
> > > > > > > > >     	}
> > > > > > > > >     	xe_vma_free(vma);
> > > > > > > > > @@ -1125,6 +1127,7 @@ static void vma_destroy_cb(struct
> > > > > > > > > dma_fence
> > > > > > > > > *fence,
> > > > > > > > >     static void xe_vma_destroy(struct xe_vma *vma, struct
> > > > > > > > > dma_fence
> > > > > > > > > *fence)
> > > > > > > > >     {
> > > > > > > > >     	struct xe_vm *vm = xe_vma_vm(vma);
> > > > > > > > > +	struct xe_bo *bo = xe_vma_bo(vma);
> > > > > > > > >     	lockdep_assert_held_write(&vm->lock);
> > > > > > > > >     	xe_assert(vm->xe, list_empty(&vma-
> > > > > > > > > > combined_links.destroy));
> > > > > > > > > @@ -1133,9 +1136,10 @@ static void xe_vma_destroy(struct
> > > > > > > > > xe_vma *vma,
> > > > > > > > > struct dma_fence *fence)
> > > > > > > > >     		xe_assert(vm->xe, vma->gpuva.flags &
> > > > > > > > > XE_VMA_DESTROYED);
> > > > > > > > >     		xe_userptr_destroy(to_userptr_vma(vma));
> > > > > > > > >     	} else if (!xe_vma_is_null(vma) &&
> > > > > > > > > !xe_vma_is_cpu_addr_mirror(vma)) {
> > > > > > > > > -		xe_bo_assert_held(xe_vma_bo(vma));
> > > > > > > > > +		xe_bo_assert_held(bo);
> > > > > > > > >     		drm_gpuva_unlink(&vma->gpuva);
> > > > > > > > > +		xe_bo_recompute_purgeable_state(bo);
> > > > > > > > >     	}
> > > > > > > > >     	xe_vm_assert_held(vm);
> > > > > > > > > @@ -2681,6 +2685,7 @@ static int
> > > > > > > > > vm_bind_ioctl_ops_parse(struct xe_vm
> > > > > > > > > *vm, struct drm_gpuva_ops *ops,
> > > > > > > > >     				.atomic_access =
> > > > > > > > > DRM_XE_ATOMIC_UNDEFINED,
> > > > > > > > >     				.default_pat_index = op-
> > > > > > > > > > map.pat_index,
> > > > > > > > >     				.pat_index = op-
> > > > > > > > > > map.pat_index,
> > > > > > > > > +				.purgeable_state =
> > > > > > > > > XE_MADV_PURGEABLE_WILLNEED,
> > > > > > > > >     			};
> > > > > > > > >     			flags |= op->map.vma_flags &
> > > > > > > > > XE_VMA_CREATE_MASK;
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > > > > > > index d9cfba7bfe0b..c184426546a2 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > > > > > > @@ -12,6 +12,7 @@
> > > > > > > > >     #include "xe_pat.h"
> > > > > > > > >     #include "xe_pt.h"
> > > > > > > > >     #include "xe_svm.h"
> > > > > > > > > +#include "xe_vm.h"
> > > > > > > > >     struct xe_vmas_in_madvise_range {
> > > > > > > > >     	u64 addr;
> > > > > > > > > @@ -183,6 +184,89 @@ static void madvise_pat_index(struct
> > > > > > > > > xe_device
> > > > > > > > > *xe, struct xe_vm *vm,
> > > > > > > > >     	}
> > > > > > > > >     }
> > > > > > > > > +/**
> > > > > > > > > + * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO
> > > > > > > > > are
> > > > > > > > > marked
> > > > > > > > > DONTNEED
> > > > > > > > > + * @bo: Buffer object
> > > > > > > > > + *
> > > > > > > > > + * Check all VMAs across all VMs to determine if BO can
> > > > > > > > > be
> > > > > > > > > purged.
> > > > > > > > > + * Shared BOs require unanimous DONTNEED state from all
> > > > > > > > > mappings.
> > > > > > > > > + *
> > > > > > > > > + * Caller must hold BO dma-resv lock.
> > > > > > > > > + *
> > > > > > > > > + * Return: true if all VMAs are DONTNEED, false
> > > > > > > > > otherwise
> > > > > > > > > + */
> > > > > > > > > +static bool xe_bo_all_vmas_dontneed(struct xe_bo *bo)
> > > > > > > > > +{
> > > > > > > > > +	struct drm_gpuvm_bo *vm_bo;
> > > > > > > > > +	struct drm_gpuva *gpuva;
> > > > > > > > > +	struct drm_gem_object *obj = &bo->ttm.base;
> > > > > > > > > +	bool has_vmas = false;
> > > > > > > > > +
> > > > > > > > > +	xe_bo_assert_held(bo);
> > > > > > > > > +
> > > > > > > > > +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> > > > > > > > > +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> > > > > > > > > +			struct xe_vma *vma =
> > > > > > > > > gpuva_to_vma(gpuva);
> > > > > > > > > +
> > > > > > > > > +			has_vmas = true;
> > > > > > > > > +
> > > > > > > > > +			/* Any non-DONTNEED VMA prevents
> > > > > > > > > purging */
> > > > > > > > > +			if (vma->attr.purgeable_state !=
> > > > > > > > > XE_MADV_PURGEABLE_DONTNEED)
> > > > > > > > > +				return false;
> > > > > > > > > +		}
> > > > > > > > > +	}
> > > > > > > > > +
> > > > > > > > > +	/*
> > > > > > > > > +	 * No VMAs => no mapping-level DONTNEED hint.
> > > > > > > > > +	 * Default to WILLNEED to avoid making BOs
> > > > > > > > > purgeable
> > > > > > > > > without
> > > > > > > > > +	 * explicit user intent.
> > > > > > > > > +	 */
> > > > > > > > > +	if (!has_vmas)
> > > > > > > > > +		return false;
> > > > > > > > > +
> > > > > > > > > +	return true;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +/**
> > > > > > > > > + * xe_bo_recompute_purgeable_state() - Recompute BO
> > > > > > > > > purgeable state
> > > > > > > > > from VMAs
> > > > > > > > > + * @bo: Buffer object
> > > > > > > > > + *
> > > > > > > > > + * Walk all VMAs to determine if BO should be purgeable
> > > > > > > > > or
> > > > > > > > > not.
> > > > > > > > > + * Shared BOs require unanimous DONTNEED state from all
> > > > > > > > > mappings.
> > > > > > > > > + *
> > > > > > > > > + * Locking: Caller must hold BO dma-resv lock. When
> > > > > > > > > iterating GPUVM
> > > > > > > > > lists,
> > > > > > > > > + * VM lock must also be held (write) to prevent
> > > > > > > > > concurrent
> > > > > > > > > VMA
> > > > > > > > > modifications.
> > > > > > > > > + * This is satisfied at both call sites:
> > > > > > > > > + * - xe_vma_destroy(): holds vm->lock write
> > > > > > > > > + * - madvise_purgeable(): holds vm->lock write (from
> > > > > > > > > madvise
> > > > > > > > > ioctl
> > > > > > > > > path)
> > > > > > > > > + *
> > > > > > > > > + * Return: nothing
> > > > > > > > > + */
> > > > > > > > > +void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
> > > > > > > > > +{
> > > > > > > > > +	if (!bo)
> > > > > > > > > +		return;
> > > > > > > > > +
> > > > > > > > > +	xe_bo_assert_held(bo);
> > > > > > > > > +
> > > > > > > > > +	/*
> > > > > > > > > +	 * Once purged, always purged. Cannot transition
> > > > > > > > > back to
> > > > > > > > > WILLNEED.
> > > > > > > > > +	 * This matches i915 semantics where purged BOs
> > > > > > > > > are
> > > > > > > > > permanently invalid.
> > > > > > > > > +	 */
> > > > > > > > > +	if (bo->madv_purgeable ==
> > > > > > > > > XE_MADV_PURGEABLE_PURGED)
> > > > > > > > > +		return;
> > > > > > > > > +
> > > > > > > > > +	if (xe_bo_all_vmas_dontneed(bo)) {
> > > > > > > > > +		/* All VMAs are DONTNEED - mark BO
> > > > > > > > > purgeable
> > > > > > > > > */
> > > > > > > > > +		if (bo->madv_purgeable !=
> > > > > > > > > XE_MADV_PURGEABLE_DONTNEED)
> > > > > > > > > +			xe_bo_set_purgeable_state(bo,
> > > > > > > > > XE_MADV_PURGEABLE_DONTNEED);
> > > > > > > > > +	} else {
> > > > > > > > > +		/* At least one VMA is WILLNEED - BO
> > > > > > > > > must
> > > > > > > > > not be
> > > > > > > > > purgeable */
> > > > > > > > > +		if (bo->madv_purgeable !=
> > > > > > > > > XE_MADV_PURGEABLE_WILLNEED)
> > > > > > > > > +			xe_bo_set_purgeable_state(bo,
> > > > > > > > > XE_MADV_PURGEABLE_WILLNEED);
> > > > > > > > > +	}
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >     /**
> > > > > > > > >      * madvise_purgeable - Handle purgeable buffer object
> > > > > > > > > advice
> > > > > > > > >      * @xe: XE device
> > > > > > > > > @@ -231,14 +315,20 @@ static void __maybe_unused
> > > > > > > > > madvise_purgeable(struct xe_device *xe,
> > > > > > > > >     		switch (op->purge_state_val.val) {
> > > > > > > > >     		case
> > > > > > > > > DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> > > > > > > > > -			xe_bo_set_purgeable_state(bo,
> > > > > > > > > XE_MADV_PURGEABLE_WILLNEED);
> > > > > > > > > +			vmas[i]->attr.purgeable_state =
> > > > > > > > > XE_MADV_PURGEABLE_WILLNEED;
> > > > > > > > > +
> > > > > > > > > +			/* Update BO purgeable state */
> > > > > > > > > +			xe_bo_recompute_purgeable_state(
> > > > > > > > > bo);
> > > > > > > > >     			break;
> > > > > > > > >     		case
> > > > > > > > > DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> > > > > > > > > -			xe_bo_set_purgeable_state(bo,
> > > > > > > > > XE_MADV_PURGEABLE_DONTNEED);
> > > > > > > > > +			vmas[i]->attr.purgeable_state =
> > > > > > > > > XE_MADV_PURGEABLE_DONTNEED;
> > > > > > > > > +
> > > > > > > > > +			/* Update BO purgeable state */
> > > > > > > > > +			xe_bo_recompute_purgeable_state(
> > > > > > > > > bo);
> > > > > > > > >     			break;
> > > > > > > > >     		default:
> > > > > > > > > -			drm_warn(&vm->xe->drm, "Invalid
> > > > > > > > > madvice
> > > > > > > > > value = %d\n",
> > > > > > > > > -				 op-
> > > > > > > > > > purge_state_val.val);
> > > > > > > > > +			/* Should never hit - values
> > > > > > > > > validated in
> > > > > > > > > madvise_args_are_sane() */
> > > > > > > > > +			xe_assert(vm->xe, 0);
> > > > > > > > >     			return;
> > > > > > > > >     		}
> > > > > > > > >     	}
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > > > > > > > b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > > > > > > > index b0e1fc445f23..39acd2689ca0 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > > > > > > > @@ -8,8 +8,11 @@
> > > > > > > > >     struct drm_device;
> > > > > > > > >     struct drm_file;
> > > > > > > > > +struct xe_bo;
> > > > > > > > >     int xe_vm_madvise_ioctl(struct drm_device *dev, void
> > > > > > > > > *data,
> > > > > > > > >     			struct drm_file *file);
> > > > > > > > > +void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
> > > > > > > > > +
> > > > > > > > >     #endif
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > > > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > > > > index 43203e90ee3e..fd563039e8f4 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > > > > @@ -94,6 +94,17 @@ struct xe_vma_mem_attr {
> > > > > > > > >     	 * same as default_pat_index unless overwritten
> > > > > > > > > by
> > > > > > > > > madvise.
> > > > > > > > >     	 */
> > > > > > > > >     	u16 pat_index;
> > > > > > > > > +
> > > > > > > > > +	/**
> > > > > > > > > +	 * @purgeable_state: Purgeable hint for this VMA
> > > > > > > > > mapping
> > > > > > > > > +	 *
> > > > > > > > > +	 * Per-VMA purgeable state from madvise. Valid
> > > > > > > > > states are
> > > > > > > > > WILLNEED (0)
> > > > > > > > > +	 * or DONTNEED (1). Shared BOs require all VMAs
> > > > > > > > > to
> > > > > > > > > be
> > > > > > > > > DONTNEED before
> > > > > > > > > +	 * the BO can be purged. PURGED state exists
> > > > > > > > > only at
> > > > > > > > > BO
> > > > > > > > > level.
> > > > > > > > > +	 *
> > > > > > > > > +	 * Protected by BO dma-resv lock. Set via
> > > > > > > > > DRM_IOCTL_XE_MADVISE.
> > > > > > > > > +	 */
> > > > > > > > > +	u32 purgeable_state;
> > > > > > > > >     };
> > > > > > > > >     struct xe_vma {

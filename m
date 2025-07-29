Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523CEC87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 04:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C07610E5BD;
	Tue, 29 Jul 2025 04:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+b1fRX3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CB710E5BD
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 04:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753763036; x=1785299036;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=36r6eMZai6d3dsa9TdVPzjE+VcYm+o3bxNvigTFE2QA=;
 b=V+b1fRX3JiMTgHQ6V5sJIf0dQOg+vwpgohYbEoqA0Kknao/4euyWNv68
 svQKlcljNkVJk2U9umWQIC3lQs59NE9GbWLsmg4nPPimLcKDCUvMYAYBf
 /mFenGNp6exIMuqM5ei0gGYDHFthd++DuXyMkkdbFItJZXd1AB7OAA9hi
 BmCLHuNQwat9VVDeDGK7/bqEnj0mIyLg+MeosmgRSV56ikXuicM6gbwuy
 RWa1wCnLLMm9mLNehcdZOYQCPqmkt4EuTP3MaQ9LbsuDC/Is5N32xwU1M
 lOqFtnZWWFTz6rPlDu437KdjP+a6aLZjIJDPf5VGwhzgIm9RirjRgWNHG g==;
X-CSE-ConnectionGUID: mKW69CW/TZWQ/oB89AXxqg==
X-CSE-MsgGUID: GYqqrlOiQ2aCry5Z3ljOaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="59824223"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="59824223"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:23:56 -0700
X-CSE-ConnectionGUID: EiH83Nt1SZmB9hRFHLQYsg==
X-CSE-MsgGUID: tyGzXUtOTVe5skmfC+zzrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="162636729"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:23:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:23:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 21:23:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:23:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdINb/RlDut8TyL8lg5r5j4v/xNwPP2tAomoYIaSbfq10Q/JnjAha8e8qI0jo42ugfpBKFJIVM7cDq10mqaK08BcL2EVMnwiGRBk3W1frJJnqKihZEiPUdRVSbFksPXd3wZNOwZlYa4+dELiuESdH9BBsnPQazpOolo5Ss5/btMA8Z062Y6xvZEvOYf9jXTSKvY8WEXRJM7TLZqTfB37ZaePmSnLMwx83o3sAac63UeLbdd3hAy6v7xbWhDDneBT5HuceChPLRW0kJbeQExFuirs1Kp1Ju0stOcAMLiwpdwXUiQxq8SCmF+SWntzrbsVzSQKGwSWNup7SoaNXRVRWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bImqKyKgYqBt/iPDcAhU0KVub3yTlISqu/6+F6RekcM=;
 b=eyVDLcCjFNvjGxDtQySW9eb3omlrzRlr76oKZ8wv2uanst/bEVd0LPgvaZwsd7bX4NPiWV0y8go3SCcuAjzVMfVUybf3DrjA0UWZj8PaqV+gqQ1XlzPPORqe14f9gdDKf/gvJi9mgVlzwKqIg9IU2Sz3QtKpP9myKJbfyb8+5+gg6aqmZlfaW+KDxRDivA5IcQo9+0shH+O4xd2esLdE5N7dMomDPS2tlyTz6SHTuU69o91kGznBs4SW0tGAaWRUEYRlI8bvab5vQvZqAR3K4zp/th465Ms/NqnOd/bkJbMWD2Rw9KKbbRgeErey0mq4Uj/V0YGmxVjRgS1luuqUsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 04:23:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 04:23:21 +0000
Date: Mon, 28 Jul 2025 21:23:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: [PATCH v5 10/23] drm/xe: Implement madvise ioctl for xe
Message-ID: <aIhMtuEl8oBBapGS@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-11-himal.prasad.ghimiray@intel.com>
 <aIhFeh5rSjtg3W3K@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aIhFeh5rSjtg3W3K@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0285.namprd04.prod.outlook.com
 (2603:10b6:303:89::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4799:EE_
X-MS-Office365-Filtering-Correlation-Id: 0416be66-3621-40c6-5c06-08ddce57a6ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fJeI+kRIF3TBhmJ+JJlz5cIXIc3m4CxOwmaT2EEUKYIO5LxM+NCoXnN1MD?=
 =?iso-8859-1?Q?pCr85kyAG7eznGYaCxeG5ersDbZGEENzCVSGiV6UfZDxzxGwcDRTQQac8U?=
 =?iso-8859-1?Q?D/0E3lFbSAGAs9f8EIz4Hay1KL+mMnEw/SBjWR5nuyXL0E/ES+WC1hu4DG?=
 =?iso-8859-1?Q?D88ix4sarXB6kHGAv9FdHm0+np+My5qEUHAxELIRG4M8Il5tHOJ+v46G2G?=
 =?iso-8859-1?Q?8SNX53ufN23K24VZGm2i5SqDIzY3UWZBV2pzemc9iq3tnEkkgW+4EuztT3?=
 =?iso-8859-1?Q?Z+srXu7WPAjn/UdZb53Ukp68IzWEH4wjqzBgOqIPGV2dRuiowego5okWGh?=
 =?iso-8859-1?Q?sJ1uqiXMMPcbtWDUMKSQlCW/s2Vs8OTXLzH0YmVhdWQ1DnsJi7u56CXreL?=
 =?iso-8859-1?Q?4aGwtTWysD6uxeTXC0dZl5Abhg1sDTl4EAYjqa5m2z/maprh05bzywRCOO?=
 =?iso-8859-1?Q?4ur0yjd7OqAhjHkyjjp6WoYpuN5v4/aBuY63sss9ggTViNL0mAvo0gtLqk?=
 =?iso-8859-1?Q?T+uhZ7eK9ULe+ry5pxWiW150gINF2jmD6qKo77SBQ4UiHTBNf628gQ9PTX?=
 =?iso-8859-1?Q?sIQuk1lgZohW7oQwgeft6iZZn+a6jTwAN/KpNWBl6Uh4AkZSgjoPwAvas4?=
 =?iso-8859-1?Q?F67Q6ig7Pc9eMe+WCt8GbmcLkir81JFtRzDrmEhTSdCXWSY+OrdBfT1H15?=
 =?iso-8859-1?Q?icWSW5fbsRlHyYTIFtBvZ9yrgeLSy/XFIQ0vT/BjFbHph1emJBr4YXTOUd?=
 =?iso-8859-1?Q?zsd+XbktndFLMQzfp995D0/gIzpGjDLHLqQFxKM1SJJx/viavLO49fyI2l?=
 =?iso-8859-1?Q?ORz394vLdI8uYliIY3bYgXCus+NjLKqISPMajYnBY72BRcaVEhl8QRKCFa?=
 =?iso-8859-1?Q?Hpqc6X/Si1ahzPmVHSMHSYtumw4tnTOeAxlTwUpOSZOHTMJgOyj3Bpz1hY?=
 =?iso-8859-1?Q?CnMAmGRfUXP34wrNMZ4QlDWKt4UI7lznsakhOjdOuvZn3g5iT5/65WNkAj?=
 =?iso-8859-1?Q?h4w6+sYSQSVFZAwvDXIQ9AUMlNWD96+mV9yFMEDgs/ovMZFpSdtqtf0Dnl?=
 =?iso-8859-1?Q?zJ7CoYmdtljKXv19c6veAlEneBgfB4Prf1wXE5Dh5RMtVabFx7BYVeT6gs?=
 =?iso-8859-1?Q?7ILUw2G784UBfJrjHiBGuLFk6XoiflaxXxs9iQz4nNdLoUqzVJSLDHQv/+?=
 =?iso-8859-1?Q?Idmo2NT+ay22AE2xa56gGjR8mXmDZIkxJcKfHRte2KX81uxrSGNlK5PZpQ?=
 =?iso-8859-1?Q?0N41LLaqSpJ56+M5FYyvnO6L8ajKSzUyI2tU2qTmdXBY2OFHX3M1Ry4ilg?=
 =?iso-8859-1?Q?A0ezTNFWvGasc0TD9Yc/7yeXzuGj+JGbVzoQijWZK8zbLDFf3sbo6DFnlm?=
 =?iso-8859-1?Q?CeuBE1CRwvcUhBV+89PwXMw5ZBnED9xyUJRiK4ovPg+uRwDKbAyeHGqS2m?=
 =?iso-8859-1?Q?5kxDfyO6uRUxnOs1AcHSRoF9rJMOsRt0tbD2cDbFGYbs7sNA45DNMitzOI?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7AU+w+fqkVqSTYWAqw/UFYYUe6susqf/NhL5ADx6Fcycbtr0m3eL1reKNB?=
 =?iso-8859-1?Q?g/M7xz3ZpXg4vSylRtbGpwDVdOglewf8N6AxOk8xgp+5eqZkhWBpSfFo52?=
 =?iso-8859-1?Q?A31WbstPA0R3y50sXYtWeudgrMxqYRo4O3Qru6+2Ckv/DV/aGxrksTd8nV?=
 =?iso-8859-1?Q?MIUWUV0dEaWbeArLviJDsiZZhEg6K+l7x/MaQ38JQz3SUkKQLAh17aJcq3?=
 =?iso-8859-1?Q?weBksY0M74BdYoXPQqGKzXlLYusluJ6vc7f2whZS/Sq7VuW0TkV+wa/5G8?=
 =?iso-8859-1?Q?1ok+C51zj3u50sJteDxNBWKX0nim6EGAsIuRhLTXSFPEdkBfA/9wZPcImk?=
 =?iso-8859-1?Q?t94ahhO3H6pC2u2MUux9XZDl47O5SW7yFAC7ldyJJXNkl/M21lSFggTYsw?=
 =?iso-8859-1?Q?axMi9lBq6djIqcHMCiT5vKWkD1a2f7VnGnePE+rSygoEljjSV2bugCRuLt?=
 =?iso-8859-1?Q?cTBbbgG6uNp8BBW5mOi9XQi3lUE9Pk4ceyZ8ZDzGjGLDReJwvA2vFun3UO?=
 =?iso-8859-1?Q?+LYVkWdA7wBt4qhPGecGiL6XTZsRJdjLX9GG5NhLqTJh1mDz4hB0vJB9a2?=
 =?iso-8859-1?Q?/34i09maUGKCLfV5FQP1nTLZjTOifGf8PWrxkMxReZUm2m2HRoh+4VijBX?=
 =?iso-8859-1?Q?j0staEsLdZVn3NvtL1+hov2S9D6RDds/M7YnAFa1hwubcSiBr0TmJrez+K?=
 =?iso-8859-1?Q?b/3JiJ0SnCyAOI/qFoKmfAvZgFoKjyIjr8sphuRTBhP99D6XAaUP2BPN0a?=
 =?iso-8859-1?Q?oHuAILsoA9h3Pmcbqvcc4DKy34SELTb8BdjWvOooEEMBNbVRqCF5PPaS1t?=
 =?iso-8859-1?Q?XoZkA/dyuasTukLwsJN4uK4F/adAq5GrFNRafQU/1gQ/0Eaz1BpBBaz3Rm?=
 =?iso-8859-1?Q?gByUG8WhUoBLyG6i4WnVnp6C5+a6ZUhSEyMSp0R/pAw67f3J/FiyWmqExi?=
 =?iso-8859-1?Q?1eeYQVWDCwNtSk7C0sgC0sVm6VzPMSgUZfQpYnaxFCa5fiu+9n46jMCyKQ?=
 =?iso-8859-1?Q?p0l5SkvXfPuEGsLG78w8WauiVi1v8sKYiPgrVjRC1CI+mZQ82vRQLVSjKX?=
 =?iso-8859-1?Q?/ctVxzXHZO9vybogPwh6pf8yotVPOAY/WcDBTHyNaj31WKOdHFw2mv10JL?=
 =?iso-8859-1?Q?EQefJPZGnTtMcRltrB6Q2EiX1yO/sqWPnngkD3dmNLnGUVdQslzZF/zHXf?=
 =?iso-8859-1?Q?hAEdKsprGsBsoBpz9ihfEnsua9IHpeRk3LF3Jb4pUgLQG1leOGKG/hteUG?=
 =?iso-8859-1?Q?m0tPgbvXUCl4hvs0iJGnDOSxCi26tYX744vcOXlGoYfw4CMaKWqCTio95a?=
 =?iso-8859-1?Q?sk+sBh6DkcVf2URe9oHCs+31SsHu0bU4K3Uu8kJotmFAufXoxppKnDS4UG?=
 =?iso-8859-1?Q?AG4lrqBtm1t0GUE1b1wuCmAqVxWCS/vXRQB9C4b15M8FeK7JZbfcxAgHTe?=
 =?iso-8859-1?Q?FVZ1aomVZ8iOhXVOeLiHOOw9cU3E+2g+2ic6QbROU4VZmVUaGhynfqWEzP?=
 =?iso-8859-1?Q?v1MaCDIHyF4iIlqlo53ztatzKSEw6SRuZc9aHSboTr65Wjiy7YYXbqbPTn?=
 =?iso-8859-1?Q?uHsvZIkmFELGFhi0Ed4uSWAlbr0e9obWcU3lh53uzWnNgqq7ZzMvWlomeg?=
 =?iso-8859-1?Q?gdHwO5R/PUK1C66KBnUFkxVYMMChh0QSvW0oDW3OmXNw/V4SJ/ng4ZCQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0416be66-3621-40c6-5c06-08ddce57a6ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 04:23:21.2623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00M3fDErb6IRm+xaJVsZ3RgkW1Vm1EBIM4pYCaVOU46IPaNUbQaeLcRq7FC9f8u4eNAPen4IloCq2h7kpqjxWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
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

On Mon, Jul 28, 2025 at 08:52:26PM -0700, Matthew Brost wrote:
> On Tue, Jul 22, 2025 at 07:05:13PM +0530, Himal Prasad Ghimiray wrote:
> > This driver-specific ioctl enables UMDs to control the memory attributes
> > for GPU VMAs within a specified input range. If the start or end
> > addresses fall within an existing VMA, the VMA is split accordingly. The
> > attributes of the VMA are modified as provided by the users. The old
> > mappings of the VMAs are invalidated, and TLB invalidation is performed
> > if necessary.
> > 
> > v2(Matthew brost)
> > - xe_vm_in_fault_mode can't be enabled by Mesa, hence allow ioctl in non
> > fault mode too
> > - fix tlb invalidation skip for same ranges in multiple op
> > - use helper for tlb invalidation
> > - use xe_svm_notifier_lock/unlock helper
> > - s/lockdep_assert_held/lockdep_assert_held_write
> > - Add kernel-doc
> > 
> > v3(Matthew Brost)
> > - make vfunc fail safe
> > - Add sanitizing input args before vfunc
> > 
> > v4(Matthew Brost/Shuicheng)
> > - Make locks interruptable
> > - Error handling fixes
> > - vm_put fixes
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile        |   1 +
> >  drivers/gpu/drm/xe/xe_vm_madvise.c | 306 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
> >  3 files changed, 322 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 83a36c47a2f9..fa52866bb72c 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -125,6 +125,7 @@ xe-y += xe_bb.o \
> >  	xe_uc.o \
> >  	xe_uc_fw.o \
> >  	xe_vm.o \
> > +	xe_vm_madvise.o \
> >  	xe_vram.o \
> >  	xe_vram_freq.o \
> >  	xe_vsec.o \
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > new file mode 100644
> > index 000000000000..f64728120d7c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -0,0 +1,306 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include "xe_vm_madvise.h"
> > +
> > +#include <linux/nospec.h>
> > +#include <drm/xe_drm.h>
> > +
> > +#include "xe_bo.h"
> > +#include "xe_pt.h"
> > +#include "xe_svm.h"
> > +
> > +struct xe_vmas_in_madvise_range {
> > +	u64 addr;
> > +	u64 range;
> > +	struct xe_vma **vmas;
> > +	int num_vmas;
> > +	bool has_svm_vmas;
> > +	bool has_bo_vmas;
> > +	bool has_userptr_vmas;
> > +};
> > +
> > +static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_range)
> > +{
> > +	u64 addr = madvise_range->addr;
> > +	u64 range = madvise_range->range;
> > +
> > +	struct xe_vma  **__vmas;
> > +	struct drm_gpuva *gpuva;
> > +	int max_vmas = 8;
> > +
> > +	lockdep_assert_held(&vm->lock);
> > +
> > +	madvise_range->num_vmas = 0;
> > +	madvise_range->vmas = kmalloc_array(max_vmas, sizeof(*madvise_range->vmas), GFP_KERNEL);
> > +	if (!madvise_range->vmas)
> > +		return -ENOMEM;
> > +
> > +	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, end=0x%016llx", addr, addr + range);
> > +
> > +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
> > +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> > +
> > +		if (xe_vma_bo(vma))
> > +			madvise_range->has_bo_vmas = true;
> > +		else if (xe_vma_is_cpu_addr_mirror(vma))
> > +			madvise_range->has_svm_vmas = true;
> > +		else if (xe_vma_is_userptr(vma))
> > +			madvise_range->has_userptr_vmas = true;
> > +
> > +		if (madvise_range->num_vmas == max_vmas) {
> > +			max_vmas <<= 1;
> > +			__vmas = krealloc(madvise_range->vmas,
> > +					  max_vmas * sizeof(*madvise_range->vmas),
> > +					  GFP_KERNEL);
> > +			if (!__vmas) {
> > +				kfree(madvise_range->vmas);
> > +				return -ENOMEM;
> > +			}
> > +			madvise_range->vmas = __vmas;
> > +		}
> > +
> > +		madvise_range->vmas[madvise_range->num_vmas] = vma;
> > +		(madvise_range->num_vmas)++;
> > +	}
> > +
> > +	if (!madvise_range->num_vmas)
> > +		kfree(madvise_range->vmas);
> > +
> > +	vm_dbg(&vm->xe->drm, "madvise_range-num_vmas = %d\n", madvise_range->num_vmas);
> > +
> > +	return 0;
> > +}
> > +
> > +static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
> > +				      struct xe_vma **vmas, int num_vmas,
> > +				      struct drm_xe_madvise *op)
> > +{
> > +	/* Implementation pending */
> > +}
> > +
> > +static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
> > +			   struct xe_vma **vmas, int num_vmas,
> > +			   struct drm_xe_madvise *op)
> > +{
> > +	/* Implementation pending */
> > +}
> > +
> > +static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> > +			      struct xe_vma **vmas, int num_vmas,
> > +			      struct drm_xe_madvise *op)
> > +{
> > +	/* Implementation pending */
> > +}
> > +
> > +typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
> > +			     struct xe_vma **vmas, int num_vmas,
> > +			     struct drm_xe_madvise *op);
> > +
> > +static const madvise_func madvise_funcs[] = {
> > +	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
> > +	[DRM_XE_MEM_RANGE_ATTR_ATOMIC] = madvise_atomic,
> > +	[DRM_XE_MEM_RANGE_ATTR_PAT] = madvise_pat_index,
> > +};
> > +
> > +static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
> > +{
> > +	struct drm_gpuva *gpuva;
> > +	struct xe_tile *tile;
> > +	u8 id, tile_mask;
> > +
> > +	lockdep_assert_held_write(&vm->lock);
> > +
> > +	/* Wait for pending binds */
> > +	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
> > +				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
> > +		XE_WARN_ON(1);
> > +
> > +	tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
> > +
> > +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
> > +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> > +
> > +		if (xe_vma_is_cpu_addr_mirror(vma))
> 
> I think:
> 
> xe_vma_is_cpu_addr_mirror(vma) || xe_vma_is_null(vma)
> 
> No need to invalidate NULL VMA's as those mappings are not modified by
> madvise (i.e., you can call madvise on NULL mappings but it doesn't
> actually do anything).
> 
> > +			continue;
> > +
> > +		for_each_tile(tile, vm->xe, id) {
> > +			if (xe_pt_zap_ptes(tile, vma)) {
> > +				tile_mask |= BIT(id);
> > +
> > +				/*
> > +				 * WRITE_ONCE pairs with READ_ONCE
> > +				 * in xe_vm_has_valid_gpu_mapping()
> > +				 */
> > +				WRITE_ONCE(vma->tile_invalidated,
> > +					   vma->tile_invalidated | BIT(id));
> > +			}
> > +		}
> > +	}
> > +
> > +	return tile_mask;
> > +}
> > +
> > +static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
> > +{
> > +	u8 tile_mask = xe_zap_ptes_in_madvise_range(vm, start, end);
> > +
> > +	if (!tile_mask)
> > +		return 0;
> > +
> > +	xe_device_wmb(vm->xe);
> > +
> > +	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end, tile_mask);
> > +}
> > +
> > +static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madvise *args)
> > +{
> > +	if (XE_IOCTL_DBG(xe, !args))
> > +		return false;
> > +
> > +	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->start, SZ_4K)))
> > +		return false;
> > +
> > +	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->range, SZ_4K)))
> > +		return false;
> > +
> > +	if (XE_IOCTL_DBG(xe, args->range < SZ_4K))
> > +		return false;
> > +
> > +	switch (args->type) {
> > +	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
> > +		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
> > +				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
> > +			return false;
> > +
> > +		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.pad))
> > +			return false;
> > +
> > +		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
> > +			return false;
> > +		break;
> > +	case DRM_XE_MEM_RANGE_ATTR_ATOMIC:
> > +		if (XE_IOCTL_DBG(xe, args->atomic.val > DRM_XE_ATOMIC_CPU))
> > +			return false;
> > +
> > +		if (XE_IOCTL_DBG(xe, args->atomic.pad))
> > +			return false;
> > +
> > +		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
> > +			return false;
> > +
> > +		break;
> > +	case DRM_XE_MEM_RANGE_ATTR_PAT:
> > +		/*TODO: Add valid pat check */
> > +		break;
> > +	default:
> > +		if (XE_IOCTL_DBG(xe, 1))
> > +			return false;
> > +	}
> > +
> > +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +/**
> > + * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
> > + * @dev: DRM device pointer
> > + * @data: Pointer to ioctl data (drm_xe_madvise*)
> > + * @file: DRM file pointer
> > + *
> > + * Handles the MADVISE ioctl to provide memory advice for vma's within
> > + * input range.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > +{
> > +	struct xe_device *xe = to_xe_device(dev);
> > +	struct xe_file *xef = to_xe_file(file);
> > +	struct drm_xe_madvise *args = data;
> > +	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
> > +							 .range =  args->range, };
> > +	struct xe_vm *vm;
> > +	struct drm_exec exec;
> > +	int err, attr_type;
> > +
> > +	vm = xe_vm_lookup(xef, args->vm_id);
> > +	if (XE_IOCTL_DBG(xe, !vm))
> > +		return -EINVAL;
> > +
> > +	if (!madvise_args_are_sane(vm->xe, args)) {
> > +		err = -EINVAL;
> > +		goto put_vm;
> > +	}
> > +
> 
> I think as this code can modify the ranges during a VMA split, you will
> need to ensure all queued unmaps prior to this are complete.
> 

The explaination is wrong, but it is still needed. You need a flush of
garbage collector because it can modify VMAs and we need that view to be
current. Feel free add this in this patch or patch 20.

Matt

> So call xe_svm_flush(vm) prior to taking any locks.
> 
> Looks good otherwise.
> 
> Matt
> 
> > +	err = down_write_killable(&vm->lock);
> > +	if (err)
> > +		goto put_vm;
> > +
> > +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
> > +		err = -ENOENT;
> > +		goto unlock_vm;
> > +	}
> > +
> > +	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
> > +	if (err)
> > +		goto unlock_vm;
> > +
> > +	err = get_vmas(vm, &madvise_range);
> > +	if (err || !madvise_range.num_vmas)
> > +		goto unlock_vm;
> > +
> > +	if (madvise_range.has_bo_vmas) {
> > +		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> > +		drm_exec_until_all_locked(&exec) {
> > +			for (int i = 0; i < madvise_range.num_vmas; i++) {
> > +				struct xe_bo *bo = xe_vma_bo(madvise_range.vmas[i]);
> > +
> > +				if (!bo)
> > +					continue;
> > +				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
> > +				drm_exec_retry_on_contention(&exec);
> > +				if (err)
> > +					goto err_fini;
> > +			}
> > +		}
> > +	}
> > +
> > +	if (madvise_range.has_userptr_vmas) {
> > +		err = down_read_interruptible(&vm->userptr.notifier_lock);
> > +		if (err)
> > +			goto err_fini;
> > +	}
> > +
> > +	if (madvise_range.has_svm_vmas) {
> > +		err = down_read_interruptible(&vm->svm.gpusvm.notifier_lock);
> > +		if (err)
> > +			goto unlock_userptr;
> > +	}
> > +
> > +	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
> > +	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args);
> > +
> > +	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
> > +
> > +	if (madvise_range.has_svm_vmas)
> > +		xe_svm_notifier_unlock(vm);
> > +
> > +unlock_userptr:
> > +	if (madvise_range.has_userptr_vmas)
> > +		up_read(&vm->userptr.notifier_lock);
> > +err_fini:
> > +	if (madvise_range.has_bo_vmas)
> > +		drm_exec_fini(&exec);
> > +	kfree(madvise_range.vmas);
> > +	madvise_range.vmas = NULL;
> > +unlock_vm:
> > +	up_write(&vm->lock);
> > +put_vm:
> > +	xe_vm_put(vm);
> > +	return err;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > new file mode 100644
> > index 000000000000..b0e1fc445f23
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_VM_MADVISE_H_
> > +#define _XE_VM_MADVISE_H_
> > +
> > +struct drm_device;
> > +struct drm_file;
> > +
> > +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> > +			struct drm_file *file);
> > +
> > +#endif
> > -- 
> > 2.34.1
> > 

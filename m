Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC43C369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 03:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1313C10E6B5;
	Wed, 30 Apr 2025 03:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/unF2ar";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21CA10E6B5
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 03:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745984940; x=1777520940;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=or1QIXNZYBqnwVVsvkEfuCBsIN8BnqYS3IfycXxyqxc=;
 b=V/unF2ary2Nfu/0adhWinvPGqk/8KKBDHp4wP916B3Y8IhVLk2NgcnLa
 vvR1UB7Ki936FdVUAg76jT8gOZhE30I3txbMDXeWLmaKt6KdAG+6XqLDK
 7teqjdtWw0faZrHaqBlRVrgDYOFUC3CE5lv7rq/thbaxeiS+jo07U1i9E
 FtseIXik7IDzSw6flAUsZ6TL/5iibQxWUBlBXA6kspWDB+smr+TVNY+l2
 bj7nLupbedIWZlFwsFRij3hYqIsBwnlkWi+sogBNnM0Y16XuyBnrZC1/T
 LBu8Fb6qPwDV1cWBlsLwnlRm6XCKb7PUflA1Qv5/Pt3yrK4wyLbouQSYK g==;
X-CSE-ConnectionGUID: 0NiNsO3URzeQZoinnphB0w==
X-CSE-MsgGUID: nKHBjg22SYi76aYGbKpZpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47512837"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="47512837"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 20:48:58 -0700
X-CSE-ConnectionGUID: EzAcRcKZQcu1i3zUpqzWnQ==
X-CSE-MsgGUID: +1yctX4tT2u5jF1UU3uWNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="139184835"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 20:48:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 20:48:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 20:48:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 20:48:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reFEAGazEEO0gK9K/YzLfjYBkLX7DXFxEvSozLgM6+5X1fEkIu1VIdgpbjc77nJx32gaq9yA5YCylRSmbiHi042lCEboQ4djBX5qdLD5oxUBEWAcunH7GMB3bo4Aiw+190g+MJbJULOKFpc/KE8//7jrBKUbHWGS3Pw6+Ly2R9kT9uHIS2I3eHOMkV6J+oyCmtmPoYvlQfO4TH5CVd5oCulwrlPGUeIXH4r+huqC+LCL75xwqVKef7MuCLO2Jmr1C1XJ5KNAVDSGvdyyWNbxy4m+nfucbKw6NNAdfgdUTakbSjNi1JJHJwlw+5iLlfYLl9LqmcZWLL4z96BqIhdTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1sq9Xaiv/toJRZSuThsL6XEw01WfI6tdLMiiBSJWug=;
 b=cU1/fTq3gQ3LqkqQFmG69cvYQM3MCF8bhKVA+TxighjGBCIz4e5z1VrSaxvPgRjxroxcNQtlobkvysJ64LKs88ja3ikh6LxuhMxzakVNtvK7ixnUPZc4HyLQdW+P5XP+HKLD0wdYIhRydCbGS6i63i+qmWqO3udoUDEpwDETyylDNydpanZ6i827dz4EdHg5v1FcZgyTQS1wvWsr77DfFUkp3ZK7u9uxXjXHBsjicomyM6AAWOeGywRaTyM0RlthvJ1uhNd4VVxmuMBAmBsPKI2CI51AbypHdMm11kEggOqKFPGwcvu0SpmdpOo1BW6llBcufl3xVwUjkakmOyKATw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB8063.namprd11.prod.outlook.com (2603:10b6:510:252::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 30 Apr
 2025 03:48:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 03:48:29 +0000
Date: Tue, 29 Apr 2025 20:49:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 16/20] drm/xe/svm: Add
 xe_svm_range_validate_and_evict() function
Message-ID: <aBGd4EkBZ7M8BQqE@lstrano-desk.jf.intel.com>
References: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
 <20250429104233.215602-17-himal.prasad.ghimiray@intel.com>
 <aBEdqtL8XqbUI+Bq@lstrano-desk.jf.intel.com>
 <9f3f41e3-f3d0-49d6-ad3f-e725d86cd210@intel.com>
 <53f0955b-0236-4b49-a2cf-e74b7d0c8300@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53f0955b-0236-4b49-a2cf-e74b7d0c8300@intel.com>
X-ClientProxiedBy: BYAPR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:a03:114::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: b476fccd-734e-4c22-6abe-08dd8799de8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QhGELmBG+wuyxS49vbVM52G9DYi4WlspnAF2wTBlKwgCVs0tBCn/gi8zOJ?=
 =?iso-8859-1?Q?jH0sp8cck/uA8r6GMZO6pWYrRaE10OCmlFIiy5QoxS/Si7uiGP5mrxROiD?=
 =?iso-8859-1?Q?NnPK0ZuC5VI8qQMCWFyC2yi1mWnBdiroVE58TFV9w/fF9kyAjQDU+UPTNe?=
 =?iso-8859-1?Q?FrHtOBmS2GWaWFj8mRoAFWaxpxBoGXQAnBkYbQRFsuh0vbaHgWA13QRlXC?=
 =?iso-8859-1?Q?ilYfIG8lD9H/uAw0FGzWEDkEt3lNupI+GnH65MbZNlcGElR7V3aWsYITJx?=
 =?iso-8859-1?Q?KKJW1DXXYmj4/MRaHEadRQb145zyL60LLhXLHPa2vynD6rI17zcpn77Mey?=
 =?iso-8859-1?Q?gzq7ZiRHGTW+AGFJDMQQUy2JgvR1UoOgaWtyDt2bJr/Pc03VuV2+zRUS7G?=
 =?iso-8859-1?Q?clzqdL4yYBS9BP1f1sKjyH2+Ldrsyc2s97jIg3LLHkXVmnNFpnsTOPRv6L?=
 =?iso-8859-1?Q?t3UZh9Dw5vd1nYg/MAOUU78KAC60piewhWMG1WBS9acSo1nBMUM+n+M3OT?=
 =?iso-8859-1?Q?kFf57OnFUUT+JjWeBGzSmCldG/yR+w5yct9Lkep5VDk+bqbP2zSicvckNu?=
 =?iso-8859-1?Q?wT6/0iovNvNzBXpn/QsEjrh9UX0/JpqWEjdygHn7O9NFny2t7s0joDL0ca?=
 =?iso-8859-1?Q?t1D5UGgZ7MMZsAZXUqNHAbSVUKFCSgmYKrbmODWBabK5H4fBx3nb0Vz/7V?=
 =?iso-8859-1?Q?PstzCj0HiCODH9hJe3kfz7XsqUagtM7bs69zrotAq96oCgBMoIHZVo8JiW?=
 =?iso-8859-1?Q?cdCf8OgR73kVDwwVjczA08dIAY+b16uRLGvCziO1isN+7I1rPrdLIMO+Wz?=
 =?iso-8859-1?Q?DGdcnrK55jTbCvAgvslpv3mHUxYFYp4trTHLu7TG7aRBty6dWyJaevEdwF?=
 =?iso-8859-1?Q?p59pgPoCHEcRLZ0f7P4ZDKX83qu+PZsAEqmz9F18Zai+znB6EpPiw5QHWm?=
 =?iso-8859-1?Q?vVGZdsCMkOuQNP3qjZ7YzLc9tYWRXkuDX2/GhUbe9VkVoGQs8TqiBTCent?=
 =?iso-8859-1?Q?c2motg9EqPnG4IDBHj23FQToD/TGruLJ21Av7ZQmb1p8eLRmJarzD5LDNB?=
 =?iso-8859-1?Q?aB71+7UkM/ztElWSG2n5XrD+TdRS0QoOeZPMu/ObiElCkMNmykthF4mFyF?=
 =?iso-8859-1?Q?L5cboSTv+AlO2mSd6eXUPBK5VWdRpuRSQWYuuVl7zjxCccc/qyQihD/uvt?=
 =?iso-8859-1?Q?TuL8sJiAlu9v7hjqW+GskpRfQhpfnJu29tx94TCR+61azZgwjw6mPZA0FN?=
 =?iso-8859-1?Q?4soRfMUV2lolc8oL0nfKEYSX+H6L6UhxKEPg8h6kF9bRsrIYZjay4oM/bK?=
 =?iso-8859-1?Q?m0M/buPpSTNhEFUx+0kqfVWC1+zw5AVKoBmhnU91ScVho3XoRQU+ODhXKk?=
 =?iso-8859-1?Q?pf6k4WI3VRcGleTMSTSId470voTD48jS9HCElL6O2jc5Fb2Zo4XaU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qqayWlrRNcix4rjsLjPdDn6BfDAVN6jjHlIYuWC29PkL5DCWKBV0XenkH9?=
 =?iso-8859-1?Q?EJw6AFFVOJEBbFdsSstpsO+K4z6/KbTRhKFbLqebtkicUBDg1bdnIs2pJF?=
 =?iso-8859-1?Q?Gx66zKIC3OG41BF76n8+4KJBUmt1dWhwbF3LowP+w4Tv+1Jndj5/Iffssh?=
 =?iso-8859-1?Q?3ftpImdemoB7oURFf/D3GCHVPfjW+bzDddseomycm/+wMqlLg0iaMFSu3Q?=
 =?iso-8859-1?Q?tv7xHaRmyP/JlRm3YeE/epvRk9Hag/sFLPiBA8VdhgTY2itVOYeNjWyHa+?=
 =?iso-8859-1?Q?3h+4olPmKJxWr6KxzSKLll3RsfS8lUf8EKV3UPX8b7i/HObaHswYPH/s4D?=
 =?iso-8859-1?Q?gLWEMEiPLg4Gz8Usgf8nQ7NrtHAkYyz60FvyKnxpieIgdbDLd9vFrbbejA?=
 =?iso-8859-1?Q?j4D0JFnIrXKiNOsl4/To5CbFLPQ2XBW1s2gkz6kxQOnz0j0Z7ENCR8mtSh?=
 =?iso-8859-1?Q?6kDM5Io/hI2m8j7grJERQNGd4He2i8IJWx17XNjYivCAHYy298ilJU+X/g?=
 =?iso-8859-1?Q?MqwxBudJ0q9zFHKnSkvAwyV9LX7VI9gw/71FWyAYqOIQfMOZdpOv6ipqbR?=
 =?iso-8859-1?Q?kR+sT+mxGMswmeZ4jrOOjbo+Hoj0JsJvsJWbzeIJpbUA+k9pQBozrx6Xud?=
 =?iso-8859-1?Q?Noz8m0PllMJ7Mp68mvXH0VtaAU14RLAANqtmunzoxGUlSgfgJOCd8W1hur?=
 =?iso-8859-1?Q?WWfBiVK2kziI1VXm/YgJ3t//KiTXuUBYV8J1X+jTvzzUGczo6/OSXk4Z2T?=
 =?iso-8859-1?Q?q6J7Y8IQ951c5C93SFEwDk+EWHj98zL7bI6NwLmvmPuYxOIep0WkmsL+qd?=
 =?iso-8859-1?Q?cK1yACuv3gglB36J6X4eFlAnXeH2tji0DDW9uzyf++5Iqwv4SN4QwOPijk?=
 =?iso-8859-1?Q?Lj6vEcYfHjXEy21duYplV7ZTFkNJ3CoU4dVQMih8AjA+jUHwqF84gZ3ll3?=
 =?iso-8859-1?Q?2pqSZGwR77F4HkYi6qzNpMlPsmyUQmp6fCPz1ydjtYIIroQsuKOvp3+GJ3?=
 =?iso-8859-1?Q?xV+6ptnjnG8KTkPxVyDvObQQMJ6FPlwaEvivrbxBHumPEjvrr3ai5gtysS?=
 =?iso-8859-1?Q?J9tA183poidKpnzxrRPAg+LVUmEKf0P6jNpdJBLmzB1xbSyREdQLXKBotP?=
 =?iso-8859-1?Q?xzpF027/D7p+GOW0Qj2TN+KuxBINXWhamz68u7YXlmfOKgky47uqbGVZPg?=
 =?iso-8859-1?Q?smhUdFMBVfsESnx/jt8ozUvF5PHrDXr7TbMBsZY2cHoDR2eXx59UjdgIal?=
 =?iso-8859-1?Q?n4HgVQxOslCkiqdMVmPBZJ44DARFLBFPawhqRWf2scokViM07wA62NaRUT?=
 =?iso-8859-1?Q?RRcPoOl/k5GmZaQU8bHWPj7OTGE6P1f11nVsOPS8E31uUhteNoy0qe9Ban?=
 =?iso-8859-1?Q?n/x48nERLZvoTygoS4Mku6Eh21HDdn7abB4iaezKCf8ZfZ39Fw6ca3D/Z/?=
 =?iso-8859-1?Q?7VygVVIb+KbKoW1WBh/l7VOtPDwGuBUxLgbhUVf5DmfKdl/InLVE1H9DMn?=
 =?iso-8859-1?Q?6id0sYWMIKrl7hZUVXl2WrgH2xunZymYGB6Eb5RVNH0524VgpyGKXql7Sj?=
 =?iso-8859-1?Q?wX7LctstDNrGsQr+gYiNQerqkXrIUh5nRrAB3dcG0ew6Wg9QrRJIrJtOAY?=
 =?iso-8859-1?Q?fOHRaAKAuXgSNKmB9vROyZx5jZBi9PUNmp+18bO28X7nxJQ9U7BgW4dg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b476fccd-734e-4c22-6abe-08dd8799de8f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 03:48:29.1778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNYBS3mDL2ZfM9eGedNoGNtk4FwK39K41r+4SF7Hxur0f/cGpTxvq6rhXmK9PLgEwHamshZEMKdzAG1ygmhGrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8063
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

On Wed, Apr 30, 2025 at 09:15:43AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 30-04-2025 09:04, Ghimiray, Himal Prasad wrote:
> > 
> > 
> > On 30-04-2025 00:12, Matthew Brost wrote:
> > > On Tue, Apr 29, 2025 at 04:12:29PM +0530, Himal Prasad Ghimiray wrote:
> > > > The xe_svm_range_validate_and_evict() function checks if a range is
> > > > valid and located in the desired memory region. Additionally, if the
> > > > range is valid in VRAM but the desired region is SMEM, it evicts the
> > > > ranges to SMEM.
> > > > 
> > > > v2
> > > > - Fix function stub in xe_svm.h
> > > > - Fix doc
> > > > 
> > > > v3 (Matthew Brost)
> > > > - Remove extra new line
> > > > - s/range->base.flags.has_devmem_pages/xe_svm_range_in_vram
> > > > 
> > > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_svm.c | 37 +++++++++++++++++++++++++++++++++++++
> > > >   drivers/gpu/drm/xe/xe_svm.h | 12 ++++++++++++
> > > >   2 files changed, 49 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > > index 90fae13b77ae..55c5373b7989 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > @@ -637,6 +637,43 @@ static bool xe_svm_range_is_valid(struct
> > > > xe_svm_range *range,
> > > >           && (!devmem_only || range->base.flags.migrate_devmem);
> > > >   }
> > > > +/**
> > > > + * xe_svm_range_validate_and_evict() - Check if the SVM range is valid
> > > > + * @vm: xe_vm pointer
> > > > + * @range: Pointer to the SVM range structure
> > > > + * @tile_mask: Mask representing the tiles to be checked
> > > > + * @devmem_only: if true range needs to be in devmem
> > > > + *
> > > > + * The xe_svm_range_validate_and_evict() function checks if a range is
> > > > + * valid and located in the desired memory region. Additionally, if the
> > > > + * range is valid in VRAM but the desired region is SMEM, it evicts the
> > > > + * ranges to SMEM.
> > > > + *
> > > > + * Return: true if the range is valid, false otherwise
> > > > + */
> > > > +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
> > > > +                     struct xe_svm_range *range,
> > > > +                     u8 tile_mask, bool devmem_only)
> > > 
> > > s/devmem_only/devmem_preferred
> > 
> > Sure
> > 
> > > 
> > > > +{
> > > > +    bool range_evict = false;
> > > > +    bool ret;
> > > > +
> > > > +    xe_svm_notifier_lock(vm);
> > > > +
> > > > +    ret = (range->tile_present & ~range->tile_invalidated &
> > > > tile_mask) == tile_mask &&
> > > > +           (devmem_only == xe_svm_range_in_vram(range));
> 
> I see xe_svm_range_in_vram is moved to using READ_ONCE in
> https://patchwork.freedesktop.org/patch/650869/?series=147846&rev=5.
> 

Let's see if Thomas likes this.

> Since we are in agreement of using locking here, how about using
> range->base.flags.has_devmem_pages instead of xe_svm_range_in_vram().
>

Assuming he does, then yea I think range->base.flags.has_devmem_pages
makes sense here as no need for the read_once flow.

Matt
 
> 
> > > > +
> > > > +    if (!ret && !devmem_only && xe_svm_range_in_vram(range))
> > > > +        range_evict = true;
> > > > +
> > > > +    xe_svm_notifier_unlock(vm);
> > > > +
> > > > +    if (range_evict)
> > > > +        drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> > > 
> > > Sorry missed this eariler. I think this step should be left to latter in
> > > the software pipeline - e.g., In prefetch_ranges in the following patch.
> > > 
> > > Migration are costly and this is the step we'd want to thread for
> > > performancd. So if some migrations are done in vm_bind_ioctl_ops_create
> > > and other in prefetch_ranges it would make the threading logic tricky
> > > comapred all migrations being done in prefetch_ranges.
> > 
> > Agreed, will move to prefetch_ranges
> > 
> > > 
> > > Matt
> > > 
> > > > +
> > > > +    return ret;
> > > > +}
> > > > +
> > > >   #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > > >   static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
> > > >   {
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > > > index 9be7bb25725c..e6f71ad0b17b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > @@ -83,6 +83,10 @@ int xe_svm_range_get_pages(struct xe_vm *vm,
> > > > struct xe_svm_range *range,
> > > >   bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range
> > > > *range, struct xe_vma *vma,
> > > >                       bool preferred_region_is_vram);
> > > > +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
> > > > +                     struct xe_svm_range *range,
> > > > +                     u8 tile_mask, bool devmem_only);
> > > > +
> > > >   /**
> > > >    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
> > > >    * @range: SVM range
> > > > @@ -276,6 +280,14 @@ bool
> > > > xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range,
> > > > struct xe_vm
> > > >       return false;
> > > >   }
> > > > +static inline
> > > > +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
> > > > +                     struct xe_svm_range *range,
> > > > +                     u8 tile_mask, bool devmem_only)
> > > > +{
> > > > +    return false;
> > > > +}
> > > > +
> > > >   #define xe_svm_assert_in_notifier(...) do {} while (0)
> > > >   #define xe_svm_range_has_dma_mapping(...) false
> > > > -- 
> > > > 2.34.1
> > > > 
> > 
> 

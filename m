Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD48AC5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 15:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9504810E63C;
	Wed, 28 May 2025 15:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dq/jYx5r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487CB10E62E
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 15:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748447352; x=1779983352;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3v3UWEXZViv5Nrg0GTFYbCNY94r3CZVrxMsbnqlCUJU=;
 b=Dq/jYx5rS2Li2bSx0GKkbtP3hC2Z72vhdBjXwoSylyY53vdejl6IZtU5
 gQ2xAJz0WZyhMPV4nj8JINjy6+B7vgc5mVd4iSh4aI2IJcvDYZfjj+NxQ
 y5qSOoTIcibjrS70d64ARSL8Xs1xReszr4xO9fIWYX7E8hvBsxDDTggtP
 y+d0zHyfTvD7PpXItQBH8fAGeK0uGlIqMAi8eMBMbBYpnLsAbdzY/MV2r
 YDTXNt97jPR4w3drpP+U/lEgaJcuXXUhT2/y+w1hzzlUi7lmWtzEreKAX
 k0qrx+/A7GkyvWpem037/3qAF2hJ4SsMybmyJo81KL7cqtsJt+1ejHp5H Q==;
X-CSE-ConnectionGUID: 9bjgEPiWTdK3Fp7QJmfNpA==
X-CSE-MsgGUID: O1Hcdv13QuCgLOVb8EwD/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50366098"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="50366098"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 08:49:12 -0700
X-CSE-ConnectionGUID: SCc+FNyaRmyhwPmreYGNMA==
X-CSE-MsgGUID: 8gaZ1ojtTTq5ioE4yPpWoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="143611292"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 08:49:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 08:49:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 08:49:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.85) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 08:49:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anhHZjzZWnUdNqKWfE1kxN3D6+XIDwO0AztO5qpCKp69AkVEBQefwNVxU7Ok5ytmtanr7C5HqQRUQqHMgJ0+VUpPH3stgohEXRnVVntK3hXEMucUgMqMEIcNoxOryYlWCWfU/CB5hps8h3NEwzNCaBYiC0Fp7r7DXipTpyXElp/BWR6N/+sUBTOu12AZ4LavmQSYpOyDX5tBvsb0FAmC3mV3GsTM4PJKtPTS1cvs/v6Vl6SQC5mQfoSOnoEtNNUl7M7Ja728lRBd5Q+kEpbpT9JH5TktjHXp0F9389M/Jwt5XbOfBAiqMa0DiSpWLRtIoHMVmb7Gpr1qY0SyJvZBeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7gQ318eEbA+RcUInKK9J0sIwOc7fpW0FHTvWhXlIbY=;
 b=sQy10k6n4LKiHLBr5Vtpan+pMzk7l/EYhbfXTO51iPDIRt5BLez0A/3oNYRrjoEFZmmDy8zxWmxOg4scu6QIn1XcbTRwYcxfYlTtnQ4T/xYEK7lhtsDrRSskWbAfvAlFMYkYUTYX1SO/ns58YA8mLfJDW4MA4xitbI5vzRRr1CJissGBUXBKiwTkka0hPpU5ijEKMSzeTSA8S4ypdDgquyGvAVsrBK4nYpBZsJZRwLC1nybrPAyViDK0EsbURaE4T9+JvqPQAfOSPv0GxCKFrKC1a7Ol8Dz37p6uPiuWrKhoW+5aFtP2KHqNB3Q6Rrd2fmuzXU9AypG71Uwt/4ofNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7085.namprd11.prod.outlook.com (2603:10b6:806:2ba::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 28 May
 2025 15:49:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 15:49:05 +0000
Date: Wed, 28 May 2025 08:50:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Oak Zheng <oak.zheng@intel.com>
Subject: Re: [PATCH v2] drm/xe: Rework eviction rejection of bound external bos
Message-ID: <aDcwzQGkPl61xeuV@lstrano-desk.jf.intel.com>
References: <20250526161632.20694-1-thomas.hellstrom@linux.intel.com>
 <aDYLEuObNlqzG9qg@lstrano-desk.jf.intel.com>
 <e5483b1596456e71ed4d878a53327ab106ec7f02.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5483b1596456e71ed4d878a53327ab106ec7f02.camel@linux.intel.com>
X-ClientProxiedBy: MW4P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: a47df577-985e-478e-8d80-08dd9dff2d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CChdJLK7L7e3MHJ7aIzygW16IF9cJaTK/nKu04yTnK1nGCcWhNSwk7w2Lb?=
 =?iso-8859-1?Q?qIVdbt6jvBjbRxqafk0yCmms3mhlYqxmEvnu07j+s0RQcfW+Xrd8WMjLYV?=
 =?iso-8859-1?Q?xiCwAyBnnYKUnpCOucVbmdUbvPnG2GyOuxloflXYTAUhkp60zgmJzTfLix?=
 =?iso-8859-1?Q?McUdCfR1IiAedaPtrsa6XGgsoD6bCaBq/pizMjTKx538HplgjbibaGa7zX?=
 =?iso-8859-1?Q?vvHoaldh7OeQtjqkFEEmgQQcsu/3qqNcpGST2B0VtWuxeRWfR3H+DLAD8O?=
 =?iso-8859-1?Q?qvZeV7lfKk6qOrYGxoSKACKtgYaVRU+gK/hVGqwNRwEXZdLNamk+azysdb?=
 =?iso-8859-1?Q?ybTDm7dnKuLr3vhEVOV8lEAuLGWnF5ShjOCMMSKHnZbD5fbXuwOkUiJxZ+?=
 =?iso-8859-1?Q?GgULH8yWwAwFLWZ3m420wxBEnZZ+MXdO4apbIWhEWA4Hg29bq/zyVLKWKM?=
 =?iso-8859-1?Q?KW+t+t14Jhoxb+JGlAm4N207AZam+ryzZIv4QiGA0YtbMPPV03AVTHSFLC?=
 =?iso-8859-1?Q?fkv+dn3nMWPTtXm70Vi7loqMfjQrX7VDyuzQPogZ6s8g6vDwUF6AlDFl0q?=
 =?iso-8859-1?Q?nbBPZG5RaBIv3uoUyK/rugGXi14d/aH+6B46cc8pJ6JrGYMinQ3+RCW6b0?=
 =?iso-8859-1?Q?5AWiZOGiSF3cGFWS5lPL28VtkE6ZSAfG07Fk855QdLEe0BNUofKkbQxr77?=
 =?iso-8859-1?Q?q8GIdfwnM9ZaNSBccvyWeJ1UMpt9PVMB6Q1aPhYxCUyLWUijFMggZe4fkb?=
 =?iso-8859-1?Q?WbaTklRg6wXBDfSJZRp10gfp2EwfPXsB7YGJjak+rTMD41Mm/e71TfO4Rd?=
 =?iso-8859-1?Q?YRxX6R6J6OwCmHpNT0G9HCGdKAaF/PRI2O2id5Zz2ek9w7qlyNmjV7lAP8?=
 =?iso-8859-1?Q?S/USYUSqtZA4NTXljTn9ekLG9EHCih1UT9x2kEiFYksAqAfuCBFVmK2M40?=
 =?iso-8859-1?Q?uAnh1kG0qUxKW6Aw3GnJUtJBB0RnjyHFX5wtQV33W5uVVDaG0zV2Sz+q84?=
 =?iso-8859-1?Q?n9G2rAwtPXpIpMixc81gWY5WJYCiYmNBnQWpjC6z59uFSQnpkNA97mkBBR?=
 =?iso-8859-1?Q?1L8xbUjncdD57KzOnbDe4S1wz+vDo2zRjKhcuKlnPOhwvNcmD5Mjr3ZOD1?=
 =?iso-8859-1?Q?k2cr9n5aAbsXSWa3Ri838gK0u1zlgwWjiodBwB95ktrOlgkh33HXg8ZIcy?=
 =?iso-8859-1?Q?tGUIJQwL3PRHsavWFj0LrrYfYO2GEyNOShrojSXU+2ctF35Iurn4BW93N1?=
 =?iso-8859-1?Q?bf8G6guN0Tbs+1TFY4TXtsd8fsN5qRY0oD8u83AyUlust+VF6QsCJsU08b?=
 =?iso-8859-1?Q?mf2fHmmGgREwbvEn0XWuQdqXiQh++2ApzWstdU5wtw8BXh0+LYo0in4qII?=
 =?iso-8859-1?Q?1zkbsj1yT5vI9i2QxTtx0aVI31KfIELyk1R3+n/ZAnK+StxuQnnbg12cIy?=
 =?iso-8859-1?Q?aJHWj8YESReJQvVPfMtFwDURevYcJXAhJofwedcXImU5ePFpWjj2cfmg7b?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?e/plDkPlc8TQAcvMI+FV9x/oZtfGC+FHKZsXwhsMoKJWlBN3mrPybpTRLk?=
 =?iso-8859-1?Q?w9aQxaLPzI7sneN95kZbOKV1SvRdW992TO5kp2dYAMedfu+PcNgSrT0MVe?=
 =?iso-8859-1?Q?3nif78+cN/YBDkS3yR/Cn+Y+JEboJWDLO3SsnrtSEH3IJ5+q9QEKfl8Coc?=
 =?iso-8859-1?Q?zBsi55v1VGZNMihrLMCUVLhscoMeZ+IpWfOL0nyWkC8ZUJKrUSWPij6EML?=
 =?iso-8859-1?Q?bw8Wu9soqCnYlOOgfdtPCD6Fl+pt01t3Pzxgqfp4V0nTZBah6ZGsUf9kla?=
 =?iso-8859-1?Q?dibAaR6hg2SbBqZwC5TfZ1zxPsJ12cR6gyc9tYwfRiHDSRqeFVDEvbM1Ad?=
 =?iso-8859-1?Q?33O8VvTXqShK8sX9gmysXu1USohUHfVwIXy94Oy9O9TehOAsPyYqRQuyCT?=
 =?iso-8859-1?Q?xw1lZnSZrPfwITiO43BuLOEgOd1yBvvbGOg3BKExh+JPr2a1/Fy2vXQc5s?=
 =?iso-8859-1?Q?MhcK9N1Nk2Uwz2JUy/FwHreKGISFZzuW/ZFjqnKQa2JEG6FTiJwrGSSbDi?=
 =?iso-8859-1?Q?Rh5AqsVS3yTrh0GJnO0qv5K6WDuvmBBAp0Q6igFLYb9UNriiW/uuMGV7m0?=
 =?iso-8859-1?Q?E2Cp6a971cUQn8jHGqsEisBRszWRXuN6BketoBfytfHVJSvg3piXHQr1FL?=
 =?iso-8859-1?Q?7VPjxo+zpHwdgjMEzIZ/jSFyMQBsWQGzf3DDiTDLrc+/dEasqsWLbvsX+/?=
 =?iso-8859-1?Q?XrHZ9ZgnpbTY4glDSipTUwCvUfZBtyn2hT+WzdkNHEVO73M/UIVDy3aeqA?=
 =?iso-8859-1?Q?FKiNx1TZX9hSdgc/ER0PKKwuSdUuteL64fSPng8q3pFuRjwqTRMEkzOOUG?=
 =?iso-8859-1?Q?Ru+6pNhLcQB4PC0CkKttToWihGojvJpONwCPzw/CMLgiNh61HPOV11xHTu?=
 =?iso-8859-1?Q?PYE1q8W/TXCqqLNELp65k3QTmM4/IGrC4zPmNnpt6VsLRNhTUNL86rItxe?=
 =?iso-8859-1?Q?S2s164M1yGHotvpSYwVnHXCupINsL0Vw/9zE4gdlMSoDeN6sOav0dZoKKc?=
 =?iso-8859-1?Q?gmm0+RqLZa69NlEO5r8wDPSVYhgC6iJ7BqbMRvqmT+Mvl80cC/oqrW6o/C?=
 =?iso-8859-1?Q?52SH2chVg+WYqsRyDC9F6N3SIBDJw5qOD7t5ZWgHI9BmkPyhR3JeJcFY59?=
 =?iso-8859-1?Q?U//xmCnNaBvs2XbimFPNpCQHbrBU6qNLTJYBDHmreXCrnTRsbww+YkNm69?=
 =?iso-8859-1?Q?BtTsPgCFHU6DMWr5U0aT4wsErZpcSg9vxPnOexNcODU12fo1SyKCO1XkB7?=
 =?iso-8859-1?Q?wN72AcP7DxZpvIFwGiR4gNgw+m8pYwDnmjahwrwEjJRGBIG1AAyEaAPv0n?=
 =?iso-8859-1?Q?yrq57ZF9/U3+bfn8pkyPMkzV+P4rLyjooVt3PQ2zd0xp3xgU92DDJ1phU7?=
 =?iso-8859-1?Q?kVsz3pC9XM4bgq0jbovi6LfBEAPGEj8idHTzc1IvlwKx+ThAti9l9X6SWI?=
 =?iso-8859-1?Q?oSGBTOfb/oVD1XAWk7r9qzH+vd23e1fTQgm+SvbCC5EvYLrGjpF4+ex0d4?=
 =?iso-8859-1?Q?Qo9RRu1zdfffngLsw9gNYRQHrEclCTIP/ZSr/IMPZbH7GWnpEdrPQdAAvc?=
 =?iso-8859-1?Q?P7Idmh81uf1aQpwdHifCXFKmYXBuSGh7PIl0Iq/3UFRfb7Y7GI5IKgq7yv?=
 =?iso-8859-1?Q?xF9/FIt+BgW94tOn9K2pQbRlOI6rN3KHhcPv5wWLsoSh8MIE+7O3bXOA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a47df577-985e-478e-8d80-08dd9dff2d2a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 15:49:05.7876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWR/BMrdy7wwHJTxt36hsx4v1Beh/o8mmymUBaMWjfbYo69hitatWRVRwCZ9uYRaNBswt/+gdoKJxBL8Wa9Yrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7085
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

On Wed, May 28, 2025 at 09:37:40AM +0200, Thomas Hellström wrote:
> On Tue, 2025-05-27 at 11:57 -0700, Matthew Brost wrote:
> > On Mon, May 26, 2025 at 06:16:32PM +0200, Thomas Hellström wrote:
> > > For preempt_fence mode VM's we're rejecting eviction of
> > > shared bos during VM_BIND. However, since we do this in the
> > > move() callback, we're getting an eviction failure warning from
> > > TTM. The TTM callback intended for these things is
> > > eviction_valuable().
> > > 
> > > However, the latter doesn't pass in the struct ttm_operation_ctx
> > > needed to determine whether the caller needs this.
> > > 
> > > Instead, attach the needed information to the vm under the
> > > vm->resv, until we've been able to update TTM to provide the
> > > needed information. And add sufficient lockdep checks to prevent
> > > misuse and races.
> > > 
> > > v2:
> > > - Fix a copy-paste error in xe_vm_clear_validating()
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Fixes: 0af944f0e308 ("drm/xe: Reject BO eviction if BO is bound to
> > > current VM")
> > > Cc: Oak Zeng <oak.zeng@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c       | 46 +++++++++++++---------
> > >  drivers/gpu/drm/xe/xe_vm.h       | 65
> > > ++++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++
> > >  3 files changed, 101 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index d99d91fe8aa9..3c48a8c5f439 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -841,21 +841,6 @@ static int xe_bo_move(struct ttm_buffer_object
> > > *ttm_bo, bool evict,
> > >  		goto out;
> > >  	}
> > >  
> > > -	/* Reject BO eviction if BO is bound to current VM. */
> > > -	if (evict && ctx->resv) {
> > > -		struct drm_gpuvm_bo *vm_bo;
> > > -
> > > -		drm_gem_for_each_gpuvm_bo(vm_bo, &bo->ttm.base) {
> > > -			struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
> > > -
> > > -			if (xe_vm_resv(vm) == ctx->resv &&
> > > -			    xe_vm_in_preempt_fence_mode(vm)) {
> > > -				ret = -EBUSY;
> > > -				goto out;
> > > -			}
> > > -		}
> > > -	}
> > > -
> > >  	/*
> > >  	 * Failed multi-hop where the old_mem is still marked as
> > >  	 * TTM_PL_FLAG_TEMPORARY, should just be a dummy move.
> > > @@ -1013,6 +998,25 @@ static long xe_bo_shrink_purge(struct
> > > ttm_operation_ctx *ctx,
> > >  	return lret;
> > >  }
> > >  
> > > +static bool
> > > +xe_bo_eviction_valuable(struct ttm_buffer_object *bo, const struct
> > > ttm_place *place)
> > > +{
> > > +	struct drm_gpuvm_bo *vm_bo;
> > > +
> > > +	if (!ttm_bo_eviction_valuable(bo, place))
> > > +		return false;
> > > +
> > > +	if (!xe_bo_is_xe_bo(bo))
> > > +		return true;
> > > +
> > > +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
> > > +		if (xe_vm_is_validating(gpuvm_to_vm(vm_bo->vm)))
> > > +			return false;
> > > +	}
> > > +
> > > +	return true;
> > > +}
> > > +
> > >  /**
> > >   * xe_bo_shrink() - Try to shrink an xe bo.
> > >   * @ctx: The struct ttm_operation_ctx used for shrinking.
> > > @@ -1047,7 +1051,7 @@ long xe_bo_shrink(struct ttm_operation_ctx
> > > *ctx, struct ttm_buffer_object *bo,
> > >  	    (flags.purge && !xe_tt->purgeable))
> > >  		return -EBUSY;
> > >  
> > > -	if (!ttm_bo_eviction_valuable(bo, &place))
> > > +	if (!xe_bo_eviction_valuable(bo, &place))
> > >  		return -EBUSY;
> > >  
> > >  	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
> > > @@ -1588,7 +1592,7 @@ const struct ttm_device_funcs xe_ttm_funcs =
> > > {
> > >  	.io_mem_pfn = xe_ttm_io_mem_pfn,
> > >  	.access_memory = xe_ttm_access_memory,
> > >  	.release_notify = xe_ttm_bo_release_notify,
> > > -	.eviction_valuable = ttm_bo_eviction_valuable,
> > > +	.eviction_valuable = xe_bo_eviction_valuable,
> > >  	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
> > >  	.swap_notify = xe_ttm_bo_swap_notify,
> > >  };
> > > @@ -2431,6 +2435,8 @@ int xe_bo_validate(struct xe_bo *bo, struct
> > > xe_vm *vm, bool allow_res_evict)
> > >  		.no_wait_gpu = false,
> > >  		.gfp_retry_mayfail = true,
> > >  	};
> > > +	struct pin_cookie cookie;
> > > +	int ret;
> > >  
> > >  	if (vm) {
> > >  		lockdep_assert_held(&vm->lock);
> > > @@ -2440,8 +2446,12 @@ int xe_bo_validate(struct xe_bo *bo, struct
> > > xe_vm *vm, bool allow_res_evict)
> > >  		ctx.resv = xe_vm_resv(vm);
> > >  	}
> > >  
> > > +	cookie = xe_vm_set_validating(vm, allow_res_evict);
> > >  	trace_xe_bo_validate(bo);
> > > -	return ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
> > > +	ret = ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
> > > +	xe_vm_clear_validating(vm, allow_res_evict, cookie);
> > > +
> > > +	return ret;
> > >  }
> > >  
> > >  bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > > b/drivers/gpu/drm/xe/xe_vm.h
> > > index 99e164852f63..fe05c4f7f425 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -303,6 +303,71 @@ void xe_vm_snapshot_capture_delayed(struct
> > > xe_vm_snapshot *snap);
> > >  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct
> > > drm_printer *p);
> > >  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> > >  
> > > +/**
> > > + * xe_vm_set_validating() - Register this task as currently making
> > > bos resident
> > > + * @vm: Pointer to the vm or NULL.
> > > + *
> > > + * Register this task as currently making bos resident for the vm.
> > > Intended
> > > + * to avoid eviction by the same task of shared bos bound to the
> > > vm.
> > > + * Call with the vm's resv lock held.
> > > + *
> > > + * Return: A pin cookie that should be used for
> > > xe_vm_clear_validating().
> > > + */
> > > +static inline struct pin_cookie xe_vm_set_validating(struct xe_vm
> > > *vm,
> > > +						     bool
> > > allow_res_evict)
> > > +{
> > > +	struct pin_cookie cookie = {};
> > > +
> > > +	if (vm && !allow_res_evict) {
> > > +		xe_vm_assert_held(vm);
> > > +		cookie = lockdep_pin_lock(&xe_vm_resv(vm)-
> > > >lock.base);
> > 
> > I'm little unclear on why the cookie is needed / what
> > lockdep_pin_lock
> > does. I looked implementation for lockdep_pin_lock and it completely
> > undocumented - could you explain?
> 
> lockdep_pin_lock() warns if someone somewhere deeper in the call chain
> for some reason unlocks the specific lock while the lock is pinned.
> 

Thanks. I was able to figure this out after a bit more digging too.

> In this case that would mean that vm->validating would be set without
> the vm->resv was held.
> 
> Mostly paranoia.

Paranoia is good IMO.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> /Thomas
> 
> > 
> > Everything else makes sense and LGTM.
> > 
> > Matt
> > 
> > > +		/* Pairs with READ_ONCE in xe_vm_is_validating()
> > > */
> > > +		WRITE_ONCE(vm->validating, current);
> > > +	}
> > > +
> > > +	return cookie;
> > > +}
> > > +
> > > +/**
> > > + * xe_vm_clear_validating() - Unregister this task as currently
> > > making bos resident
> > > + * @vm: Pointer to the vm or NULL
> > > + * @cookie: Cookie obtained from xe_vm_set_validating().
> > > + *
> > > + * Register this task as currently making bos resident for the vm.
> > > Intended
> > > + * to avoid eviction by the same task of shared bos bound to the
> > > vm.
> > > + * Call with the vm's resv lock held.
> > > + */
> > > +static inline void xe_vm_clear_validating(struct xe_vm *vm, bool
> > > allow_res_evict,
> > > +					  struct pin_cookie
> > > cookie)
> > > +{
> > > +	if (vm && !allow_res_evict) {
> > > +		lockdep_unpin_lock(&xe_vm_resv(vm)->lock.base,
> > > cookie);
> > > +		/* Pairs with READ_ONCE in xe_vm_is_validating()
> > > */
> > > +		WRITE_ONCE(vm->validating, NULL);
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * xe_vm_is_validating() - Whether bos bound to the vm are
> > > currently being made resident
> > > + * by the current task.
> > > + * @vm: Pointer to the vm.
> > > + *
> > > + * If this function returns %true, we should be in a vm resv
> > > locked region, since
> > > + * the current process is the same task that called
> > > xe_vm_set_validating().
> > > + * The function asserts that that's indeed the case.
> > > + *
> > > + * Return: %true if the task is currently making bos resident,
> > > %false otherwise.
> > > + */
> > > +static inline bool xe_vm_is_validating(struct xe_vm *vm)
> > > +{
> > > +	/* Pairs with WRITE_ONCE in xe_vm_is_validating() */
> > > +	if (READ_ONCE(vm->validating) == current) {
> > > +		xe_vm_assert_held(vm);
> > > +		return true;
> > > +	}
> > > +	return false;
> > > +}
> > > +
> > >  #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> > >  void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma);
> > >  #else
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index bfc145baad49..0e1318a15c9e 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -310,6 +310,14 @@ struct xe_vm {
> > >  	 * protected by the vm resv.
> > >  	 */
> > >  	u64 tlb_flush_seqno;
> > > +	/**
> > > +	 * @validating: The task that is currently making bos
> > > resident for this vm.
> > > +	 * Protected by the VM's resv for writing. Opportunistic
> > > reading can be done
> > > +	 * using READ_ONCE. Note: This is a workaround for the
> > > +	 * TTM eviction_valuable() callback not being passed a
> > > struct
> > > +	 * ttm_operation_context(). Future work might want to
> > > address this.
> > > +	 */
> > > +	struct task_struct *validating;
> > >  	/** @batch_invalidate_tlb: Always invalidate TLB before
> > > batch start */
> > >  	bool batch_invalidate_tlb;
> > >  	/** @xef: XE file handle for tracking this VM's drm client
> > > */
> > > -- 
> > > 2.49.0
> > > 
> 

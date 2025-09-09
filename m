Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96C3CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 18:46:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AA310E26E;
	Tue,  9 Sep 2025 18:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cI1PhJ6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A6610E26E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757443602; x=1788979602;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fPsCYRk479VAlIzCLj8i2MFMcR0sgx5CYY8JwBobG2Q=;
 b=cI1PhJ6IE/muFsiUw/GmVPVhmhcYUuUVpoBB6CE9Vwwt0p3LnqhbWRqF
 LsOo4iuc0WjxgLtiOjsVCGdwCttCMwQuMjOzSjZo5yoCtVke2k/203/UE
 DPWLzX91M4BdULKPlOR7xZgVybHpARRhjzImCk7iDCIACd2w1WflW54my
 3TUxjWwwei5vT2SX9+4S93pOR7RiCax/UyUJxoTG+8gapmFaCOzIqRcoq
 K7dpZbaljghoEJc3LBGyCyfPtTqmA/mMSHaoewpkzTKfW1nbpddmKIb1i
 vt+P1L7PiD2lFjOIlXpnahp7WAwwLYrsb+GSgey4vuDMbwt8+ISoIvPa5 A==;
X-CSE-ConnectionGUID: 07UPwqS5QBGaP2QHltl74g==
X-CSE-MsgGUID: GXqA2pi/RwSrVsQDfePbQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59597039"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="59597039"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 11:46:42 -0700
X-CSE-ConnectionGUID: LYLOnqRnQMWOH2etYA2s8Q==
X-CSE-MsgGUID: eXsaXvJQTp+yPKIFDcj4aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="172447634"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 11:46:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 11:46:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 11:46:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.82)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 11:46:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TduzmZaaK3Mc7ILE2inQ4IX3WfOtHto/E7vZokLzRmROqMNrqB9mHftA7j1lRQiNmZW3TIOCpd5eBBlcefJFpjPgS6G4s3IQWn+Lo5qjAhIKlOnqfnY2xVNlMwY4GuSU3r05c9K62pkHW7FEcqYW4BTBB/l+RfSMlCMmlzzqbU99c6CBKleS16VVwI37AL4dUwhgTSLbT9aAOslrEzvrXIUcFC8d8/TM2ynJYNAuKGKIuch6Gf2erl1T7SpJAvz5vkb+pRAD2knREeXwZStt/zgjbGw/0pWhaG2uBScnzFShJ7vpDUGgiAmKszdjvVdYRCc3egkBtiwZAXxnHuXlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nza0uWPFglkEV41xcctBbU8DsWfnXOOthTch7hYOqjc=;
 b=rqnABm/YxinkzrEOd5+6pscX6hFgWTR3CtUWBtZ0P2J4xnEfgZ4SVco/UY8pBLfgRQGSb7tG1hYH2HGInOEbdhLx2ddCmmkYrocOCrD8yhb1xSWmncZQPkh/RGyLWAJTK8w1rtx3UjXf9AqvKuLQUuiwjYo/nJyicxX5rbur9ABxPUVP9iKlGxTAuqRfE19sGKVM6X1fHCXp10OqOA7791qV4+eFhPfBCl8LzNVJ3hbbL5tHSUEIl7mUTacxbJbyDaxA0tYWaurT/NwBdr9+I3nFj6Awi1JpIs4EBH6rrQgXvl07m5QSH1RQQamnViRoradYddfP/MMUqcS9bHGeYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4569.namprd11.prod.outlook.com (2603:10b6:303:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 18:46:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 18:46:37 +0000
Date: Tue, 9 Sep 2025 11:46:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 06/13] drm/xe: Convert the CPU fault handler for
 exhaustive eviction
Message-ID: <aMB2Cm02wMM2LIMD@lstrano-desk.jf.intel.com>
References: <20250908101246.65025-1-thomas.hellstrom@linux.intel.com>
 <20250908101246.65025-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250908101246.65025-7-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0001.prod.exchangelabs.com (2603:10b6:a02:80::14)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f8e160-61ab-42db-7281-08ddefd134c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vL24RIdJKU1NPVEKB5B9G/WR0QZzOujnGFHNjOeFMRYMmzJgUZgXeXk8kz?=
 =?iso-8859-1?Q?sSWDnM5hzqoLf227d05RTHG+X7Qqk55EWc+u8D4rEQsMaukFtCTXBsK793?=
 =?iso-8859-1?Q?yYrGYxPbeYLOsq3TgdDzyRYxgMcNkEtaMBGBi6kLS6Gc/qrSlrD+qqygTe?=
 =?iso-8859-1?Q?+W9Z803pofPyfQsf+WxnLouAGILME6105yEFUizDnIyYPNXAhaz3Du4f8b?=
 =?iso-8859-1?Q?VKUT5jdoDmBJ2SbEm1fJkidLjueUmYG3D+eSEADqW+hzfJUMmDW5Wnfh3C?=
 =?iso-8859-1?Q?EJHeW5LIgI5Jtg1+fwmWY+Zt7D1jeKnP+EJ3cSddHDBABhtW/xbc0j4hHt?=
 =?iso-8859-1?Q?NHeU4RB07pcee55yDObKv7nQ0eLRYz9p0sHVmjy2hnTZOzjMH+G0jfPtFt?=
 =?iso-8859-1?Q?i29zGYBTl5MCJB9AQCuK6ZyxPT+NzL0w0ZDVhC2+cAaTXv2f+h+Eco2Bov?=
 =?iso-8859-1?Q?c3vL9cOlwAnKR2MxCRdDEsjYG5kuWyr3OokjMHuwgVXDa6NUnyKq73yvmg?=
 =?iso-8859-1?Q?/SbaDgdEDd9YQueo/ACL83HAfxT/PfWrdqT6oDlS3N5b4WqOEpHIpbF9Eg?=
 =?iso-8859-1?Q?r/jXs4kZZiuGJZ9DW/SH4gNlgFOldpnsaHjsaxdCa0HJ4Ya63EKlTGdQLL?=
 =?iso-8859-1?Q?v+qcgSHrdZW/xEWV8ZecSQMbBiD0bF5N2uPrnGPruk7BtCwoIdnhSkRP6r?=
 =?iso-8859-1?Q?Odgzu/qtoSlDTpRJ54IKYFn6ebXLpQ73/g4hLBlJe0/G4i8czlM2yCtct+?=
 =?iso-8859-1?Q?RrlSaWzBiK7A1ctpd6Vadf8sGPgIbOlFjbRRCHJqSN/Vz7KDRXnObMgJYo?=
 =?iso-8859-1?Q?y63cciskd0yfvzDEIrmq6C05f0npTI9TDU8YckrBtg2ouu22U2Qi8gAeFf?=
 =?iso-8859-1?Q?/SdUDI7DI+D5FN4O3Wu2GNsqGFGfVgNqWF1yxK7MRjsPNJ4C1bKolYadcs?=
 =?iso-8859-1?Q?GS0JLwniIidC8FlwfzqsTUtXDvO37A9VZZJ9y5v8HahIPep8JvYmQpehxl?=
 =?iso-8859-1?Q?nz7jnTezm6NQkRdWAmi75Fc6GII9EicxKssJJ4VTPIX2kw2b/1DqWV3If1?=
 =?iso-8859-1?Q?NNHk/30WZCHK6C+1sL2h2FL/WO1SlkIXF8V+cANKUn+dmeF7DN4Pnu9K9H?=
 =?iso-8859-1?Q?gJb0ZK0o/vG+wuJ0iMF57l9zS/S88xNeIi7u6EBrVbCxI8jdYPOB2OrXN9?=
 =?iso-8859-1?Q?RASo+uasN0dA/OVMoGnPDs7fB1GoR6qPBSQhPvLSeIngS8QVYP7eH+yXo7?=
 =?iso-8859-1?Q?t56MOf58ozGGRTPB0AKgZtNVs6qURceGrin4dMS7l20ndx9RBm+HGcqWh6?=
 =?iso-8859-1?Q?d/U8uMPqLlBlXtbsP3NwluVKqMYE/Uz/FU7PVHXMgJ45NBSwlTcu53Vd04?=
 =?iso-8859-1?Q?DMf0/cXA+ZXcxk1SLphz0/fNmtVneo1Pm0U7CjF0OQcZFOxzlVvjN0jHnZ?=
 =?iso-8859-1?Q?iMhAJIiyLuPaFf8zzcIYs7/zitzwkMXuMBceDavwsUaIlQ12NJGYPZIAKb?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?35wO+TIkxHa2yo9yu21zh1Kj7uxqmlIHC0lxoZjJJrYdX9RB/5ZXNgGR1M?=
 =?iso-8859-1?Q?tgAziP+1pi9QILbyv/OaAYG3UwrKVFJVLq1UVm75juEh7VqXVhIRH8u0Yn?=
 =?iso-8859-1?Q?alYlIAiRh31NXOAHKN3lz1JauWmZ8kIloo8wqWRz4GRodAdDkYlyl3cSNF?=
 =?iso-8859-1?Q?oXEjwUGF0srquzmhgPOjTHcnCiJjmKan/LUMHjXQ7Yg9991IvpvqBySfvG?=
 =?iso-8859-1?Q?PgKAg7+XVCGQWEEwaqb+DlaEyzYrquIK6/yO5B2m9akuXNs7wdFYHAxU1z?=
 =?iso-8859-1?Q?vBixW2yAgPLF+vQnPMLN9vbj7MEl3cil+kCsuoCEO20oc2Bcr4VJMNwiwM?=
 =?iso-8859-1?Q?+pkJ+8jmH7hcG+o4JTPmVpX3Oto/JXpZP7Vx2s+c+UPnDb/qPupEcovAsv?=
 =?iso-8859-1?Q?h869ZNkwVRvEGREKytFYGcePmRmPv7KudNwidPXI/Dbqnyhjeoezumehzo?=
 =?iso-8859-1?Q?CrDiXnThorYOugk/fE0qiUPDIzcFukSNllGBF+WhgAZ5AKzigIJhAiVj0W?=
 =?iso-8859-1?Q?impYXqueF1NGpQvNatWiI+GoTLG9JFVsf42bCF59ILqHvo+tYXoWbV7iIS?=
 =?iso-8859-1?Q?B1Caux7cuSeMtuU17CXoUAjJyIcAG2Ui0QHFxBlANoyLM+rbss8Ul2n7O4?=
 =?iso-8859-1?Q?8kS6cLr+N+s5lVAYtjMthO60RH2Xkcj0235QsSqhQeLyL0Tie/AR79+lI/?=
 =?iso-8859-1?Q?vXJj7DmEmsqGJV1ruJUzNkatN6ef3XEiCF8W3n2l9yJai+dISriPoXu4Qc?=
 =?iso-8859-1?Q?xfo2/5OUhlTP5KLX4J6OkMfY7r0t9iCbZn1UV2tzI6WGfnqqaA8I4otoPy?=
 =?iso-8859-1?Q?T2SXR68opVD3+WYINUTt8uPvg55nAsqVRInqIVZK+Fbh/bdtwUT0dWZAm4?=
 =?iso-8859-1?Q?9Et+d3zWHBuXnU6ulyAX7pH3sDRPi4rdNwmYhYdCJZE+cmBdZ0ohSFzq5O?=
 =?iso-8859-1?Q?5dd80ZTkWbZtXKW5P8jsWezIzYxGD7AjZblQN8y7o9QvPKd9SRfK4MVwJW?=
 =?iso-8859-1?Q?9YJgLWr1/6iTBU85/RNW9k/qxLoG2Q8ADwQOmKvv/z62t2fs/+px5TQNMK?=
 =?iso-8859-1?Q?ft7egGdh6X5C/wIpcmxGmNOEYpikhPf6LZA2ISePA5D5kZ0+kOymC38YFG?=
 =?iso-8859-1?Q?84kPj7BuM/IYEe4ZRGVPZPGlwVuheCGYTG1ipJA+M0MaBbHxlP6Ca6bUN2?=
 =?iso-8859-1?Q?c1yMeeCa2AHGDBTv4SyOnGPYTcIjbmiqeS6AcgHGr9/Yg+U5a7b648h+6O?=
 =?iso-8859-1?Q?LoDxcQkrt+xmLtICP5IWV/yInFPmqD7gylunfdwbW5+bXilDa5L2YmUrIB?=
 =?iso-8859-1?Q?1LsHS67QaiQ7If23zr9i5tnEdc+9ca27lvNLSPPnNDxTH2V9+0Fs0TZmlS?=
 =?iso-8859-1?Q?ZWQV/xBeSVYPpeefgpouCBS9FsIntrgZ4c8Biu4SGA+xiedHJiiWZzDcZq?=
 =?iso-8859-1?Q?79mWvVZW7EroZJ/cPcQtWbJBqMAc1EgpU/U8GjXEUkALVPzTdbduF/g3D3?=
 =?iso-8859-1?Q?jJOl6YgHb1p8GSwWZnBLwO4BpmjgT6iCiQZHribNiDiOrBH7zhX/6speMv?=
 =?iso-8859-1?Q?OlNzkW5rlDZvfmAdq1t8VmLbrhvr7MZ28rPzOjE5VGs0l2VkcOHeCCafZ/?=
 =?iso-8859-1?Q?7HTGiQGqV53T7MBTUGj5sKYSJq01mWaeca1swO6k00hdkO2LUhTWQzBQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f8e160-61ab-42db-7281-08ddefd134c0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 18:46:37.0411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ppd94xN8JiIZiof+VB74+TO/PmxOfuieH2A7n/b2c4zIVVyhOasEzCOKx3lNrVZqAH18mm0x/ddMyL+oowvbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
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

On Mon, Sep 08, 2025 at 12:12:39PM +0200, Thomas Hellström wrote:
> The CPU fault handler may populate bos and migrate, and in doing
> so might interfere with other tasks validating.
> 
> Rework the CPU fault handler completely into a fastpath
> and a slowpath. The fastpath trylocks only the validation lock
> in read-mode. If that fails, there's a fallback to the
> slowpath, where we do a full validation transaction.
> 
> This mandates open-coding of bo locking, bo idling and
> bo populating, but we still call into TTM for fault
> finalizing.
> 
> v2:
> - Rework the CPU fault handler to actually take part in
>   the exhaustive eviction scheme (Matthew Brost).
> v3:
> - Don't return anything but VM_FAULT_RETRY if we've dropped the
>   mmap_lock. Not even if a signal is pending.
> - Rebase on gpu_madvise() and split out fault migration.
> - Wait for idle after migration.
> - Check whether the resource manager uses tts to determine
>   whether to map the tt or iomem.
> - Add a number of asserts.
> - Allow passing a ttm_operation_ctx to xe_bo_migrate() so that
>   it's possible to try non-blocking migration.
> - Don't fall through to TTM on migration / population error
>   Instead remove the gfp_retry_mayfail in mode 2 where we
>   must succeed. (Matthew Brost)
> v5:
> - Don't allow faulting in the imported bo case (Matthew Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthews Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c |   2 +-
>  drivers/gpu/drm/xe/xe_bo.c             | 259 ++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_bo.h             |   3 +-
>  drivers/gpu/drm/xe/xe_dma_buf.c        |   6 +-
>  drivers/gpu/drm/xe/xe_gt_pagefault.c   |   2 +-
>  drivers/gpu/drm/xe/xe_validation.c     |   3 +-
>  drivers/gpu/drm/xe/xe_vm.c             |   1 +
>  7 files changed, 225 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 4b0748e6fdd6..d7a8448a43dc 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -314,7 +314,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  		goto err;
>  
>  	if (IS_DGFX(xe))
> -		ret = xe_bo_migrate(bo, XE_PL_VRAM0, exec);
> +		ret = xe_bo_migrate(bo, XE_PL_VRAM0, NULL, exec);
>  	else
>  		ret = xe_bo_validate(bo, NULL, true, exec);
>  	if (!ret)
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 296b8ead5713..4b2eba7d4ce1 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1716,68 +1716,234 @@ static bool should_migrate_to_smem(struct xe_bo *bo)
>  	       bo->attr.atomic_access == DRM_XE_ATOMIC_CPU;
>  }
>  
> -static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> +/* Populate the bo if swapped out, or migrate if the access mode requires that. */
> +static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
> +			       struct drm_exec *exec)
> +{
> +	struct ttm_buffer_object *tbo = &bo->ttm;
> +	int err = 0;
> +
> +	if (ttm_manager_type(tbo->bdev, tbo->resource->mem_type)->use_tt) {
> +		xe_assert(xe_bo_device(bo),
> +			  dma_resv_test_signaled(tbo->base.resv, DMA_RESV_USAGE_KERNEL) ||
> +			  (tbo->ttm && ttm_tt_is_populated(tbo->ttm)));
> +		err = ttm_bo_populate(&bo->ttm, ctx);
> +	} else if (should_migrate_to_smem(bo)) {
> +		xe_assert(xe_bo_device(bo), bo->flags & XE_BO_FLAG_SYSTEM);
> +		err = xe_bo_migrate(bo, XE_PL_TT, ctx, exec);
> +	}
> +
> +	return err;
> +}
> +
> +/* Call into TTM to populate PTEs, and register bo for PTE removal on runtime suspend. */
> +static vm_fault_t __xe_bo_cpu_fault(struct vm_fault *vmf, struct xe_device *xe, struct xe_bo *bo)
> +{
> +	vm_fault_t ret;
> +
> +	trace_xe_bo_cpu_fault(bo);
> +
> +	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> +				       TTM_BO_VM_NUM_PREFAULT);
> +	/*
> +	 * When TTM is actually called to insert PTEs, ensure no blocking conditions
> +	 * remain, in which case TTM may drop locks and return VM_FAULT_RETRY.
> +	 */
> +	xe_assert(xe, ret != VM_FAULT_RETRY);
> +
> +	if (ret == VM_FAULT_NOPAGE &&
> +	    mem_type_is_vram(bo->ttm.resource->mem_type)) {
> +		mutex_lock(&xe->mem_access.vram_userfault.lock);
> +		if (list_empty(&bo->vram_userfault_link))
> +			list_add(&bo->vram_userfault_link,
> +				 &xe->mem_access.vram_userfault.list);
> +		mutex_unlock(&xe->mem_access.vram_userfault.lock);
> +	}
> +
> +	return ret;
> +}
> +
> +static vm_fault_t xe_err_to_fault_t(int err)
> +{
> +	switch (err) {
> +	case 0:
> +	case -EINTR:
> +	case -ERESTARTSYS:
> +	case -EAGAIN:
> +		return VM_FAULT_NOPAGE;
> +	case -ENOMEM:
> +	case -ENOSPC:
> +		return VM_FAULT_OOM;
> +	default:
> +		break;
> +	}
> +	return VM_FAULT_SIGBUS;
> +}
> +
> +static bool xe_ttm_bo_is_imported(struct ttm_buffer_object *tbo)
> +{
> +	dma_resv_assert_held(tbo->base.resv);
> +
> +	return tbo->ttm &&
> +		(tbo->ttm->page_flags & (TTM_TT_FLAG_EXTERNAL | TTM_TT_FLAG_EXTERNAL_MAPPABLE)) ==
> +		TTM_TT_FLAG_EXTERNAL;
> +}
> +
> +static vm_fault_t xe_bo_cpu_fault_fastpath(struct vm_fault *vmf, struct xe_device *xe,
> +					   struct xe_bo *bo, bool needs_rpm)
> +{
> +	struct ttm_buffer_object *tbo = &bo->ttm;
> +	vm_fault_t ret = VM_FAULT_RETRY;
> +	struct xe_validation_ctx ctx;
> +	struct ttm_operation_ctx tctx = {
> +		.interruptible = true,
> +		.no_wait_gpu = true,
> +		.gfp_retry_mayfail = true,
> +
> +	};
> +	int err;
> +
> +	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
> +		return VM_FAULT_RETRY;
> +
> +	err = xe_validation_ctx_init(&ctx, &xe->val, NULL,
> +				     (struct xe_val_flags) {
> +					     .interruptible = true,
> +					     .no_block = true
> +				     });
> +	if (err)
> +		goto out_pm;
> +
> +	if (!dma_resv_trylock(tbo->base.resv))
> +		goto out_validation;
> +
> +	if (xe_ttm_bo_is_imported(tbo)) {
> +		ret = VM_FAULT_SIGBUS;
> +		drm_dbg(&xe->drm, "CPU trying to access an imported buffer object.\n");
> +		goto out_unlock;
> +	}
> +
> +	err = xe_bo_fault_migrate(bo, &tctx, NULL);
> +	if (err) {
> +		/* Return VM_FAULT_RETRY on these errors. */
> +		if (err != -ENOMEM && err != -ENOSPC && err != -EBUSY)
> +			ret = xe_err_to_fault_t(err);
> +		goto out_unlock;
> +	}
> +
> +	if (dma_resv_test_signaled(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL))
> +		ret = __xe_bo_cpu_fault(vmf, xe, bo);
> +
> +out_unlock:
> +	dma_resv_unlock(tbo->base.resv);
> +out_validation:
> +	xe_validation_ctx_fini(&ctx);
> +out_pm:
> +	if (needs_rpm)
> +		xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
> +static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
>  {
>  	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
>  	struct drm_device *ddev = tbo->base.dev;
>  	struct xe_device *xe = to_xe_device(ddev);
>  	struct xe_bo *bo = ttm_to_xe_bo(tbo);
>  	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
> -	struct drm_exec *exec;
> +	bool retry_after_wait = false;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
>  	vm_fault_t ret;
> -	int idx, r = 0;
> +	int err = 0;
> +	int idx;
>  
> -	if (needs_rpm)
> -		xe_pm_runtime_get(xe);
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>  
> -	exec = XE_VALIDATION_UNIMPLEMENTED;
> -	ret = ttm_bo_vm_reserve(tbo, vmf);
> -	if (ret)
> +	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
> +	if (ret != VM_FAULT_RETRY)
>  		goto out;
>  
> -	if (drm_dev_enter(ddev, &idx)) {
> -		trace_xe_bo_cpu_fault(bo);
> +	if (fault_flag_allow_retry_first(vmf->flags)) {
> +		if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
> +			goto out;
> +		retry_after_wait = true;
> +		xe_bo_get(bo);
> +		mmap_read_unlock(vmf->vma->vm_mm);
> +	} else {
> +		ret = VM_FAULT_NOPAGE;
> +	}
>  
> -		xe_validation_assert_exec(xe, exec, &tbo->base);
> -		if (should_migrate_to_smem(bo)) {
> -			xe_assert(xe, bo->flags & XE_BO_FLAG_SYSTEM);
> +	/*
> +	 * The fastpath failed and we were not required to return and retry immediately.
> +	 * We're now running in one of two modes:
> +	 *
> +	 * 1) retry_after_wait == true: The mmap_read_lock() is dropped, and we're trying
> +	 * to resolve blocking waits. But we can't resolve the fault since the
> +	 * mmap_read_lock() is dropped. After retrying the fault, the aim is that the fastpath
> +	 * should succeed. But it may fail since we drop the bo lock.
> +	 *
> +	 * 2) retry_after_wait == false: The fastpath failed, typically even after
> +	 * a retry. Do whatever's necessary to resolve the fault.
> +	 *
> +	 * This construct is recommended to avoid excessive waits under the mmap_lock.
> +	 */
> +
> +	if (needs_rpm)
> +		xe_pm_runtime_get(xe);
>  
> -			r = xe_bo_migrate(bo, XE_PL_TT, exec);
> -			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
> -				ret = VM_FAULT_NOPAGE;
> -			else if (r)
> -				ret = VM_FAULT_SIGBUS;
> +	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = true},
> +			    err) {
> +		struct ttm_operation_ctx tctx = {
> +			.interruptible = true,
> +			.no_wait_gpu = false,
> +			.gfp_retry_mayfail = retry_after_wait,
> +		};
> +		long lerr;
> +
> +		err = drm_exec_lock_obj(&exec, &tbo->base);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err)
> +			break;
> +
> +		if (xe_ttm_bo_is_imported(tbo)) {
> +			err = -EFAULT;
> +			drm_dbg(&xe->drm, "CPU trying to access an imported buffer object.\n");
> +			break;
>  		}
> -		if (!ret)
> -			ret = ttm_bo_vm_fault_reserved(vmf,
> -						       vmf->vma->vm_page_prot,
> -						       TTM_BO_VM_NUM_PREFAULT);
> -		drm_dev_exit(idx);
>  
> -		if (ret == VM_FAULT_RETRY &&
> -		    !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> -			goto out;
> +		err = xe_bo_fault_migrate(bo, &tctx, &exec);
> +		if (err) {
> +			drm_exec_retry_on_contention(&exec);
> +			xe_validation_retry_on_oom(&ctx, &err);
> +			break;
> +		}
>  
> -		/*
> -		 * ttm_bo_vm_reserve() already has dma_resv_lock.
> -		 */
> -		if (ret == VM_FAULT_NOPAGE &&
> -		    mem_type_is_vram(tbo->resource->mem_type)) {
> -			mutex_lock(&xe->mem_access.vram_userfault.lock);
> -			if (list_empty(&bo->vram_userfault_link))
> -				list_add(&bo->vram_userfault_link,
> -					 &xe->mem_access.vram_userfault.list);
> -			mutex_unlock(&xe->mem_access.vram_userfault.lock);
> +		lerr = dma_resv_wait_timeout(tbo->base.resv,
> +					     DMA_RESV_USAGE_KERNEL, true,
> +					     MAX_SCHEDULE_TIMEOUT);
> +		if (lerr < 0) {
> +			err = lerr;
> +			break;
>  		}
> -	} else {
> -		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> +
> +		if (!retry_after_wait)
> +			ret = __xe_bo_cpu_fault(vmf, xe, bo);
>  	}
> +	/* if retry_after_wait == true, we *must* return VM_FAULT_RETRY. */
> +	if (err && !retry_after_wait)
> +		ret = xe_err_to_fault_t(err);
>  
> -	dma_resv_unlock(tbo->base.resv);
> -out:
>  	if (needs_rpm)
>  		xe_pm_runtime_put(xe);
>  
> +	if (retry_after_wait)
> +		xe_bo_put(bo);
> +out:
> +	drm_dev_exit(idx);
> +
>  	return ret;
>  }
>  
> @@ -1821,7 +1987,7 @@ int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size)
>  }
>  
>  static const struct vm_operations_struct xe_gem_vm_ops = {
> -	.fault = xe_gem_fault,
> +	.fault = xe_bo_cpu_fault,
>  	.open = ttm_bo_vm_open,
>  	.close = ttm_bo_vm_close,
>  	.access = xe_bo_vm_access,
> @@ -3057,6 +3223,8 @@ static void xe_place_from_ttm_type(u32 mem_type, struct ttm_place *place)
>   * xe_bo_migrate - Migrate an object to the desired region id
>   * @bo: The buffer object to migrate.
>   * @mem_type: The TTM region type to migrate to.
> + * @tctx: A pointer to a struct ttm_operation_ctx or NULL if
> + * a default interruptibe ctx is to be used.
>   * @exec: The drm_exec transaction to use for exhaustive eviction.
>   *
>   * Attempt to migrate the buffer object to the desired memory region. The
> @@ -3069,7 +3237,8 @@ static void xe_place_from_ttm_type(u32 mem_type, struct ttm_place *place)
>   * Return: 0 on success. Negative error code on failure. In particular may
>   * return -EINTR or -ERESTARTSYS if signal pending.
>   */
> -int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec)
> +int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct ttm_operation_ctx *tctx,
> +		  struct drm_exec *exec)
>  {
>  	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
>  	struct ttm_operation_ctx ctx = {
> @@ -3081,6 +3250,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec)
>  	struct ttm_place requested;
>  
>  	xe_bo_assert_held(bo);
> +	tctx = tctx ? tctx : &ctx;
>  
>  	if (bo->ttm.resource->mem_type == mem_type)
>  		return 0;
> @@ -3107,8 +3277,9 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec)
>  		add_vram(xe, bo, &requested, bo->flags, mem_type, &c);
>  	}
>  
> -	xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
> -	return ttm_bo_validate(&bo->ttm, &placement, &ctx);
> +	if (!tctx->no_wait_gpu)
> +		xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
> +	return ttm_bo_validate(&bo->ttm, &placement, tctx);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 99e8900d2dcc..f0923717660e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -284,7 +284,8 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res);
>  
>  bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
>  
> -int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec);
> +int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct ttm_operation_ctx *ctc,
> +		  struct drm_exec *exec);
>  int xe_bo_evict(struct xe_bo *bo, struct drm_exec *exec);
>  
>  int xe_bo_evict_pinned(struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 199041bdb882..7c2793265561 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -64,7 +64,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
>  		return -EINVAL;
>  	}
>  
> -	ret = xe_bo_migrate(bo, XE_PL_TT, exec);
> +	ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
>  	if (ret) {
>  		if (ret != -EINTR && ret != -ERESTARTSYS)
>  			drm_dbg(&xe->drm,
> @@ -102,7 +102,7 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
>  
>  	if (!xe_bo_is_pinned(bo)) {
>  		if (!attach->peer2peer)
> -			r = xe_bo_migrate(bo, XE_PL_TT, exec);
> +			r = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
>  		else
>  			r = xe_bo_validate(bo, NULL, false, exec);
>  		if (r)
> @@ -170,7 +170,7 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  
>  	/* Can we do interruptible lock here? */
>  	xe_bo_lock(bo, false);
> -	(void)xe_bo_migrate(bo, XE_PL_TT, exec);
> +	(void)xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
>  	xe_bo_unlock(bo);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index ec6f6d520a9c..a054d6010ae0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -87,7 +87,7 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>  	if (!bo)
>  		return 0;
>  
> -	return need_vram_move ? xe_bo_migrate(bo, vram->placement, exec) :
> +	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
>  		xe_bo_validate(bo, vm, true, exec);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
> index b90fda3dd5f4..826cd09966ef 100644
> --- a/drivers/gpu/drm/xe/xe_validation.c
> +++ b/drivers/gpu/drm/xe/xe_validation.c
> @@ -241,7 +241,8 @@ int xe_validation_exec_lock(struct xe_validation_ctx *ctx,
>   */
>  void xe_validation_ctx_fini(struct xe_validation_ctx *ctx)
>  {
> -	drm_exec_fini(ctx->exec);
> +	if (ctx->exec)
> +		drm_exec_fini(ctx->exec);
>  	xe_validation_unlock(ctx);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index dfe88924fda0..785e81cf023d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2934,6 +2934,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  		if (!err && !xe_vma_has_no_bo(vma))
>  			err = xe_bo_migrate(xe_vma_bo(vma),
>  					    region_to_mem_type[region],
> +					    NULL,
>  					    exec);
>  		break;
>  	}
> -- 
> 2.51.0
> 

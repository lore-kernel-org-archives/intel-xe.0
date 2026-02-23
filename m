Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD12EF5865
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 04:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648E610E129;
	Mon, 23 Feb 2026 04:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdjEjMgG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6833710E129
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 04:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771821707; x=1803357707;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8drKJEbFuOpr7ZOboxzhPacrDCNSeL/Cmxdl++DUvHE=;
 b=JdjEjMgGRuzXuJ3zfcbtC3eDtfmucqCG/5BrvbHdQq+84Nu1APuCQ28D
 OsYdCQK2oVf2imLaCvQo2+i2f3+jTPERGjqMCqslB70y/T2cvOSmEbnP+
 D+vOOBP4ttlZO62vv4aLaXDM47QyJXttKVtmciCz4FMcaWf2BVaM7qnvh
 svuIMDb/ax7cZDQSEuwtzkdlRDZU4nOAsNpsYV6jgF1N3PPwjum+KVeCj
 iDGjGzkK1HsJHVOhPym1Cn2667GYX2uDSmkwy4vF7U0VCrukz0zTqHOCf
 QvpqAG89JNfmLjfPyR+DaeCaTvCZKb0a8K3K8+2lFFM/GQHFRp8sa5/KM w==;
X-CSE-ConnectionGUID: lphlPkk6Sj6ai0hsib3gnQ==
X-CSE-MsgGUID: 2qIy43lpTleJqos4XTbHSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72874419"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72874419"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:41:42 -0800
X-CSE-ConnectionGUID: Q15UOfE/Q8GlBr1/fuLwJg==
X-CSE-MsgGUID: d3WD/0aXTqe22HI91y7qYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219564468"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:41:41 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 20:41:41 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 20:41:41 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 20:41:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXLBg4wMF4+SCS0ZXW3ai+Q5OkurNd6e+ZWiDSU3OnOCHtK3Pn7Q5piZlqCpXFZXymn4lbHZR1wPV8Cw9mtOI2ewhJFp/jTpY9tSCVWcdmrZT5to15FhiMgQm4Sg2ciz8USIGPL6Kr2EN+ACUGCy6K9t6ESu+m2A75J8Ine6b02dAlipdYoJZ6J7SmeLwZSxaUdBRNUSzUR2du3EvNTOcLiGbpisDH8GqxRe12RI2LcD4i5EkGmhd2RhdXvob2ZpXOy6PnoIZGzNFiNrhDChlbJDwvSkeDSGRUZ+cQetFzQc7mxE2ev5cEi/qapjOV1aUIMgzT4K1cExzaYXST41ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9Xey551lKV7S1uqKUhiBMb02fe2T84NS8f+irrEa7g=;
 b=L/mPMi2X0DxOAnt7Fw1HXUzgPZibgGl5R/bHGDYIbaIV4tdUtbX5sJzPQOthhDhCfZ1m8IOsJEmAplmcJvplbfysjZnC+3wJ9c69tEqtzLkcNNPc6loSUnPpbkulKueV5wuyCSo9LmAw4ywpdq5t2M6AaQplcNaQ5Uu3ReLVQDxUCJfQtCNRLj9WUo44YnN/O1sur/hLY/fJi76d/o5rDuef/6JLOAX4tcnexDWMXvlTMIP4C1tndYZQhdiuC0X3YQZxoEXFjvZnjovjwomTOJGyuudlXALslLJpWPH0JNASc33QxU6M9Vi72vhQFrHOWpNadAou6jfL6lMtgenYFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4883.namprd11.prod.outlook.com (2603:10b6:303:9b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 04:41:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 04:41:34 +0000
Date: Sun, 22 Feb 2026 20:41:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <priyanka.dandamudi@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe: Add prefetch fault support for Xe3p
Message-ID: <aZvaeyqXxlV3QvV2@lstrano-desk.jf.intel.com>
References: <20260223040729.1157739-1-varun.gupta@intel.com>
 <20260223040729.1157739-3-varun.gupta@intel.com>
 <aZvY5dty7Xk2B/mV@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aZvY5dty7Xk2B/mV@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4883:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef4af77-b9b9-444b-9203-08de7295d289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iKmNF1EHcGyO5e5w9QmroG4eygkCvyggPL3uJyvNql+3Z2iqg3ClJXeovrRh?=
 =?us-ascii?Q?I63DBXV6OR4nHQtComspO9jS6m4QIvlCFb4vjm5m1QeUNw8Lll6kaAwX38Uc?=
 =?us-ascii?Q?F1kGbT43ZbCVA662zHHo6Of62GnQ0DASVUWtRZgY+BSWvNuYmrk77YsYRtWt?=
 =?us-ascii?Q?a9HrU8jGo+C9W98WML1CSbObJiuKSTWn8GaYWmcXcj3dvmZGN0RJAjNpjAF/?=
 =?us-ascii?Q?jIWYJkDmHVImvVHjIboXeAnpHvsgx1KTlP859TQFq8MxqP5fAs7zZsyvOVQt?=
 =?us-ascii?Q?qPNXLpSjM75Q3gIgq+31P83ELFlssTgCPBau1ZtHQnl7O3Un24AwZNfdd5OD?=
 =?us-ascii?Q?qImf2vvbj4LJnnNa+OQ4vfrrgTINw3MObB0w32/IadmMOZ67oWAoP8CaRlLO?=
 =?us-ascii?Q?S/3X+m+djF9fbyRbxP+ckSs3wXClihhXDG244BkUZKkmRKWLW5pzISidflZj?=
 =?us-ascii?Q?ZJChcYv30uCMcN2unSEBV/QlR/+AoDV+oUcJqNgm06QRYWbRcT8gcFEMtei9?=
 =?us-ascii?Q?1OeLnmN3NHfDQHn50VFqCNruiTSh320YTTlv9oldzOzKgKqV6ZS85f1umIXk?=
 =?us-ascii?Q?fkE8Ixm7Jmd4uBE/pcKexaPxZMB0MIddictSRUeMfvycn7RwpTUorFXrGoYK?=
 =?us-ascii?Q?W4p9xwzBcbEf+jfj4YjjJy+TQxVIkfg2+/TIb336yUyRD1GDL3NPbId5Aasy?=
 =?us-ascii?Q?sFW/iyUVVeYWvnjoENcOflN+O2qIqhiTf5CMdUmiz9M5r+toAThdU/FFWDPT?=
 =?us-ascii?Q?skpJUgUPV1dLuKOMaYg5V77wBidiFGPTRIub5T8KPyF2pzE5vWmci7gnTzBG?=
 =?us-ascii?Q?eXOmL8Vbs5vfAXQ6DiryghgdaFw1uyPKoiYIBUKTY+V3ecSgVAxYCVWSjLZ+?=
 =?us-ascii?Q?Fy0bO64Lh4JUS3pwvQjr/lGlOFIkv3PRniag0UOn4LXA4IaxA6Vgy8T2tifp?=
 =?us-ascii?Q?ZlS/r71YOnpwZP28ZP2NwX9N2Q+eL9hyP0N9ECR41qpjEWvvX1h9g6EgHF5x?=
 =?us-ascii?Q?F3aGty+nmUbkvnX8Xc12zAFdXSMVKm44OOrZQ4bSRmAgduvtkdZsCvgZi8PQ?=
 =?us-ascii?Q?8wF2GwxgZHnEryHgNwE/VQsn/eibR5CJnnz4a5JSNRKqWss67dyGrpXBlu/N?=
 =?us-ascii?Q?dirsrgV601GOWJbskA0s/yrSbVFVr82fLkDD0tLSe2pi/0erv/CslPFF4Tu/?=
 =?us-ascii?Q?XX4r1S+rIHCV7wSe+FZL/i9mcPg0PBBI3VCTyT3IkWE0i1DWtten+0dbOPty?=
 =?us-ascii?Q?0TTuJLCnSbhAQJFqwdkI4vDi4sWI1knuM6uCqkg5c3yPZ6oW+SS7dL3ZxvDq?=
 =?us-ascii?Q?XTlctr9lCVOzq4KOnBt2QurpuOqJosYczQdJIVhA0yVKwMc2eYcx6fHbnUfI?=
 =?us-ascii?Q?ZZbv4JVGUpX4UWWAcbt/SkG39dKd1w6s3Q9T86mReA4b5BYYxtbNHcK6VMax?=
 =?us-ascii?Q?Y2gpnHZUMR9ZUmAFUj23ykcAS9wlCB+Jz4N9B1J6k5yR+M3lnl43KhXzHVYo?=
 =?us-ascii?Q?kIVokkqGIzTUjOlTOHJypKF/TZvF72U6FM3tJdLoPaPf1wN6Zeuh8dL67Ebn?=
 =?us-ascii?Q?dJ1m6jbL144JZFFVCbM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eUSLukhZwnTrcfzUu0piy+Lco3vVYGEf+bVTCrNyDySbDDXSrtZrZodQOfhI?=
 =?us-ascii?Q?4N5sFDmiNsFns1QJkgt2OZH/ksN8BTz1XcTXDInT6D+NJZ3A5XaGxwOS3WOw?=
 =?us-ascii?Q?qsCp0cKAssxijUGYCw31zg5ulAW9+xaU63K/vJBQM+ChgqYzbHe4M/oPdWwC?=
 =?us-ascii?Q?1V4804qeqZFOJHTVD69hnEDZPTnbGfl4gh7jDNjD7Cmt10bXcNfO+s7p9Dxd?=
 =?us-ascii?Q?b5mODmGDBO+lFCLo1U1T6x8Ig6D542MblgqLqwyxg2NNeNCXcJMhGzzJRKv/?=
 =?us-ascii?Q?34toXLFFagZ9VcvD0hLBMkavgkPNYyVQqUf7FU966qTt4d6IOMU6MufWE7If?=
 =?us-ascii?Q?jPXnIV68T7X31ezETfDva5/eLOTrQeukDNvdLKqk2xWbU7ssxc312zNup8g2?=
 =?us-ascii?Q?cHs+m3NpfLZLgrmj9PKh1o8/4s6maKOVN1LlYwOTSURl8/6TWDnXifP/vIi+?=
 =?us-ascii?Q?TtQFC56fpwbJJvCTEyobi0awZQMuUZke2kAX1Hoi1QQZB4KD/j0/VRlVFSY9?=
 =?us-ascii?Q?dAFmcV2IBt0CtQUt4jSL7lz6zDo4zzRMT0FdjIb8t173dltZqBh4YYO5jXEv?=
 =?us-ascii?Q?wtkzweIQ7WcKzPkWTTGIIiW4TTMsi4SMNNaewQ5cQ2agqkHwvHlBDbYYm4B9?=
 =?us-ascii?Q?TAg2jfETdJpRwY3iW7EUhWxprnvoY/E1Op9k3TjNwBdDOga6FXoAegLyfrnL?=
 =?us-ascii?Q?2PLcyyv4WPX7CuzTiDA3t1+UorVihn6BXUTEGgpYUGgoVPrpH/JgD0EyxrKr?=
 =?us-ascii?Q?J/B2JKVSSmzz2SV7advnjl0kN/s4LPXTzrrLc7o0XfWQWchtloBmoTWPvang?=
 =?us-ascii?Q?U7hivWhnOUPLalgIpItNAtcNVKljpC6J+ulMlyNnRENhS2GVtkakqH2iarU6?=
 =?us-ascii?Q?PvCVQ2OmjhtThFID8oVvXs+0yLpO9aKtQaucS31fUZE26031oIxu2gYSdOhn?=
 =?us-ascii?Q?GVBl5yJaY0QiIU2Is/GrnXlI9FAD2wVYUPbTS1Dlt6kAHKz44gYkSnNRerH3?=
 =?us-ascii?Q?3GB3/gTy5bZMhcMN2jmxf2Hquh70PyHqzHfTKSjvfYwEbTC5NYaxv3hZKPEB?=
 =?us-ascii?Q?Zpm7cNfczOgtqKXGnaOusjtQJJkPpg8zbFIMRy9GjCIRbTIQNfqwRR1idGsJ?=
 =?us-ascii?Q?X+dyFRxF5JO1qHUt6sO9yZvmgx8N5Ec/r571cbKwVzndxPA6tuTz02iVUs5a?=
 =?us-ascii?Q?aREDd1vAE942tgs9GgIzeKQVbVae3Jx1V79M3eBSlW4z1CRYHi4rdIH1moF3?=
 =?us-ascii?Q?UDjdZVJkqi+4LFuiw+eBnnWn0frpWh2tFKiSh/kumPcnT6RTvPJ0TbNz2akD?=
 =?us-ascii?Q?bJxw982VKSEby4xZeiEcbr9plfgqjzbOu36peR1LcwYbKoW/gAZJMrsWoiR/?=
 =?us-ascii?Q?MQs19x7Fs0MrDnZuQPccgM37gi6r2Rn0+jhfiuLwRHQkJGX98lFYDZAUd3OI?=
 =?us-ascii?Q?VhnZbubr7XzIGPpkAng33miPxtH69sPG/0DSn9tyQkMvw7eOzp0ZP9vPgkWM?=
 =?us-ascii?Q?A77oMoQqTtf5te/E7Ap8IK3wklgvDfKJI+4g3Eax7fNbLLpc5ZXIp7vxnUna?=
 =?us-ascii?Q?u7rTPI8BNgZTKg9vCRMt+A2REZ1S5cUQZ/2nV8vM0A0RNWX3TtVNn5CcAQem?=
 =?us-ascii?Q?sTpflwA3DLnuTRGqRBoyUOwC9uV9SZeECUagUxU5ZCJRsshHXWPvbCF8lnKZ?=
 =?us-ascii?Q?vu+ZgbgZkdfXjSUtNE6gYVTdpKKff/jqT3jR+mW4sXmQI5IEARHTqHIgJVh5?=
 =?us-ascii?Q?EL/z32j84Bovnak5xt7Z8xcF4uqGq9I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef4af77-b9b9-444b-9203-08de7295d289
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 04:41:34.2152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6E0ixng+jKpsFf6Ytc4ssIz62knZs0Nuv7mI3s6Jy092DImz7pQj4q8KeukpjOS2a+nd39BmOdVmdS7RY/sHTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4883
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

On Sun, Feb 22, 2026 at 08:34:45PM -0800, Matthew Brost wrote:
> On Mon, Feb 23, 2026 at 09:37:29AM +0530, Varun Gupta wrote:
> > Xe3p hardware prefetches memory ranges and notifies software via an
> > additional bit (bit 11) in the page fault descriptor that the fault
> > was caused by prefetch.
> > 
> > Extract the prefetch bit from the fault descriptor and echo it in the
> > response (bit 6) only when the page fault handling fails. This allows
> > the HW to suppress CAT errors for unsuccessful prefetch faults.
> > 
> > For prefetch faults that fail, increment stats counter without verbose
> > logging to avoid spamming the log. The prefetch flag is packed into
> > BIT(7) of the access_type field to avoid growing the consumer struct.
> > 
> > Based on original patches by Brian Welty <brian.welty@intel.com> and
> > Priyanka Dandamudi <priyanka.dandamudi@intel.com>.
> > 
> > Bspec: 59311
> > Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> > Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> > 
> > ---
> > v5:
> >  - Read prefetch from producer msg in guc_ack_fault, not consumer field (Matt Brost)
> >  - Pack prefetch flag into BIT(7) of access_type instead of separate u8 field (Matt Brost)
> > 
> > v4:
> >  - Downgrade prefetch error log to xe_gt_dbg to avoid spam (Matt Brost/ Stuart)
> > 
> > v3:
> >  - Drop the rename patch, keep xe_pagefault_print() unchanged (Matt Brost)
> >  - Move prefetch check to caller instead of inside print function (Matt Brost)
> >  - Remove XE3P_ prefix from prefetch bit defines and add platform comment (Matt Brost)
> >  - Show prefetch bit in error messages for debugging (Matt Brost)
> >  - Split stats counter into separate patch (Matt Brost)
> > 
> > v2:
> >  - Changed comment wording from "repairs" to "handling" for clarity (Matt Roper)
> > ---
> >  drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
> >  drivers/gpu/drm/xe/xe_guc_pagefault.c   |  6 +++++-
> >  drivers/gpu/drm/xe/xe_pagefault.c       | 16 +++++++++++-----
> >  drivers/gpu/drm/xe/xe_pagefault_types.h |  6 ++++--
> >  4 files changed, 23 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > index a33ea288b907..bb8f71d38611 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > @@ -261,7 +261,8 @@ struct xe_guc_pagefault_desc {
> >  #define PFD_ACCESS_TYPE		GENMASK(1, 0)
> >  #define PFD_FAULT_TYPE		GENMASK(3, 2)
> >  #define PFD_VFID		GENMASK(9, 4)
> > -#define PFD_RSVD_1		GENMASK(11, 10)
> > +#define PFD_RSVD_1		BIT(10)
> > +#define PFD_PREFETCH		BIT(11) /* Only valid on Xe3+, reserved on prior platforms */
> >  #define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
> >  #define PFD_VIRTUAL_ADDR_LO_SHIFT 12
> >  
> > @@ -281,7 +282,7 @@ struct xe_guc_pagefault_reply {
> >  
> >  	u32 dw1;
> >  #define PFR_VFID		GENMASK(5, 0)
> > -#define PFR_RSVD_1		BIT(6)
> > +#define PFR_PREFETCH		BIT(6)  /* Only valid on Xe3+, reserved on prior platforms */
> >  #define PFR_ENG_INSTANCE	GENMASK(12, 7)
> >  #define PFR_ENG_CLASS		GENMASK(15, 13)
> >  #define PFR_PDATA		GENMASK(31, 16)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > index d48f6ed103bb..607e32392f46 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > @@ -8,10 +8,12 @@
> >  #include "xe_guc_ct.h"
> >  #include "xe_guc_pagefault.h"
> >  #include "xe_pagefault.h"
> > +#include "xe_pagefault_types.h"
> >  
> >  static void guc_ack_fault(struct xe_pagefault *pf, int err)
> >  {
> >  	u32 vfid = FIELD_GET(PFD_VFID, pf->producer.msg[2]);
> > +	u32 prefetch = FIELD_GET(PFD_PREFETCH, pf->producer.msg[2]);
> >  	u32 engine_instance = FIELD_GET(PFD_ENG_INSTANCE, pf->producer.msg[0]);
> >  	u32 engine_class = FIELD_GET(PFD_ENG_CLASS, pf->producer.msg[0]);
> >  	u32 pdata = FIELD_GET(PFD_PDATA_LO, pf->producer.msg[0]) |
> > @@ -28,6 +30,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
> >  		FIELD_PREP(PFR_ASID, asid),
> >  
> >  		FIELD_PREP(PFR_VFID, vfid) |
> > +		FIELD_PREP(PFR_PREFETCH, err ? prefetch : 0) |
> >  		FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
> >  		FIELD_PREP(PFR_ENG_CLASS, engine_class) |
> >  		FIELD_PREP(PFR_PDATA, pdata),
> > @@ -76,7 +79,8 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >  		(FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
> >  		 PFD_VIRTUAL_ADDR_LO_SHIFT);
> >  	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
> > -	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
> > +	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]) |
> > +		(FIELD_GET(PFD_PREFETCH, msg[2]) ? XE_PAGEFAULT_ACCESS_PREFETCH : 0);
> >  	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
> >  		pf.consumer.fault_type_level = XE_PAGEFAULT_TYPE_LEVEL_NACK;
> >  	else
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 72f589fd2b64..a9a20c4a6b2b 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -136,7 +136,7 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
> >  static bool
> >  xe_pagefault_access_is_atomic(enum xe_pagefault_access_type access_type)
> >  {
> > -	return access_type == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
> > +	return (access_type & XE_PAGEFAULT_ACCESS_TYPE_MASK) == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
> >  }
> >  
> >  static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
> > @@ -235,7 +235,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
> >  		   lower_32_bits(pf->consumer.page_addr),
> >  		   FIELD_GET(XE_PAGEFAULT_TYPE_MASK,
> >  			     pf->consumer.fault_type_level),
> > -		   pf->consumer.access_type,
> > +		   pf->consumer.access_type & XE_PAGEFAULT_ACCESS_TYPE_MASK,

I think CI is complaining about the build now.

I think now 'lu' in print typr string for access type.

Feel free to keep my RB when you resend for CI.

Matt 

> >  		   FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
> >  			     pf->consumer.fault_type_level),
> >  		   pf->consumer.engine_class,
> > @@ -261,9 +261,15 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >  
> >  		err = xe_pagefault_service(&pf);
> >  		if (err) {
> > -			xe_pagefault_print(&pf);
> > -			xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
> > -				   ERR_PTR(err));
> > +			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
> > +				xe_pagefault_print(&pf);
> > +				xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
> > +					   ERR_PTR(err));
> > +			} else {
> > +				xe_gt_stats_incr(pf.gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
> > +				xe_gt_dbg(pf.gt, "Prefetch Fault response: Unsuccessful %pe\n",
> > +					  ERR_PTR(err));
> > +			}
> >  		}
> >  
> >  		pf.producer.ops->ack_fault(&pf, err);
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > index 0e378f41ede6..b3289219b1be 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > @@ -68,10 +68,12 @@ struct xe_pagefault {
> >  		/** @consumer.asid: address space ID */
> >  		u32 asid;
> >  		/**
> > -		 * @consumer.access_type: access type, u8 rather than enum to
> > -		 * keep size compact
> > +		 * @consumer.access_type: access type and prefetch flag packed
> > +		 * into a u8.
> >  		 */
> >  		u8 access_type;
> > +#define XE_PAGEFAULT_ACCESS_TYPE_MASK	GENMASK(1, 0)
> > +#define XE_PAGEFAULT_ACCESS_PREFETCH	BIT(7)
> >  		/**
> >  		 * @consumer.fault_type_level: fault type and level, u8 rather
> >  		 * than enum to keep size compact
> > -- 
> > 2.43.0
> > 

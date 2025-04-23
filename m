Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC20C369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 13:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9284C10E6A6;
	Wed, 23 Apr 2025 13:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GzePAzr0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017B910E6A6
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 13:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745415393; x=1776951393;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IcAocu64RGvf3mWxYHKtm+hH0iWnbgKS0NRQU9vJsRk=;
 b=GzePAzr0FuTN0swVYrJElI+qg7ufXUf4/qIe3V3xwD0bNKQ6WrxY58F9
 ds10HgIoC1AGWJiT76m6foGh3GACepanxjq2gvMAVd+cOCM6VyJ0sIgbd
 Yjx+K68RbhsKfpZVJ7k+C5zTY+H1Wv3dTrVQZsgX3yPQStQmzT6bMYc65
 HoxfA1YNLOTrgHvxQcZiQjjvjjSvzVLi9cWAZz8q3lJRf4FlWUAwBS8i0
 tqcojInfOfwpUfjwYQSoYyghgm/cwC4xcPQuG2KVthxnZ4ZwdhhAdUzVg
 2f5jzy6jalHlIuZkmQUnEa0807LZ1FOze2bv9o+lNxm1qIn9DTP20QnCv Q==;
X-CSE-ConnectionGUID: sJub6QF6RXS9ukfgNVVI/A==
X-CSE-MsgGUID: IaHl+XX7QX20Qj8/BNSknQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="72393736"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="72393736"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 06:36:33 -0700
X-CSE-ConnectionGUID: BomM7TxaQO2weMDZFbyoOw==
X-CSE-MsgGUID: z2izCC/zSpaTbZ90yT0wYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="163292514"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 06:36:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 06:36:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 06:36:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 06:36:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGtommAbpiiGX54jvwrgy3vTMZwArL3mlXFfPSwSDhdkuJTNHsMf55gal4uS4Y+FC9RXStOykLs27ko9VybaBP/qpd2mgaCRPYcFWjTppKRVjb42UI7QvyBzT1fQAq7+S61WKecrwzia3SYZqrMsh/IIgjMjnWQZ/LOvco87EPsx3bj6EmL9P+8XMvOFwttsRQKI25l4AV3o2IfDm6IYGevBhvo0idqmiRsE3l/cqR9AKXkiEltHnrWgNlHGVcC9cp0/kKZ9CAPwJwloiUxQwYf3H50490UBUGhHKDPfBWgsOE19m/SELPsnQOSfFrgZNHgX6KzeY5DPnw8o5elZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1v6f3rxSZqOP+NsEBk3TDya5A7+7XMHXmUr+UEcu5NY=;
 b=yH7lX7bSF2VxoZp07Fsy7SxbHWWtSERqN5fQR6e3J0pSP0T9sAGCfieaR4Qu24Y0Y+1LQbERBb8pPTtIHmQrO5OU9wNH4U6QNwCqUw1n6SIJJDFsJQXeoMdimqzt2om32UW2B86lDA86Bwq5ULMw9XuDk5pHVmJpMU3CYPfKqOsOVZ7pIIsENCZ4UuElSdEjX/bj0a+EIVm3dLqaHBuvNen40X/oTidVwYfz+Tt/1Fv03w8yYkkESXhg55tnW32oaJF0O3aloiuaKqO5GdPCfviDofG5217VrHNIJtn7tOm+i5/1jvoB4jd69jH416xpjTdJWmNLI3yDbpsnuXwKng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB8073.namprd11.prod.outlook.com (2603:10b6:806:301::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 13:35:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 13:35:47 +0000
Date: Wed, 23 Apr 2025 08:35:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Expose PCIe Gen4 downspeed attributes
Message-ID: <csahlwfbgaxsm7rf4g5i747wftr5zet7ta434jop5vr2he5lmw@baknat76wftw>
References: <20250417111233.2322000-1-raag.jadav@intel.com>
 <20250417111233.2322000-3-raag.jadav@intel.com>
 <02d74b93-563e-4fab-a330-f05cf1898ca5@intel.com>
 <aAipZ3pFfD_w7e2z@black.fi.intel.com>
 <05dc8b40-a37a-4fc6-a759-d1ddc0a6c56d@intel.com>
 <aAjIvZ0eqLBsI2Nt@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aAjIvZ0eqLBsI2Nt@black.fi.intel.com>
X-ClientProxiedBy: MW4PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:303:8e::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd1fbda-3bbc-4715-4bee-08dd826bc114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zl5HUjsTtvQTvd8w+8QTE73Hg8VMkLU+vU2u9hh6HFQ173qeKll7Bb/Q32An?=
 =?us-ascii?Q?HdpawIRTSdydSf+uJ7uJqyqglCTmXzN6KiWSOqd1jqQAm38gOpEEPDMs7huK?=
 =?us-ascii?Q?bfp19ltt627JTtc3H2ZxImFKWZKMTGNskMgfVf4g7UK3LuSekD0nMPIMkjHC?=
 =?us-ascii?Q?YAJnHOEbJ/3wghEEzgap9Wgz7Je/zssMJfg2S1Df9rmvtJdFwCL56aEv0FMC?=
 =?us-ascii?Q?QmJv69ewCgj9ZSdbed5xprlrUj8AuacZPcyPtf6VeI8xxsV9txvCt0k/DL18?=
 =?us-ascii?Q?9/lDU9Qqx+UJm5LJ463zqjYEF3gda2nVT4zwcjsz7zfvV4/uALdjV6sqswxL?=
 =?us-ascii?Q?uEAgRJnufSOgX0b8+6CEcRnChIUVDtNC+0uESajc/Fwstn6EfpK22qpQkgQb?=
 =?us-ascii?Q?jgeZ4GsZdsuHEl3pZLV6LGcWzFwV/pJxgD8WYCUiLjNdguWNDYBl/MggjaCn?=
 =?us-ascii?Q?Ri/zt8M+dahA6+7urjQirPCXJSsIba06FC2tifRswXo89+nd7StjzgUn/4+7?=
 =?us-ascii?Q?88emeTcow/oCqofbMlaS6SgZx4LbMFqMHpCjSD77IbCPMQ4spBDAEaF1DXCb?=
 =?us-ascii?Q?VicauDiTfByyvDO+S/ew5RYpWpT1gBRygXS7CLWuypErfJ0ocQ3o18u/QLcy?=
 =?us-ascii?Q?msE47/pie2fwr+ad8WwFRmpTV0Qr8wDIGxVTtN7nIs9FYCNtTEywfi3io2V7?=
 =?us-ascii?Q?RK0Ec4kDa0Kd7UFu/EzXI177Nm8fVAtCP+XqLxaRYkxt6pb6kZQJ0FUKS8gx?=
 =?us-ascii?Q?iQ+xEfTixTB6doH4QjLazAqPz3q0/KkMabTksFlmqjXm19ODJsMqi1DBBhQi?=
 =?us-ascii?Q?cepXwBDMten9gHr0XGxDfnRftc/UsDf8tHhcHXWdK5cSa4FXiRQkdRvpxap6?=
 =?us-ascii?Q?zX/N0E2hMzq5otkAF4vfS07NDqUu3GpFA1xy1SvcFNPk1t43GQgLoNsGpAVB?=
 =?us-ascii?Q?R+anLHH/4jkAfcegV6a33UWLbDYdOvERi4paJHVCKfHqJdB9sVRC76nqSRaZ?=
 =?us-ascii?Q?utJueBKD+rOvZWq1I5XoccyBVPcnlb1FdOfSMeDD/GoJNxZRC6MKjh/Qveoq?=
 =?us-ascii?Q?lwpD8dFqc2NYbKcpAOtsEXUJOn1ZmsgDJ3fRYt9vYV6GgmPv0ZOMnNVy+Y0r?=
 =?us-ascii?Q?Kf93G+cSW9uxwmMWS0AynXNkbk9vltcFUDE2odlJL227SEf25+eU6DJ43bq4?=
 =?us-ascii?Q?YcSP00isFQQS+ktwKJAIg95M1PC7Jjykqw5Qir7azN3bNAqQJb+z7X3ufuOt?=
 =?us-ascii?Q?3MEhlw0MrqfHTK0JJlgKH7x0RuYnXXfxy2RVgR4cThBCt26apn1XXh0RqaE3?=
 =?us-ascii?Q?fSF2UPxDBfqp+LsYrG+3uf5rdt0HeEzj71+Xb6oehN/gU24szp2xY2WukM0d?=
 =?us-ascii?Q?yo1Rwz91IfibAc95ZpvsmCRvhEr1ax9+PO6RSeBYk8jYoFcjSIO6qio9rugI?=
 =?us-ascii?Q?H0HjbBA/veM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cnlQ1z4xlsMEIZqZCR90TxSBghF03Ptx8+LXpFwCNy2FXd45nsTTc+4ojQ1+?=
 =?us-ascii?Q?xOcqhFhhgTahXqX6EIeHHv2aAR1qh5yI0jGW5Kz/s6yzdJTfd1dj+wMKl+95?=
 =?us-ascii?Q?81E9zvELdm4XGz/7aIL+SDzdCHFWvePAyMkoYny7l93lyw+hJ6yYNF8zKFxw?=
 =?us-ascii?Q?DJkOsZyErZDFgEb4Ebsdz7vWbwpJ/4Wdh6+pgGVOzVfbm8gToAy1apccHWfK?=
 =?us-ascii?Q?HbTagvrhYJdAnEyEULdFItJUY/ykwF2QsmAUCbe+Liverytd1r4I8TQ1a+2R?=
 =?us-ascii?Q?88DghUvpZot2nSAdY8GfDCZ6rqVyMEay8WO9/gieGVVf3pts3d5J936cbktd?=
 =?us-ascii?Q?fdlg6YgvgtptxUGYwLSzcTSVub5jYlc1pLy7AiIhDCvzyZSKC1gvN0+xCsTF?=
 =?us-ascii?Q?e/2q4+D/d68zrqtiFuesQfni+1aO2gVYaAjTaEPu22vQgmEnpuBAniWu6T+J?=
 =?us-ascii?Q?WwFWHhX7CQ9n8VEqoraFlHYi5qxdCxM5YNwZk8cJlkcF0aclGBaWE5q6IbnQ?=
 =?us-ascii?Q?MkGq9B+W1r3mRWa6xekVBJFuLu2LpFJw4F7IfvsfZPEMW9CFWbQfh1gTJ9ti?=
 =?us-ascii?Q?cnE6Cvz3X2i5NlOG6Hmxoir4rNrtBWzVnmHG/0ghRTV/oU+RJL7c95dH3WvJ?=
 =?us-ascii?Q?RgtTOYglxDNrEQMVwFTzF2Yrt+Ev3Y5GP3zqGE7hUI9X0OXmCBMWH7VXpmgg?=
 =?us-ascii?Q?UDvpQJaCQmIMF9PH7qPs51l5qL3R7TBgzGP9xAVlMLeD/kvvAEDhM5nHgT/q?=
 =?us-ascii?Q?8+lr/Gh7uO0rPIgRy4yfG/QKLscLI1iMZKZPfT+6NgW1bP5L1B3MmzS1hu33?=
 =?us-ascii?Q?SecGWjeaZXXpy36j+eNTCuGNaAq4sUYzOPLHHdf8EnZ/sNsfS3K5pVbJgfst?=
 =?us-ascii?Q?suNQA3KJu0rJrf7aRXY+729XJ9v+XkJw38cx/8KUA4UXtC94rffCb76/ABHT?=
 =?us-ascii?Q?aYak3mYy4V8SBSui3J6Q9qhvFGI0viG5LUiuwk1HQYSEZ23BKbP1xx9nvSb5?=
 =?us-ascii?Q?2lTgfX7/jPJHCPY7RG49TX9LXlQs0DJEAHDi47ZMJcJcYXIkvjT7FIWe9bpy?=
 =?us-ascii?Q?MnDxTHRWVDNm0C0fubZRN/XJW2mexKUDY0oirahgT9CZKRnMFN1a5304Wif9?=
 =?us-ascii?Q?BYFhSGK31ztLiS1AGO8PUq33gyBgitcJ5R9lJFmF7+sWKULvZbXrnj9Gj0mS?=
 =?us-ascii?Q?M2n7Xsm/GdB6Er84+RzCUTkvUcRvuZtkeysGZ8q4+EtSWkJFEWfBBLYY8xNc?=
 =?us-ascii?Q?05mi6qgL0UIxUjOTCw7iMZWonskHdQYy/Rkpo1sCUAuOyY720N/H8NdxPPUU?=
 =?us-ascii?Q?Ef0GPFnoyRN0JQpp3wke2WmzPhVWVg5tSWetBKpNfJvSVe5w39wnyemocpqh?=
 =?us-ascii?Q?TDJ2PzaPUbY46VSYvNOREN1KLzTcr42ONGPORYHjXtoQXisdTBQby8zdEiR8?=
 =?us-ascii?Q?A9F47W1LhEKrQUXtraSaWe9S00vJ+E+inx0sIPgCpjGZBKncM9w1TxNBqBp0?=
 =?us-ascii?Q?0shBeZh/CiopmCqAg6M5wzuOs+rWgIVt3jF5GtKLceF6jUAjyPi1Y0XjpzQR?=
 =?us-ascii?Q?CrrJH2VTpAKFQ0HqTfRQOyxjlM0aXjfl5px5kht8s9eJL9BFZ8/VADxOl+fn?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd1fbda-3bbc-4715-4bee-08dd826bc114
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 13:35:47.1181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvnpQAoRei2Zy5RleXMTprvsAi+idCWcAiq12PL3uhjo6F3lHSVMZu8Lbh1KdHBfL6bWAoxYz3nr77dRi6kAPXIpXJ9Kl1A/HSJBMdb3Asc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8073
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

On Wed, Apr 23, 2025 at 02:02:21PM +0300, Raag Jadav wrote:
>On Wed, Apr 23, 2025 at 03:29:41PM +0530, Riana Tauro wrote:
>> On 4/23/2025 2:18 PM, Raag Jadav wrote:
>> > On Wed, Apr 23, 2025 at 10:55:30AM +0530, Riana Tauro wrote:
>> > > Hi Raag
>> > >
>> > > On 4/17/2025 4:42 PM, Raag Jadav wrote:
>> > > > Expose sysfs attributes for PCIe Gen4 downspeed capability and status.
>> > > >
>> > > > v2: Move from debugfs to sysfs (Lucas, Rodrigo, Badal)
>> > > >       Rework macros and their naming (Rodrigo)
>> > > > v3: Use sysfs_create_files() (Riana)
>> > > >       Fix checkpatch warning (Riana)
>> > > >
>> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> > > > ---
>> > > >    drivers/gpu/drm/xe/xe_device.c       |   5 ++
>> > > >    drivers/gpu/drm/xe/xe_device_sysfs.c | 101 +++++++++++++++++++++++++++
>> > > >    drivers/gpu/drm/xe/xe_device_sysfs.h |   1 +
>> > > >    drivers/gpu/drm/xe/xe_pcode_api.h    |   5 ++
>> > > >    4 files changed, 112 insertions(+)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > > > index 6c9d3009aa03..79b7b0ecfbae 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_device.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > > > @@ -26,6 +26,7 @@
>> > > >    #include "xe_bo_evict.h"
>> > > >    #include "xe_debugfs.h"
>> > > >    #include "xe_devcoredump.h"
>> > > > +#include "xe_device_sysfs.h"
>> > > >    #include "xe_dma_buf.h"
>> > > >    #include "xe_drm_client.h"
>> > > >    #include "xe_drv.h"
>> > > > @@ -916,6 +917,10 @@ int xe_device_probe(struct xe_device *xe)
>> > > >    	if (err)
>> > > >    		goto err_unregister_display;
>> > > > +	err = xe_device_sysfs_init(xe);
>> > > > +	if (err)
>> > > > +		goto err_unregister_display;
>> > > > +
>> > > >    	xe_debugfs_register(xe);
>> > > >    	err = xe_hwmon_register(xe);
>> > > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> > > > index 2d25e5b5d4bf..923612a0a2e0 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> > > > @@ -11,6 +11,9 @@
>> > > >    #include "xe_device.h"
>> > > >    #include "xe_device_sysfs.h"
>> > > > +#include "xe_mmio.h"
>> > > > +#include "xe_pcode_api.h"
>> > > > +#include "xe_pcode.h"
>> > > >    #include "xe_pm.h"
>> > > >    /**
>> > > > @@ -81,3 +84,101 @@ int xe_pm_sysfs_init(struct xe_device *xe)
>> > > >    	return devm_add_action_or_reset(dev, xe_pm_sysfs_fini, xe);
>> > > >    }
>> > > > +
>> > > > +/**
>> > > > + * DOC: PCIe Gen5 Update Limitations
>> > > > + *
>> > > > + * Default link speed of discrete GPUs is determined by configuration
>> > > > + * parameters stored in their flash memory, which are subject to override
>> > > > + * through user initiated firmware updates. It has been observed that devices
>> > > > + * configured with PCIe Gen5 as their default speed can come across link
>> > > > + * quality issues due to host or motherboard limitations and may have to
>> > > > + * auto-downspeed to PCIe Gen4 when faced with unstable link at Gen5, which
>> > > > + * makes firmware updates rather risky on such setups. It is required to
>> > > > + * ensure that the device is capable of auto-downspeeding to PCIe Gen4 link
>> > > > + * before pushing the image with PCIe Gen5 as default configuration. This
>> > > > + * can be done by reading ``pcie_gen4_downspeed_capable`` sysfs entry, which
>> > > > + * will denote PCIe Gen4 downspeed capability of the device with boolean output
>> > > > + * value of ``0`` or ``1``, meaning `incapable` or `capable` respectively.
>> > > > + *
>> > > > + * .. code-block:: shell
>> > > > + *
>> > > > + *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen4_downspeed_capable
>> > > > + *
>> > > > + * Pushing PCIe Gen5 update on a downspeed incapable device and facing link
>> > > > + * instability due to host or motherboard limitations can result in driver
>> > > > + * failing to bind to the device, making further firmware updates impossible
>> > > > + * with RMA being the only last resort.
>> > > > + *
>> > > > + * PCIe Gen4 downspeed status of downspeed capable devices is available through
>> > > > + * ``pcie_gen4_downspeed_status`` sysfs entry with boolean output value of
>> > > > + * ``0`` or ``1``, where ``0`` means no auto-downspeeding was required during
>> > > > + * link training (which is the optimal scenario) and ``1`` means the device
>> > > > + * has auto-downsped to PCIe Gen4 due to unstable Gen5 link.
>> > > > + *
>> > > > + * .. code-block:: shell
>> > > > + *
>> > > > + *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen4_downspeed_status
>> > > The code looks good. But i am not sure of the word downspeed.
>> > > Couldn't find downspeed used in Pcie generation context. For link,
>> > > it is mentioned as  'link downgrade'
>> > >
>> > > Could you share if you found any?

I'm with Riana here and also found it strange. User is cat'ing a file
inside  /sys/bus/pci/devices/<bdf>/ - it's odd to use downspeed when
that word is not used in PCIe spec and...

>> >
>> > Since we're describing both firmware and PCI link in the same document,
>> >
>> > 1. It helps distinguish between them.

I also don't understand the distinction you are trying to make. The
firmware is there, monitoring the communication and and is capable to
auto downgrade the link to gen4 if it needs to. I imagine that if this
situation happens, the link speed is re-negotiated and we will end up
seeing the new one on LnkSta... LnkCap still shows what is possible. The
only difference I see here from "I'm connecting a gen5 capable device on
a max gen4 slot" is that initially the gen5 is attempted (since both the
host and device report they support it), but the firmware may make a decision
in runtime to "downgrade the link speed".

>> >
>> > 2. This information is for the end user and has to be translatable enough
>> >     regardless of what spec says about it and the distinction reduces the
>> >     chances of misinterpretation.

when you introduce a new term that is not known, I'd say the effect is
pretty much the opposite and it can be even worse if a future pcie spec
starts to use that term.

Lucas De Marchi

>> Please get an ack for the naming from any maintainer before merging, as it
>> cannot be changed later and differs from the spec
>
>Lucas, Rodrigo, if you are okay with this, please let me know.
>
>> Code looks good to me
>> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>
>Awesome.
>
>Raag

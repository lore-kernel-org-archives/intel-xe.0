Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FD5C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 15:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A1210E2A2;
	Tue, 22 Apr 2025 15:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FivhZdab";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA6F10E2A2
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 15:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745335469; x=1776871469;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p7X77Oc8cJSXsXLKlph4Gm0IX5Ip8im6h9UwSZkoEo0=;
 b=FivhZdabr5CXS4Daei6VZKpC0k9Q6U147zETIjFT1mZjlaWtQQt8rocZ
 CZeBOnhUmc4FOlgriVnGCoVh2I8moaSRpkXD7NAe0ysr0mjsBCH/cOBjf
 QTyFhPz1zHxpm18sY39hyyyUsLcW8zZ3gS1CRHXjudCyV1gxubBwY8EvW
 kxbU10pc/rQZ2uEiCtUh98kqKQY2rIlWVPqR9mAbywkCX3m/3zLwVYdJj
 Cnx18iay2tg78y24iLPSoBzE3m3tCIbJDTEFAOnM4LBoftmDQeXReouQc
 A+e6SgJ8nTSVuLh7+HxbM4MVuhaCoDQMOE6WSREuLfs1TSRU+Od7H3emI w==;
X-CSE-ConnectionGUID: 1+glAIe5TZq51pPZtx+8hg==
X-CSE-MsgGUID: O9IECyIJSayylkDuvSMi8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="49563347"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="49563347"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:24:29 -0700
X-CSE-ConnectionGUID: xXQ3csAERyKI2AyMR98sqA==
X-CSE-MsgGUID: 25X/rHUIRVKjmfs7ffVb8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="137199543"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:24:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 08:24:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 08:24:28 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 08:24:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SELBzpWCJaPMAdJ+w+pVlICD/f4msS4+G5e1S9tV6of8wmsoLU2UdPqudxvZ/Tg64ld/BOhQnIRZo6ZDeLmO66As0ZrXsPaD3mwosgn4unPce28xVdlIkldWIu2SomMPpHKYqGHq50BB5IXDmE4VzQ39oe9R0Jka1uCWEQSar5Gtdf1XjXvKlieLJD1hTFhzJQSxFv0bDC27elO4VxSoV8qtdN1+ykqlnfkZ1ONOWMsZP31Dr96jwiF/hfOg77etHrTVosTpGPGMC6XJxS2zECP1fnLxRSGEW34+yvSevT1A9iZjxeS0BnOT745I2lkgUUgm+aSequCKGnxnAmbYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLiG7N9b4MH5bmo1ft3zI8IPV7yz3Hw2FNqZ5v2qkKQ=;
 b=KSrV0d380uGhM/71Xj+B0VQTfz33VBo3oOf0ks7WG3V4s6Hui0HakcKc2gPEa8wzKWP/EWnqsI+9re1KFBD4FidlrCXTzu4g9HKCeO+ymBuksZolSJIW1v5u+b0n5ontp2pokK+HkAPtYvS5BaBAMbMFijZ4+yebXpWH7nryTRh7fGzKwv2jLq+S0I6AIKptdrEj3wWVpI2zh5tBH1O7OgJ+R8J1KvtW+XEH1FVRyJFua2UcX15Kw3DoD0O1RZ9SOx7v/2FVZ4XdLvk94ikEFpVY0jtzCRnCmw8SsWSx8FIu9d7USiqi8j9pI6z2WkhsQ6IQSUxyOud6wwXEPedXNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6297.namprd11.prod.outlook.com (2603:10b6:a03:458::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 15:24:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 15:24:20 +0000
Date: Tue, 22 Apr 2025 08:25:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 13/32] drm/xe/svm: Incase of atomic access ensure
 get_pages happens from vram
Message-ID: <aAe09aITRn+S+Fi6@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-14-himal.prasad.ghimiray@intel.com>
 <aACBRZD2Up9VNZJm@lstrano-desk.jf.intel.com>
 <6c86072d-5c53-49ac-a482-cb9a5aa9ad71@intel.com>
 <695d000c-5969-4dfb-bba8-cf398214f174@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <695d000c-5969-4dfb-bba8-cf398214f174@intel.com>
X-ClientProxiedBy: MW3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:303:2b::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: f86bcae3-33c3-483a-2cac-08dd81b1c0f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Zglw7JuJZ5qPFRYqthXsuQCWIGRDJg6BBZPIJ5H9eDQb6dL8LlpcrOijnW?=
 =?iso-8859-1?Q?bD0tVIKJWzPc0YzRveVKf+LaAqltg68aEGiGMQO9Kq2bcXKDilpCboCUtc?=
 =?iso-8859-1?Q?HQF/rrKQ+gXlKwHZbSXB2UmKIeu+v76SLTwZYPjwf8WuKMHS2m+PVjIJBO?=
 =?iso-8859-1?Q?SuHJm40X2S2HpspiCRB/ATjpyzqnxmROkcprX6l1UNGqEKIQJvWMAldVaU?=
 =?iso-8859-1?Q?ni4KDrbA/BSq9IJ2kkDui6Joqe0W5Vh9oyhLPTj9tVrHjhg/7ReqaeWLID?=
 =?iso-8859-1?Q?iSudjOysJi/Zk3z+Tb0f09/lXbQy5vukyYSIgLyVMb8ae6pQLQL8GaIYe3?=
 =?iso-8859-1?Q?rwNH+AGSLfCCA0tq5XevWTGXz0k3xpWdr9Fk4Iyw9JudXh2TE/L7IrEcGp?=
 =?iso-8859-1?Q?B7eryeuL4TMGKu5tj0TGl4K5hW/4SHI7FhBvRYaKmPlrg2+rL8JtfSdPD0?=
 =?iso-8859-1?Q?SKkmjKGJJTwaK2RJZkpzaWTEAJ3AAHEaXxnBktB2M5JEuQe9cKkFpMBg6d?=
 =?iso-8859-1?Q?Qi50iM1eUbQwTAq0v6t1bniFFUVYZoPMtLLlXs3pEhq1p9dGT38N7z9+IC?=
 =?iso-8859-1?Q?BKQB0hCsL6aUbZ+2CiKM2WWe6BlrtPvrml3cbSxn13+lob+VdP71go6ve4?=
 =?iso-8859-1?Q?Zf62TBbzzA5ZQ5mt2Fpi5h7bM4OSoGmTqs0ZRyZUvpduomQVixFRAcXhAS?=
 =?iso-8859-1?Q?GwrBvkGhNrZoaQPvASeX8bFSSJ9zojrA1jyN4YPzL07i/JcmaeFyWp5XYK?=
 =?iso-8859-1?Q?pLM5TlYi+6hpY3KPQ7+ljLTInF9ZBFA0D5VNZuGK5HFZwlaf1cBVZeLGlQ?=
 =?iso-8859-1?Q?QkRzIPkbPbIN+3E6WLrUeO+5koSzKEyGLH3ykT3Ib0tewLb7GSRFH4Gbto?=
 =?iso-8859-1?Q?UZ9Ei/VXzu3z/nWj6PViDzxBwM/Fpg38MFaDJICLi14sM7xa1hTphzWL02?=
 =?iso-8859-1?Q?F99F19Fdtx/XK9EFae6LdQ48EoqvrMQOgPx5gG8Oza1HtG4dFM0ZXTQAq1?=
 =?iso-8859-1?Q?XvK1Kt2L5f/TR1e11hweEW6DPU1bk4d8BIcOaoswhAb23WUEOBnkesdxdF?=
 =?iso-8859-1?Q?egOxvQ1vH9bWB6Cq/BAW8jbwarZB7dRW6zwtvoOL9zoQVTNff7lC6mWjRr?=
 =?iso-8859-1?Q?fEbuxPfPI5MLTaAXbQLI4aYD5+Rh2ZWqj/mgFhUxqipwYGF3CzNfvj0SKK?=
 =?iso-8859-1?Q?lUXav0H6SylAXgsVJ1s5jJCFk3caD/7fwiZZV03I1sfKesEZ7+Bruj7vIF?=
 =?iso-8859-1?Q?HMbXF7T8v4f99G10AUfLKsGgsCVAY7L4PgwnK3UQd7ysEH17qX/HUygU4q?=
 =?iso-8859-1?Q?RuigkNllxoZR+cYVGCeNOtAORqXBjbXNHvdH8vMlNftZWXBFhBEmVecs7s?=
 =?iso-8859-1?Q?7VXniBM9VzpsUdrWdpy6AaQUm4kvBUX/ff9cOwkyIpgGJ0cb5qfRE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?R4NdO7Trg5vNTAk7paL2jLah7xb9uUK00uNBxO7ZE5RfDfgk9hxarR2bej?=
 =?iso-8859-1?Q?tXIM4JbiZS+PbY6wSg1mGcejfZ+qubQrAtbnSOeTty53upjEiGcPayJ6+0?=
 =?iso-8859-1?Q?OzJC+Lg/L/3XTdfAQZnYAqlUu1j2T/vQoGK3s3Q4t9JYNXbap3r/0ZBjhN?=
 =?iso-8859-1?Q?5x/nv8R4tya1/EtlvvKSDKujyJ3ODDwhQUiPtRD5wzig0c8fj+ItMoX5Hm?=
 =?iso-8859-1?Q?NKrXzEtMgf15mFHN85jMXoNIfbd8JboWFkrA7PW8AwHOqohMwKRRblLNiX?=
 =?iso-8859-1?Q?cQQthim5VAnHg0kybZLkAgmZB6D2siR8fN4t4zbYPAXB7TILLiwZKqFeTW?=
 =?iso-8859-1?Q?WQTs53rwYSRpxhwvXPM75bfx2Me1obBILfBOd7HLVNnjh8bnOF1o7j9lC+?=
 =?iso-8859-1?Q?fCDoqYrz2rtBerMo3rUe/01OHSSu5gwKJNREXsm5RkfC1PmByX9mHxBwYr?=
 =?iso-8859-1?Q?lqy26VELuY+P5r7UHQrWM+PdNvMDcLPonDofNHVF0FmUUbAmDP2y8G/IuQ?=
 =?iso-8859-1?Q?efhpZyTX49NYBnZPL1C8wgcYeY4bs0fu8i7PlkIKQhbefo+5PEnPm5uKqG?=
 =?iso-8859-1?Q?NTR4DGTyr9kjsHjnWPvCoSldsa0ZmlIxjhxdR85HUxc+q3k/1+aJExYK+i?=
 =?iso-8859-1?Q?5cUtyrAnNFpEdExn66iIOVyms2b7/FfgZYDqHJl03BhHgt6OyxWyDetbXH?=
 =?iso-8859-1?Q?29v+7alskC+YKD0ajCfIAy7jYxhLxyXlQI9BOcaWX4StpZACo3fU9Q1LAJ?=
 =?iso-8859-1?Q?YfTLnAQuFScCGiNyLkku55qCq/p0af4esEnvaVQiIcKy0oumgMMromNwOz?=
 =?iso-8859-1?Q?f6843nK2q4CO9n62Y1T9EI+qKFZDX3+zX0kvQaXdbr2/Type+iJGIyZiZN?=
 =?iso-8859-1?Q?ABvY0ppLPlpbeSCLwViAJlCOEKalExJJqsljJIJ+0XqmCv3Us39YJ+oGfW?=
 =?iso-8859-1?Q?PVnVfgcmk5iWbJgsoH7wfS/VsqheRWD1EmzW3VNkm7p7653VWuhBq13JUn?=
 =?iso-8859-1?Q?phW3JdkzEgoRx33HJ9DcWrQATwClBBfOLDBNFhu5xbsxLemMyQNiiy+Mfz?=
 =?iso-8859-1?Q?5LXMvGMc2mCOol67K2HOx6NpKBK1L/1zT162FtTvkNBU67GwwFE5o1tnry?=
 =?iso-8859-1?Q?3YXB9lg/CE40Rkszy4soxfUnVK1RVlg6sMVVJfvgwB7X798/yAJZDx7Chk?=
 =?iso-8859-1?Q?ATksXXPyvn7LyB+NcookE+BY4XXHZ7S/u300+KlGNVURd/JiHyLcJDDm60?=
 =?iso-8859-1?Q?fpUbLJmyR1SVWb5LYA5DKY2MwWJ0vgydFjngtKzuM/wpMbArlSnH64O+vm?=
 =?iso-8859-1?Q?NvnH1NE77HPc5fBgEVyfHL2tLw9eaxhShyZIHpfYtoAQ4iuRGA85bpgKW1?=
 =?iso-8859-1?Q?pO/5DCjOYgxxU1Q4nkxUHqVbRt9JfacdpFsnLt4H2Zhu69uqemXhDgGkgn?=
 =?iso-8859-1?Q?S9DfnHWczZRpK0hkyFJpNDqWsdJLMe30UZ13nuthFO9pcrqdlvUym8Tg6/?=
 =?iso-8859-1?Q?Q1zyRkXkAYI6w0X6fGb9hKwdSl23fsRv4rV1xFd4DCfBJ8Fvdc8uR5CqZG?=
 =?iso-8859-1?Q?CYLZ/LEwJ7zB3mf8NxHGRYs1PM906pRdfjg6K8rjp7XdyLnrGhq6rE66eR?=
 =?iso-8859-1?Q?hlBcTyLX1Bn3lCt3SuQGijOin/s24Bt2yekWow3Kt3aH3MPOdMx5wZNw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f86bcae3-33c3-483a-2cac-08dd81b1c0f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:24:20.5147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9V9JewedPntiB4rsT2whqJvP5Sr63cskpIKbgw0LUdEdyEG1+BQINVN0hpuSU+y612NEa+sHCnoInAYDo9WSBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6297
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

On Mon, Apr 21, 2025 at 11:59:30AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 21-04-2025 10:28, Ghimiray, Himal Prasad wrote:
> > 
> > 
> > On 17-04-2025 09:49, Matthew Brost wrote:
> > > On Mon, Apr 07, 2025 at 03:47:00PM +0530, Himal Prasad Ghimiray wrote:
> > > > Ranges can be invalidated in between vram allocation and get_pages,
> > > > ensure the dma mapping is happening from vram only incase of atomic
> > > > access. Retry 3 times before calling out fault in case of concurrent
> > > > cpu/gpu access.
> > > > 
> > > 
> > > Again I pulled this patch into a series which will minimally enable
> > > atomics per UMD request. See the version of the patch [1] I landed on -
> > > that is basically my review feedback. I took ownership but left SoB by
> > > you as it based on this patch. We will need another reviewer though as
> > > we are both contributors but feel to comment there.
> > 
> > Thanks for update. Will use the version you modified for the prefetch
> > series too. It looks good to me.
> 
> Actually, I see a retry count check missing for get_pages in
> https://patchwork.freedesktop.org/patch/649010/?series=147846&rev=2 which
> might lead to infinite loop of get_pages retry from vram.
> 

Ah, yes indeed that is needed too.

We something like this on a get_pages() failure. 

if (vram_only && migrate_retry_count <= 0)
	bail
else
	retry

Matt

> 
> >   >
> > > Matt
> > > 
> > > [1] https://patchwork.freedesktop.org/patch/649010/?series=147846&rev=2
> > > 
> > > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_svm.c | 43 ++++++++++++++++++++++++-------------
> > > >   1 file changed, 28 insertions(+), 15 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > > index f4ae3feaf9d3..7ec7ecd7eb1f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > @@ -778,11 +778,13 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > *vm, struct xe_vma *vma,
> > > >               IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > >           .check_pages_threshold = IS_DGFX(vm->xe) &&
> > > >               IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> > > > +        .vram_only = 0,
> > > >       };
> > > >       struct xe_svm_range *range;
> > > >       struct drm_exec exec;
> > > >       struct dma_fence *fence;
> > > >       struct xe_tile *tile = gt_to_tile(gt);
> > > > +    int retry_count = 3;
> > > >       ktime_t end = 0;
> > > >       int err;
> > > > @@ -792,6 +794,7 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > *vm, struct xe_vma *vma,
> > > >       xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
> > > >   retry:
> > > > +    retry_count--;
> > > >       /* Always process UNMAPs first so view SVM ranges is current */
> > > >       err = xe_svm_garbage_collector(vm);
> > > >       if (err)
> > > > @@ -807,30 +810,40 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > *vm, struct xe_vma *vma,
> > > >       range_debug(range, "PAGE FAULT");
> > > > -    /* XXX: Add migration policy, for now migrate range once */
> > > > -    if (!range->skip_migrate &&
> > > > -        xe_svm_range_needs_migrate_to_vram(range, vma,
> > > > IS_DGFX(vm- >xe))) {
> > > > -        range->skip_migrate = true;
> > > > -
> > > > +    if (xe_svm_range_needs_migrate_to_vram(range, vma,
> > > > IS_DGFX(vm- >xe))) {
> > > >           err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> > > >           if (err) {
> > > > -            drm_dbg(&vm->xe->drm,
> > > > -                "VRAM allocation failed, falling back to "
> > > > -                "retrying fault, asid=%u, errno=%pe\n",
> > > > -                vm->usm.asid, ERR_PTR(err));
> > > > -            goto retry;
> > > > +            if (retry_count) {
> > > > +                drm_dbg(&vm->xe->drm,
> > > > +                    "VRAM allocation failed, falling back to
> > > > retrying fault, asid=%u, errno=%pe\n",
> > > > +                    vm->usm.asid, ERR_PTR(err));
> > > > +                goto retry;
> > > > +            } else {
> > > > +                drm_err(&vm->xe->drm,
> > > > +                    "VRAM allocation failed, retry count
> > > > exceeded, asid=%u, errno=%pe\n",
> > > > +                    vm->usm.asid, ERR_PTR(err));
> > > > +                return err;
> > > > +            }
> > > >           }
> > > > +
> > > >       }
> > > > +    if (atomic)
> > > > +        ctx.vram_only = 1;
> > > > +
> > > >       range_debug(range, "GET PAGES");
> > > >       err = xe_svm_range_get_pages(vm, range, &ctx);
> > > >       /* Corner where CPU mappings have changed */
> > > >       if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> > > > -        drm_dbg(&vm->xe->drm,
> > > > -            "Get pages failed, falling back to retrying,
> > > > asid=%u, gpusvm=%p, errno=%pe\n",
> > > > -            vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > > > -        range_debug(range, "PAGE FAULT - RETRY PAGES");
> > > > -        goto retry;
> > > > +        if (retry_count) {
> > > > +            drm_dbg(&vm->xe->drm, "Get pages failed, falling
> > > > back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
> > > > +                vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > > > +            range_debug(range, "PAGE FAULT - RETRY PAGES");
> > > > +            goto retry;
> > > > +        } else {
> > > > +            drm_err(&vm->xe->drm, "Get pages failed,, retry
> > > > count exceeded, asid=%u,, errno=%pe\n",
> > > > +                vm->usm.asid, ERR_PTR(err));
> > > > +        }
> > > >       }
> > > >       if (err) {
> > > >           range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
> > > > -- 
> > > > 2.34.1
> > > > 
> > 
> 

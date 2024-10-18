Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B20CD30016
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 15:14:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3A010E078;
	Fri, 18 Oct 2024 15:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vspp3+ak";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F18B10E078
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729264438; x=1760800438;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gp1HOQW3DbA40th8lvw7T9Q6oFhV9MO/l9w7fv3VhAo=;
 b=Vspp3+akzHqcHEmpkiwYL+4NNH6yw5JkOAwEZSpDeMVjSP2Xn/FzMZmr
 Fdo+/YkJSiwQewmyvFUegVWRFsNShBYtn4MaPYUNw41xxtUeuuhmD9jh7
 EzP1uTSs4BIir9g2BTMJSrG/4+fofhtZXfvnatMOfS4CF2lOjXIysdawE
 ugaOOU/hu95M8uXS1G5d9jVkTVHK6B46COhP/lTxHmcRCyVC0YXAdNFoM
 f9XzjN5mqUMsLEUdVeB4LJrDlUcjCs2mwY2fOmvk33YI0ms8KEDDyxGnW
 ynI7NmqqXMq9TvuNZQULL4Xmu+tpHBKhLlY+yo/WzvSytyxCepT4UbqA2 w==;
X-CSE-ConnectionGUID: h5BvxutATxmsZMxdptQrzA==
X-CSE-MsgGUID: E6HeOBUSR5W1RS5scBkxRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28933668"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="28933668"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 08:13:44 -0700
X-CSE-ConnectionGUID: 9LAiu1uCSFevjbANYccf7Q==
X-CSE-MsgGUID: 2FJpn/pzRGCvh3CRQfrBdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="83515248"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 08:13:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 08:13:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 08:13:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 08:13:42 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 08:13:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBav1wgt0y9Q133YqyJFzl2BBVMslbKNfl30AxnODTMXIdoHgy45UNKAad/1s9fhSgnWXoDSDEcaqzz1Vh4VFXO6TqnB/BMWgpqlcLSMvcP+ieKqiYMMIdOdMP5ieXdcSDVURBK9tEtGUM/+zva1DYdBQyfj2z3p39DABoFUOTk7Ne8vki56X6g9E7ApEkv1SmjGHCc19fge2ArVtYpQp5fZ9WcwoeueFYK0b5jWazA4PBDFdscY95vmVUh76o+cEIXtUQ6+IaiOfhTeIFysOYI11Vggbxdwi6qKaN7CB2RF6S57xxMNyNp3iQJ66Gdfl5O8633M5Yux6rRD3G8W6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Er/gP5U1axvFeTntw94l9HF/ht9RPa0N2FCFZHSDYxg=;
 b=svVGDTlqdsmXfn0QdZLN7bu8EOx9p0M3woj0r0+WHAonskH83UCfsPI5gCPisdBHJqmRvXzZiw/sc3S7S8HVcG5sNhKyWWVsh0t7AOHK3/HoXUkr2AxIPY9Y5nl2IpRBjYgZ5ZhIx17sBgbl2O0WH8nQtKK04N1nRVAx6kkd9N0VZoSz4blO5+9nuZLWAVC4GCQN10AjYhZBhXk/8jvh+qx8F0Jqycae0dxUj6amxVXsGX7xxfCS1sXfpaPu5pCauUKv5YxocqEpbbe2SycwCUORicbSMl44lpkCu8Q3JD5oZcI0EELrvcBs/epU0ARGFlgnjOe9KaCD8HpmA4tpiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA0PR11MB7305.namprd11.prod.outlook.com (2603:10b6:208:439::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Fri, 18 Oct
 2024 15:13:38 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 15:13:38 +0000
Date: Fri, 18 Oct 2024 11:13:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Zuo,
 Alex" <alex.zuo@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3] drm/xe: Handle unreliable MMIO reads during forcewake
Message-ID: <ZxJ7HLx6RpGauoWD@intel.com>
References: <20241017034026.1525693-1-shuicheng.lin@intel.com>
 <20241017163038.1554591-1-shuicheng.lin@intel.com>
 <b5e91925-2c95-461d-a18a-ef7d448c9f78@intel.com>
 <BL1PR11MB5447FD4629F9DF8E6068A307EA472@BL1PR11MB5447.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BL1PR11MB5447FD4629F9DF8E6068A307EA472@BL1PR11MB5447.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::21) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA0PR11MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 5062352a-345a-4f97-4a65-08dcef87709d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9pYLvxlS6S2kzmzSL8s58PGYFcV74IL2XhY+AGvHfnmDJEz9twP6bJrWPx4l?=
 =?us-ascii?Q?oUGy8Rr5eWD14c1waAnt7zi3Qhy4wkAUlHhS9NLYz1ksccBA/Qkd18bHFMQY?=
 =?us-ascii?Q?h92/KS0ziA1mRxPY2k3uMoZCC7GyTmZ3zqhWu/gp6pNayWN7k6GaK38EJQJO?=
 =?us-ascii?Q?1bgvfeCWxLfuPztfN1FkIqeLQJFNACnr/joUm1miUNtLIIsWeRf+nRbydV6k?=
 =?us-ascii?Q?7MwiaGbTgm9EfPZaEBRzGKZgMaZYtVytlDLDOm/8kEaCULwH6pttRVep8Q+G?=
 =?us-ascii?Q?sKZkAqKyvfsWds6uJm7UR57k9FICIWF/n0OIfDTpIhIAhLjm6HPVsqgntA1P?=
 =?us-ascii?Q?+XlA+mWoYvmIAMF6KE/x22J0FbLB5VGj00qPq5M/C9Gdo0ZlGk4y3DGVN+tF?=
 =?us-ascii?Q?oiAlMW4FMpBLuX6oLzfy1HIDkI+2WVo8P05PqJGBZ1eNRjk9cvmG9LAA3ZT7?=
 =?us-ascii?Q?Cc1fTJHK6GovDY+oEXHrcc+xZnJgAoZFzqDKwRAjgJH+VMpmLNW7MD5MkOQt?=
 =?us-ascii?Q?2MjbNVeO1bzxU4Wk9fgg036qH3Qe/vAfDs0MifPLlGzoTM6PEyxb8ZiIHgzF?=
 =?us-ascii?Q?cda2J1OPj26ORMx7GTLJZa1Y8sYWtNLnYFuwk6gS0WJm9cqvOSdNzo0QQ8CI?=
 =?us-ascii?Q?fgzaMi10/Yjf7UGntUHY8Hjzgz3sL2HmM8rfbwTmAuU86Kwv97IKnh+VT7LD?=
 =?us-ascii?Q?88aVQey64yEK9pmvfUr4uHS+EeE65x1F5H4Nu/9KONoqRJhT7Fr4dDo7Bkqo?=
 =?us-ascii?Q?xIs2kW4lHItqmSwV9IpbRyVV4xLoiTv7SaYMqoQeB0CD1SVoZ8PHRsmc83BG?=
 =?us-ascii?Q?vWJdvSDgJ60RkvWarpyI0tzm4J+K31JamG8XvBqFd+RkNm3aebtBrl1K0+DV?=
 =?us-ascii?Q?Uzkh/dFmU4NE/bUb3S6il9fQ0hTHzEg//KgRt4B9ll3q6I2+XRgxXrukjWHu?=
 =?us-ascii?Q?hDE+mAijXDIFsZtYvOJpAFsHAbfUxyg3LP7oMvYpbZkAxsOObM88L6F2Ur4P?=
 =?us-ascii?Q?mAwbUU1ARoiaCBwl28Pm4OK28pPZFIVQkCT10GAP6SjsIxcEEHu9r+awsp8L?=
 =?us-ascii?Q?nT/hI1IOGHFwGFNXLOpsRWuzx0/P0qYRnFxmTSvWEies2ANN/7pb0bgqCa8k?=
 =?us-ascii?Q?AHCVQnzihql0R0hY8yhh9wAcGJEEHhJvm/Bl0Hqqj0regZ5j3GtoSFFhhPKL?=
 =?us-ascii?Q?cxnQWHDJVfpfPhfnnZ+DHN+9NOs/x3AKznvUns37JD9mpsZJFPUgShjwIB9w?=
 =?us-ascii?Q?QDydB5luedHSDeDQnjcyJGrEgz9TYEsA1ZvikuCq9HVVXBCZ9jtgiHOGi2Ot?=
 =?us-ascii?Q?gJ7wEGrV8GGs2d2V29AjZFIc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hZAZ2Hv9FGBEE3XnAvb2g0t6DM6qcfmcE1xqtZeHerdUR7AHzC2h0SfTfrqv?=
 =?us-ascii?Q?cY0/h3n5gEPH/qxpYWg6V+5CemdfLi+jUw/W8jTZD/cuHtoG3C4biHNs0DGP?=
 =?us-ascii?Q?IhX878z9zgi6Jksv0qzQM5YcINh3CZ+3y4/NzBKHbEVr1zquWWIsqgk0Krlk?=
 =?us-ascii?Q?e/TP8i91YO3NteOzt3u/YewUkp2+dwJbngHFCm70Lds5baDQrnkkzFFD4V9O?=
 =?us-ascii?Q?kFay+LaKAHsmLUDVF5lZjz/PSJGa1uONUT4d52U7E+vbxutqLDAkudf1cPm4?=
 =?us-ascii?Q?zsSo2XOB7veAsnRgmROm5sX9MLwgU4kbzEdvgy+bFlurX/F9Ufl0eZZuEWhq?=
 =?us-ascii?Q?xHW4J/1F2cyGzZUr7hoOR0r65Gdcz8jkuPf5DVw3Qk1FCA0JkItX1PL0flxC?=
 =?us-ascii?Q?7yh+ovsTk2YV9q7hDUuuGNU+UKl/+uteUNvKkQ3hWKBiAJqo0YTi3VjUpj/k?=
 =?us-ascii?Q?RMAq3p/fjtDGd1z8AYMswwnUFp/iv1P1e9FfPaex5UAmVCGdSiceA7DJrzeO?=
 =?us-ascii?Q?9fGQoNNYiSLSg62yp9WizXfKmhdp8Rt6EhyDEYrk7ka5NhQw+iU4VhgLLwo1?=
 =?us-ascii?Q?e5pNVqfZml4EWi5lPpr9nNVgrBAzWAV1b8uzRjugq44NCijEjoKyVgtvTYzL?=
 =?us-ascii?Q?dtXASPULae8WQyRNPFvmuM5+y+YIF8YPN4JI9+SJHXrCyjXeIW0WI5wdhphW?=
 =?us-ascii?Q?8HniDwVfqWbnZGTLkN07I2mjysKODnpe5XelcHLe4+5bTOoOmBbk+F1LFyaG?=
 =?us-ascii?Q?+BZvvmW0Zb68OEDSuPK5EnDHkQrk761s4IhyVDKO04EKKI3/xS7foTQVDA8S?=
 =?us-ascii?Q?L+daHrw0/wwIuHMI4Q5ZwXD3ecv1ouLopYXem8gY7uYWcGqT6ez1joxSsB+J?=
 =?us-ascii?Q?cxmDIbmnJlDPw66wrSxya/b4h9qnkgrjnQ1ogzrA//e7TOtE7YUh/DoPHozk?=
 =?us-ascii?Q?PRbo5+SIIymP06PF0RbAVQcABs9+GCJRsd5SOLMwK+Z4wkfsCxBNYEUVTOXd?=
 =?us-ascii?Q?6hsIsjJZW2dKi4F7rrxrdWC1spUx39SZLJ8i/pCMeY9373VUt7BR93iz+mhU?=
 =?us-ascii?Q?txEVJWLHWO7h417Xc/kW8z8kjZzPGacbP1f174r+QmqQGE2gAktjExy9LgQe?=
 =?us-ascii?Q?XpYRB9r+pOaIiXaSGtLi/tqkeybBsvATqRYxJlmDKcyPKgX/T0bcMGXyCPlo?=
 =?us-ascii?Q?S5XXdGM/l6K97jH2uSlXwA0rjMzLhDxy9BOklz0e3zRC1vui05U4vZJg/5U5?=
 =?us-ascii?Q?biLO6vTbI6DsD4wJODuLO64KJ9tITl5qeKP9WFImfiP+vcXrHPitbOQce1qK?=
 =?us-ascii?Q?3nR6+t6ORaje92COLeQxIIDWfqRPUa+LGciRsBQDUzR0BHMOjByOJvwf8fEB?=
 =?us-ascii?Q?Ez+hfqfoNolywMyEdfekuq5kMOdJ23ygvLqjKXAwjgsDN1TOdvRTOxYxadSn?=
 =?us-ascii?Q?ybXufex61uGx7kvkJML8/TNupcWz/0ED80sFWF8+mzjVkiYR11YRzfqhRSx0?=
 =?us-ascii?Q?FwNeMuUl1OhOsKgPrtgSiUq8RqtuwPKG2R3ZHeyjl9RfgmunqRKxONO2DY+j?=
 =?us-ascii?Q?50fzo9cWPk7Ru75DdeA3+oAcfZvlNiaL1FzOf5+2DNXtdoCMOGUNkua+zJ0d?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5062352a-345a-4f97-4a65-08dcef87709d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 15:13:38.2297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9t+tSKZIJ7zbfBRB9y0QdGh1fpVDlvFrR4uCTC2TfVL4CNs0SqzwBIJFlKtBuSfgGtudVvIa44bGLs2R6dXd+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7305
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

On Thu, Oct 17, 2024 at 10:25:46PM +0000, Lin, Shuicheng wrote:
> 
> On Thu, Oct 17, 2024 10:51 AM Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> wrote:
> > On 17-10-2024 22:00, Shuicheng Lin wrote:
> > > In some cases, when the driver attempts to read an MMIO register, the
> > > hardware may return 0xFFFFFFFF. The current force wake path code
> > > treats this as a valid response, as it only checks the BIT.
> > > However, 0xFFFFFFFF should be considered an invalid value, indicating
> > > a potential issue. To address this, we should add a log entry to
> > > highlight this condition and return failure.
> > > The force wake failure log level is changed from notice to err to
> > > match the failure return value.
> > >
> > > v2 (Matt Brost):
> > >    - set ret value (-EIO) to kick the error to upper layers
> > > v3 (Rodrigo):
> > >    - add commit message for the log level promotion from notice to err
> > 
> > Feel free to retain RB on this version.
> > 
> > As a general practice, creating a new version solely for commit message or
> > changelog updates is avoided, as this triggers a full CI run. Making changes
> > before pushing and running checkpatch should be sufficient.
> > 
> > BR
> > Himal
> 
> Himal, Thanks very much for your experience sharing. It is really good for me as I am still new with the process.
> Yes. Maintainer could help update the commit message during push stage, but it will cost extra effort for the maintainer.
> Unless maintainer explicitly offer it, I still prefer to correct the commit message by myself.
> For the RB, I forgot to update it when I update this patch. Let me add it and send a new one. :(
> I will try my best to minimize the patch version number, and it is still a long way to reach it.

Well, 3 comments:

1. The versioning in the commit message itself is a questionable procedure.
Most of maintainers in Linux ask to not add it and only mention after '---'.
We here opt of keeping the whole history together.

2. We also try to minimize the changes in the patch when applying the patch.
Otherwise the history is lost and we won't be 100% sure if the CI results is
exactly for that patch. So, resending was a good thing.

3. Patch pushed. Thank you!

> 
> Shuicheng
> > 
> > >
> > > Suggested-by: Alex Zuo <alex.zuo@intel.com>
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_force_wake.c | 12 +++++++++---
> > >   1 file changed, 9 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_force_wake.c
> > > b/drivers/gpu/drm/xe/xe_force_wake.c
> > > index a64c14757c84..08621717b14b 100644
> > > --- a/drivers/gpu/drm/xe/xe_force_wake.c
> > > +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> > > @@ -115,9 +115,15 @@ static int __domain_wait(struct xe_gt *gt, struct
> > xe_force_wake_domain *domain,
> > >   			     XE_FORCE_WAKE_ACK_TIMEOUT_MS *
> > USEC_PER_MSEC,
> > >   			     &value, true);
> > >   	if (ret)
> > > -		xe_gt_notice(gt, "Force wake domain %d failed to ack %s
> > (%pe) reg[%#x] = %#x\n",
> > > -			     domain->id, str_wake_sleep(wake), ERR_PTR(ret),
> > > -			     domain->reg_ack.addr, value);
> > > +		xe_gt_err(gt, "Force wake domain %d failed to ack %s (%pe)
> > reg[%#x] = %#x\n",
> > > +			  domain->id, str_wake_sleep(wake), ERR_PTR(ret),
> > > +			  domain->reg_ack.addr, value);
> > > +	if (value == ~0) {
> > > +		xe_gt_err(gt,
> > > +			  "Force wake domain %d: %s. MMIO unreliable
> > (forcewake register returns 0xFFFFFFFF)!\n",
> > > +			  domain->id, str_wake_sleep(wake));
> > > +		ret = -EIO;
> > > +	}
> > >
> > >   	return ret;
> > >   }
> 

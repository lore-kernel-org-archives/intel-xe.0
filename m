Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC637C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 19:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA9710E2CB;
	Tue, 22 Apr 2025 19:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S4dnm7/Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8B810E2CB
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 19:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745350991; x=1776886991;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3i7SKIiXIsu+QU5iQd2HeBl3vmewRna4Ye4vWuol738=;
 b=S4dnm7/YPtIsmEgHWQSDa7mZJMB4c3k77yyIhwnO/9dveqMonQPFwT5z
 E1nJhdn3LVBteqcp4puhfrkG1MKMrHYXqiO3u9xohYjVy4lEAygUjyQlT
 THRWhHfOv80Mm0bcq/n7VghyVAP3F6CVsSg9f1JSLLPDcOJQ6LK1+rIJB
 PdRdXXxh/6FprNtAvbi85Vv10T44vJbJ3v/2ikcJdgbtwtRKj+hHPVMiH
 hV01sB1Dqs07306mc+HBXldhgakGYdkdq5Zk118x6dppRHIzBlFg7JN2M
 cpFSNNgJvR8XvmCUTHo/Bqz2vmhK6hlcKGOVAdE3F40dGzdGS/ko9GynN Q==;
X-CSE-ConnectionGUID: UhGXLIZkSru3AK0p0Ye96w==
X-CSE-MsgGUID: Hx0BXWDfT3mcydwk30s7Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47104641"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="47104641"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:43:11 -0700
X-CSE-ConnectionGUID: Stw03xsAQ7i/etdVpDbdFA==
X-CSE-MsgGUID: V7WLVLtwSoOFVivZ/b3dNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="163160618"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:43:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 12:43:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 12:43:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 12:43:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p31nLcbSiS7intI6xdnl64e79CINDWVoRc3NBClFmlv3ldHPbgHj6wCoJ+cFxkXNf5sctNIsUGCVQmhDdvA1usBcEodXmuBfvpqTJRQlwiEKzN5ua4BMZjqVml6qZ6gtmR9Xf9Q6vOKuwi2AMGTyq1XaFWRnHvUFUybVH6y+Lrl/mvNtZzHCmTSQq+/XnfZvoIbpUyGrz+Aq1AZyT6r3qnbkYlNgri7Hs1AWJTmy2kDwmHINzL7cLKIeaOfuBiJ3wspB+dloJF5HkQGahZzVS+5rBsIaBatArf6YoMEnJsLXBjyQb52BpzqbPbDvMrQvgrbed4cw+VZbQJ+t7sDlFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+P7Q5FjuRegw8QasnSGo8aM6Q1Hfv0f0NEVKytUo4g=;
 b=S8todg/43+rRTY7E4lzzeBjyWzDboFtKsIVu3HXFJRYt45Gya2VhW1YH7Wvu7bPz2Fxc4Ez3D4Uh4MseP2Q0EwtLfmkAu9a6OHjO3miFtllF9yQLvGRdU4PgqqnQzc2tX8/7oP6nRNvrZK127Anf2MP6FYwv+UXm2vF0y34OtsfjwZpN6pjRMnvupfNR7qnbYsQIlPhoNPwyYM8Dmz7jACNSWPtT79LH2FhR2B7TrYNnCbxyHaaZILok1mNL9lgFEwcGg582miVKQq4r9DTgBtDys1djbY53ZEVZ3OoNVBpO82akbQqXCDlsoYRbN60/FfT+ztwbRTiobY8kO+EIlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7175.namprd11.prod.outlook.com (2603:10b6:208:419::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 19:42:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8678.021; Tue, 22 Apr 2025
 19:42:50 +0000
Date: Tue, 22 Apr 2025 14:42:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Ulisses Furquim <ulisses.furquim@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/hwmon: Fix kernel version documentation for
 temperature
Message-ID: <m2phxj2zvpkil576b3u53yao3zxu3735nc65vnecx72qs3nwbm@5hi3453lepr5>
References: <20250421-hwmon-doc-fix-v1-0-9f68db702249@intel.com>
 <20250421-hwmon-doc-fix-v1-1-9f68db702249@intel.com>
 <aAZ8qZytCQQrSLez@black.fi.intel.com>
 <uorgzeqaszua5ofvdff2u2y5gba5ctc5tq3ziu6voih6uceox5@jypdw3tcp2oe>
 <aAdGiAj31OBqIUpB@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aAdGiAj31OBqIUpB@black.fi.intel.com>
X-ClientProxiedBy: MW4PR04CA0384.namprd04.prod.outlook.com
 (2603:10b6:303:81::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 75000ff1-961e-4a39-58ac-08dd81d5ddb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s5oY6n15ChnIHJps2aiGiiaVpWV/hNim/OKY6IE37fbt3y2swMu+lSsG+afU?=
 =?us-ascii?Q?CqZkQ84iWy99SDRDtZ6cYMIDwKmUY7Bbev2Pm5S8c8wjyB3QpXqCrnuE7sGD?=
 =?us-ascii?Q?cp963hdrnWX2r7CJVpyt9/kHuuWNsl3BTBI5JuDL/824M0QDvSJ07WtsF8YX?=
 =?us-ascii?Q?40hgS1v77oGCFQKPoxkzMZJOs8jbp+2sLswdW2u4CLHw0kx6Hk55qjlpbhYN?=
 =?us-ascii?Q?yvEc3p/wp4N6SL2f1qtqlXJki0R/kiQiM83yoBzpXe3TxNKJCjKRcvWuwjMm?=
 =?us-ascii?Q?gQtKHs5kIkS6m2t3bvI6GTfzxdnyom3NXxnM4uxX6ii+GypLrwiS9fCOR9xR?=
 =?us-ascii?Q?vpArf+TuEBgPQhadwTpjiV1//O+fa5mAv+0V5GZ+hlFEq64F4j/qP8+j0kyt?=
 =?us-ascii?Q?TIkp72ANEPz2E42kqzNzdMjTP1+18CHHXNWXOfbXvuFKdwb7P7gRv1CvsYJy?=
 =?us-ascii?Q?P9hKgINN3GrXix29tq/Ggt5FDri6sHOihnzz1LTeNG5Bv2dHmehhsBFQMEQ7?=
 =?us-ascii?Q?sYtWvcgVou9ps/TzG4A9A3UvHrQNJh/x7Wub7z5Lfm8cbdBdq8pioCsUgPDC?=
 =?us-ascii?Q?f2lcdqS2gGiPZHx0o6oUqr094SXYgwaILfNSiPg0NxOIBR7blNfAMD0EMIoz?=
 =?us-ascii?Q?shpzVUGebOPs24iVSKQYXdtVTds93xcL8YsBoGxfjZdUnU2T9Tk3X50H+/wb?=
 =?us-ascii?Q?5qmkj96eHlZf42+geP/7m9ku7R3yj3lpUYzPqxLdPfh0QdHIPpx+TgCTESwb?=
 =?us-ascii?Q?fKqHjIkYVtSwhYD0IdZDo+bP6+5OgU/gVE2gN1gZaCSE1JeZ51nESOoYeJTp?=
 =?us-ascii?Q?3oXekM+7G2XMPXH4wlFFKyyrto9ItcMYx087YgVyCfjqeYUY6rzbi0nYePaG?=
 =?us-ascii?Q?qYTFUImursx4BDtvF4P8nag4Aln48ibAo+LBym7ycumnaUl3TSdN/x0WNrax?=
 =?us-ascii?Q?BVdaSja5OywyZARw7UX7UcM3iYjl6GOgXYXYAkPfTrC7qmGuEUMQdKDCy6Ls?=
 =?us-ascii?Q?DtibACsjfc1bFHQPAlNz3TUVkiBm0Tm63OuSDB76SimFwaVw2YDlf2+cxlGH?=
 =?us-ascii?Q?1fewEzTiMuMHSSnPv3CeACe0M9pzg+JEZ9fRxqvyNvbRYuYiAgIXBbPrfV0C?=
 =?us-ascii?Q?Maw4+G9U16ok9fbB0My/4ShnJiE8G6lzZQWLx2X/euDWtaL55o4glP7GcIhQ?=
 =?us-ascii?Q?1dYMVdrynd1WXXI5KvnhP/+w/p2mzuGZVkgOJfj4sJMui+p1t9SnmwkndZ4Q?=
 =?us-ascii?Q?aie+t9np/QdfUaUu6Upzl3gYWfmQ/Ex1h0Cq1VNbvjl79Cf/3s3L3MKyZC3W?=
 =?us-ascii?Q?013JOQBrkpes8bhiM155HECKpYaj7bDLybD8M57rhJHTconuymVufI1zfLrf?=
 =?us-ascii?Q?rtnLJJw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BzHUA0EqN+cJkn8pgh19Bzsj0zHFpnpF3fOjRYE3W+RCDSRdhgZIGpsf4/1+?=
 =?us-ascii?Q?o5Mj9d8j58DNvQbcC2g/bFAT9wxSy8nuj9EICu52uvd9y1ylf/q5BzShlk4Z?=
 =?us-ascii?Q?HwW5wTzdj6JvwhYnj58wdoqIB48LjNU4jzhH/b0PaGwXehNX9kLPYJXO+UbD?=
 =?us-ascii?Q?7r05k3WHfjczGsYjW/sMfGOR3mOrLBagn3+4B7aurULKQZXmJsv0oWYVm+Gk?=
 =?us-ascii?Q?vddk6RVqgJHKvl/Hj62C5r2EQsutuChrdOemAyJ3L8xezVOMupVRL3rufLsv?=
 =?us-ascii?Q?27R8f5G7pm9UZnIkMVAvesWu0D3oTzhrghd+pxCXnwvVCxUfwmXuZxYyFRJt?=
 =?us-ascii?Q?rT07BakJt620I/AxQPL3trByVn2b7uCXNyAUP4l2oPLonWSgRrgM09iAENo8?=
 =?us-ascii?Q?ps0lAINS324euyAlnQf7Iq18dbMj4A6HuQwID30Ns8bjadgU7Iz5dVCDKYwL?=
 =?us-ascii?Q?gWYCJtAihHmO8cDL+k+IgP0RBGSbitnrsaOSWznZDbEO6DMxnjZaMRIyQwzo?=
 =?us-ascii?Q?R9j2ytcDmJ0P4P9IVi5Zsp5xdhSM+t+SdvYe+Xz7LGTBrbMNw3waAlHphcK0?=
 =?us-ascii?Q?ap4AQmTieZK7WK1vJxiky5t5LphTIoIC6x1WZVrrML4uooOwT6Od8by3ejx+?=
 =?us-ascii?Q?ty4q+Xhp+RLWQ/97KPew6TSez8yC3LaAmgkGIPvZN/s9wsgyp65FiAXvThy2?=
 =?us-ascii?Q?+iHNEUwGljW/oisBkNdDCqU/GF8Bo073FV5NlPCE5xsLcZyP0uXfLZpqwmdE?=
 =?us-ascii?Q?CS30Vrh2WXq4+Bji74ojXw+BoQB7DnOYPuubBQ/JhJ1GKjKYmhPCU1rf6gOF?=
 =?us-ascii?Q?7XfxQY2x4+nfEq+Nhfpi2uSh1Tr62+3KCN2stAlFBlHQQVmGbSoKh6C9hR1S?=
 =?us-ascii?Q?FMVA5QsG3cokGPATqucyg+C9Byrpd8Pgn4bbwbBNQxu0BU78pO6dcvzcIsAP?=
 =?us-ascii?Q?A2r1Zs2d7UMBqncST6lLhpqdsKFs/41DEv5ukU09stYtDeonqF5Ux5o22Ci9?=
 =?us-ascii?Q?VZzaCKuyRwOW/YUuFGeuwDFAgu9IbSTRs4XH3YadvlmSFxd9MZYmJ/pkU7O3?=
 =?us-ascii?Q?qpwMYfRnQFW5hJFOsQl5C/f1qFVwQ8TiT8/tMz/PFKzWL2T+ehRu1d/FojfQ?=
 =?us-ascii?Q?T2vSpgWjXvTzvVAAZBVuW8ZiUPID5H1DG8CHHPd6LISgygLZzk/KOzsL9gGM?=
 =?us-ascii?Q?57Y52HSVKXAYCDS0vmNIQTqNiUx5ajnuRZ0hXfSQKm6nflv6NkqDda9YTGma?=
 =?us-ascii?Q?8HIOx0k2G7OI1SJ+F26YFIjyshV3ISg6ORZhjDn7yup1pruAsg4Nzb/riy8T?=
 =?us-ascii?Q?nDC/HKvYyNm+wc59Oo9w82ZmQHhJVXVcugnGxfv8gUReqaWAfvi6JD5Bufz8?=
 =?us-ascii?Q?zH5LDgmN3q9hB8UTTftq9yR/n2BfIULqA5rBYes2kVhFIVkzwCEzw2wFCHp4?=
 =?us-ascii?Q?+UfOoqlTxkyMR3Ni3+T8+stz6mKlkxdUezQPDNcKV8V/G9bWJ6Lo2AkY8qkA?=
 =?us-ascii?Q?FCWHkUWeiFFvnQwkWi9ktu5KHfp+cWBSmS88KI2yuxHuXSdbovGq6bK53+3I?=
 =?us-ascii?Q?piakfVvMaBtz+68mUCrWyAlbvdrwHTRqB7ZPx1OuTYNxbkuOXRBfoUL966cT?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75000ff1-961e-4a39-58ac-08dd81d5ddb8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 19:42:50.6090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Tu7LW8a/TkLnxshRas0yZgl0+e/LrSQ+Z5Gf7YgRlo53djT+PvHVIaTN6CCJDzwlZ70pOLZhKqyvaZtBNuFiV1G7VhwoXIycQmE4Thj0nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7175
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

On Tue, Apr 22, 2025 at 10:34:32AM +0300, Raag Jadav wrote:
>On Mon, Apr 21, 2025 at 02:53:00PM -0500, Lucas De Marchi wrote:
>> On Mon, Apr 21, 2025 at 08:13:13PM +0300, Raag Jadav wrote:
>> > On Mon, Apr 21, 2025 at 08:15:38AM -0700, Lucas De Marchi wrote:
>> > > Wrong copy and paste from other entries: these are starting to be
>> > > supported with 6.15.
>> >
>> > I had an impression that we follow the upstream drm tree, but it seems not?
>>
>> This is a simplified diagram on how it propagates to a X.Y kernel release:
>>
>>                                                (a)
>>         drm-xe/drm-xe-next  ->  drm/drm-next   ->  linus/master
>>                         |                      (b)      |
>>                         `---->  drm/drm-fixes  ->       `- <X.Y-rc1>
>>                         `---->  drm/drm-fixes  ->       `- <X.Y-rc2>
>>                                                         `- ...
>>                                                         `- <X.Y>
>>
>> 	(a) 2-weeks merge window
>> 	(b) weekly fixes propagation
>>
>> We always first merge it to drm-xe-next, but depending on when we merge
>> it, a **feature** may be targeting different kernel releases. As a rule of
>> thumb, a -next branch always target either the next kernel release or
>> next+1 in case current is already on ~ rc6. Fixes target the current or
>> next release (depending if the current has the bug or not).
>
>Yes, which makes targeting a release a bit fuzzy for the patches being
>merged around -rc6 (unless we have a hard cut-off rule that I'm not
>familiar with?).
>
>Side node: This is definitely worth being somewhere in
>https://dri.freedesktop.org/docs/drm/process/index.html

This page is not related to drm though: it's just the html-rendering of
the entire kernel docs. Also, I don't see any other subsystem/tree
detailing the "path to Linus".

>(atleast for the folks who are new to drm)
>
>> This sysfs documentation is for the end user and userspace developer: they
>> have now idea (and shouldn't have) of any branch propagation in the
>> kernel to get to a release. This propagation is not even stable across
>> the different subsystems in the kernel.
>
>Sure, so perhaps reflect this in the commit message?
>I know we do it for other cases but being accused of copy paste doesn't
>feel right :(

This is wrong for any subsystem and not only drm. If it was not a copy &
paste mistake as I assumed, I can write something else in the commit
message. Please don't view it as me accusing you of anything: it's just
the most common mistake and I assumed it was the case for missing it in
both instances. Would it be better like below?

	The version in the sysfs attribute should correspond to the version in
	which this is enabled and visible for end users. It usually doesn't
	correspond to the version in which the patch was developed, but rather
	a release that will contain it.

Lucas De Marchi

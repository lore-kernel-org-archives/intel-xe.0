Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81866E6F061
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 14:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408A410E1F2;
	Fri,  1 Nov 2024 14:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gomrAibW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E51C10E1F2
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730470997; x=1762006997;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YvY1PkUa58wW+V6ARihN8dnuMsujSLL4b0D8PsacNY0=;
 b=gomrAibWjrUME5PutcN7OJISxaoyh81kuolHiSy915Lf2K2bBqf9FX4E
 ras7xADWDSp27rlum1dbPAEKjIDOPxBcExstWvek9jzU56u1Ht74DCWQ0
 +TU/bGRvuLkUN7460GiC2ZJhDrWNdxbtxaoA/WnqVqbwfCbWwmZIzSJ5K
 DBPF7tHz/ptnq+6SJ5lXPs19/9E1oVAKSuz/fvCVBLfd+nFAY+X8GmsFa
 VW8K4ec0Zy1U2jBBtOR5BqpiTHHEsdUmbr2WdUktM6/2QzpTbLz3i0LqG
 3zQY2uiJUc6akXY0SrTZnilOUvUXOphwS/anXZ002F5KXkWy0lMvCbuDo g==;
X-CSE-ConnectionGUID: aiAaYmaMTm+rVlD/IAhSLg==
X-CSE-MsgGUID: hfE0SMWQQYOBoxc1H9Y4cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="47725261"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="47725261"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 07:23:17 -0700
X-CSE-ConnectionGUID: p6EEKmEjSsa8LiANdGfhZw==
X-CSE-MsgGUID: jDjHLqG4SBGo9nWixuGPcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="86916629"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 07:23:17 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 07:23:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 07:23:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 07:23:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cicjJbnK9UBO4JPbCsVNeVV8sN2DgWrwt2H2EFpDwx7XLr6ipZ4FNabFsOeCr18gOEt6Tt4Lxn6Hvv7BqB1b/Dzox38L9gLhubJExRemkIqP/LoEPovzUPhvQhMQNlSdV3SMV93iHmSukt8TIslY+6nEbfPwyiMvDbMxOG4EVBHDrM/zExUTd3QfL6hv/CuVpMgNAiYluF990LC61/FyZSAY7vsIaza8cTgdOjZ627G2HrzsfclkY6yOxmMJpY4ikVxk8CuKqfjRgL/YEkAruFqw4p2mseMbFzBwmIJI8QPWrmIu5wpVuWC/xhkyE76qR/wD0wWd/adh1jiOaGu9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uf643LraVt3CTuOIT19LeDLICZ83/1im+yNibHRDmpQ=;
 b=UB5MpBnRawgIC/HMyhmKUPfjAqNw/qjPyDzek6udpiKKwxLLYmBomVLNVPrcLux9POEkEWJNjSAICqfUAu8nO0WelzoEdr11vOeV5Z95KcREDbBS0Cz3jjYbBBbbO6QTbr01D+GwNDUD6DjaqP+FED8vuXcmIxvcpuYQSNKQAgIzVqyY45rdSa60NisXF4DFZy/1lLKRC0iCqIQgtyT5j/UYFXCwZn4wQ5fYgMW3CNpeXcNErtw8uz8lr+pHS56x2TnYj6LiwOcHABz6eiq2k/FaIi4lQE7/IKIYuiYLKUyb9jWRO8dDNVJfW5ZWafcQDyb8mS6Q3TAe+VBei4EzUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7078.namprd11.prod.outlook.com (2603:10b6:303:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 14:23:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 14:23:13 +0000
Date: Fri, 1 Nov 2024 07:23:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Use the filelist from drm for ccs_mode
 change
Message-ID: <ZyTkb4P5nAr9eHh6@lstrano-desk.jf.intel.com>
References: <bl3ildwwdjswvvfpim4fgqdmlqvonccfbavdxymyxr4bdp53bn@xwd5njyqad4d>
 <ZwVS0eVGUaa8Z3v3@DUT025-TGLU.fm.intel.com>
 <l2a4np3y6htwcp7emufsrajyrozpmguwm4ucosbu2ne444jpwa@2ohs4dowlmr6>
 <ZwVq0JIEz64OhROM@DUT025-TGLU.fm.intel.com>
 <ZwVzOahncbCljo1f@DUT025-TGLU.fm.intel.com>
 <Zwe0bJJkKs3p-9Q8@bvivekan-mobl1>
 <qkxumw627jw4ukxsdywxhlzziub2324ydn43isdrp7yn5cfwta@vpipjndue5is>
 <Zwn+ZGwd4o9wNx8e@DUT025-TGLU.fm.intel.com>
 <7k7rfpbdy5ky3w3fzgg4vicrgooqdtnvhmh3fgpmgublqkhgsh@ek3j3leh2tt2>
 <i73d5dojgqd2kzwrrrh6xrbtnfkv3m3qwodp5lciql2sccsc4a@lv3fzsgquu4q>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <i73d5dojgqd2kzwrrrh6xrbtnfkv3m3qwodp5lciql2sccsc4a@lv3fzsgquu4q>
X-ClientProxiedBy: MW4PR04CA0227.namprd04.prod.outlook.com
 (2603:10b6:303:87::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: ba94731b-8dc1-431c-2ff0-08dcfa80b836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5sGZAtpYf8lcs2B+IYm2TCjGmfaCMJA1Dts5EWpiN3g9hR/oLTETAFe7DjOM?=
 =?us-ascii?Q?Ptc5Dvv8H5To8ixQuDm6nG8oqCrABbgrjCl0g5txi0GSooqMUU5ou8wkmoV/?=
 =?us-ascii?Q?SVXxKBdkPTRJtiSbpGjUh1xJ+xL5wIkn1PejETTC82s0kt8VWkfwcERr0qB3?=
 =?us-ascii?Q?PnbCkjiZ72uUAngR5F9TOQADEq4CJ7Kt2HkP79YlcmL9lqa9n1axXmHxwCIB?=
 =?us-ascii?Q?r1Ie9iHZFpUWgT/UJQeBPCXskvRNdlQSpb4rTGeQqwhfb9QoCqnRE4cT/bIy?=
 =?us-ascii?Q?2vyW16GqtfIpkGvOIzEKSDg/zDheN2ebj4EFhJbZVROyeuy0VnkAC3tXwF0O?=
 =?us-ascii?Q?pf75ScWtnN0M+C3JgtDjYDjCRepMjio7lM3sFm3mbQOUauh8m/YisxwJWUVR?=
 =?us-ascii?Q?AH5/pPp0jh0tDR4buKsk/4pw1OumycApFr42r59s9jJ0pV/qfPu475GpNg+U?=
 =?us-ascii?Q?/ZvWlCfFuFXijl+ZbdRJHSZufaklAqY58BTk+44HA+qIe2xsOCHRGlvTWtlB?=
 =?us-ascii?Q?2b4imX0sxjDToAYjj4fwbvkfuSHl92runtjMnvYqmgx3n5jvzjZ8xanDGBq7?=
 =?us-ascii?Q?Zq6s7CElYdNERrzCdM4bMBlDHWRnJom4yWbH933rgoCUtb+QRSRRzwiKXrqq?=
 =?us-ascii?Q?NVnxYFlUqTiqaIIx723U9Y9r6vw6ReFftpIRTvsHfm4iENkOxOV50VyZga9G?=
 =?us-ascii?Q?NxaVlWVNy4FzyPzYqYRbbnxBfksuL8VruzyhfJIPEtmjqKd/MIiFvBnmCEw9?=
 =?us-ascii?Q?kMvr6cG9YWIY4TmtVxrMaVMV6RQvjrjjEJsdpEvQFJ1cTQOtwUYUUfKySrjS?=
 =?us-ascii?Q?zC3LUQw6CdiqQn7Ex64DWxVVdIjLX8+GmJk8rApfj/WVMPvJ9Py+NesHyby9?=
 =?us-ascii?Q?sK+aTvV6srwFj8zCherue6qypjVo6BOfx6RxjaMIbNkKFHFs6Mv7MEfrBU60?=
 =?us-ascii?Q?cmV6ft7F+aXSEHYcUCKcpeH+6DOqsxhU0uvVK01rSnq5jLWHKJeYomzM+g+i?=
 =?us-ascii?Q?lCcCSkity+0WjZeBwSrHWMKM1Q+X8AC9wxelRIAhiD++38mgHo4BH4IFQp6K?=
 =?us-ascii?Q?+m3+Tbr3C0xexhmCGC45vf5aUpV80rui2g+X1lPjpxNt+PfR1NEZjmj00ksh?=
 =?us-ascii?Q?FTN1o+66DRGD1MmkRhdG5GoG2T9LTaWWEtRezkguTiX/8D2XTOm1usLmPxCc?=
 =?us-ascii?Q?JALY/vaHquKAeaMYs6sCxNKgymNqB13/ieWVXOZY38KxX/Hk3pHo1b0gkdpM?=
 =?us-ascii?Q?zAntNQv3aYAUHy02MqLoLOJXWfxRTHcWEO6vBZenSzBhnNNY6ohsbPOsFyqw?=
 =?us-ascii?Q?nl3RBZbofzJzS4g2KiJpC2eu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W2xAY1Uif9IQa8G2ERKdcUzmcEQRUW4ZY68qofMh5qQIrszxKpWc9Wd/4UXm?=
 =?us-ascii?Q?bmjk+C1Fqe5BMI4Jxkw2Cx2uabZZQyaOfaesfejy/pbYq3WuBwYIud2pwYOx?=
 =?us-ascii?Q?RO9Q21rWESa5oFELRriYZ6pGfjiaYjfbtjsh2boxzzPw3tbSwU9sL/b/lQ9U?=
 =?us-ascii?Q?pK9G+MQblQxOxRXGPJy+QF3ks7WoHPhtV6jaQenIU4P0yHmaNFuUXu7Hkktn?=
 =?us-ascii?Q?oC126KjRQZTeEV8smitCJxHdPxi94IYJVV0vuGXfQYHKJ38dnuaBkubEU2rY?=
 =?us-ascii?Q?BJWezUypbHGsOlkK954NCG+y88vGEDLwl0BjZQZLsh3wGNuChsZ3jJLC+UhX?=
 =?us-ascii?Q?Em5XBs6O80OBWMo413wp582DZ9mH0vFhJZIhTEq1Rz6SGuMPUmvkctrRxZ4u?=
 =?us-ascii?Q?744BywERjxn2o/7pqK9WiWqvOH0tXkbxw0gcAoDbHAfoh5FmgQ9F2ckl3zUE?=
 =?us-ascii?Q?+DRwQt4/U2OhabySPlkkKmqgDmOQbu7XmRY2Amtf9JmHMw7/tFaxGKSguUx4?=
 =?us-ascii?Q?wDT5rBm2Fwd7k8DxhOGBs0goMisg5UfA5bjJev0BLcFpPOs9YORc8VHSUUX6?=
 =?us-ascii?Q?cfeYiqIyPfpbLrVuTsW7hEyLcHrZtPSuhluZtaSRdk309OM7sAGfE1FVmYJn?=
 =?us-ascii?Q?NP0u7qWgFwAUWzODl5OUfTwLLjiaRYDMn42AQeXFxXn43JH6ZWM9ad3Zkeun?=
 =?us-ascii?Q?nOPyQiPqR90rxHCnaIfBRTrP+p8LsKAA2HB/UGO7K5JpRsBfKIR34iSwEcdB?=
 =?us-ascii?Q?TdXSyql6xC7uIXRIiL8pxIha54sFTO2cSazkDBwrjdnlotx+Zzk/DvXf5mjq?=
 =?us-ascii?Q?YCrdPdkygpvxxSVUXmU0TleHdj7EZnPhSdHEwbtRpywHKLZStKx6qsDb01Wu?=
 =?us-ascii?Q?96Hdg1kPn86Vawm3oZZHE2j+zTxE3l3J7ksbepTIb2YhHfFP1mMM2zVZdg/E?=
 =?us-ascii?Q?C22ncuZXXsnS8j87e9CNtDNDoZveIA6v065AX6DFD/UTmCopOzS3YY9aUizv?=
 =?us-ascii?Q?2WEkapcWOHxOh6Yw7F9jzFsva4VTQs18pS6YKnwNUmT0eM8BHLiDzShG+7Py?=
 =?us-ascii?Q?jH/fk1FHKUmu5lp8vqISHgFddJt8UzmfTBicKSrK8ZVd6kXtDIg4DXnGIkBk?=
 =?us-ascii?Q?EPVW5WnvStAH2eOoZcp1PNsFM6KnQklwWumRxq3gWeqUFZHxu7oPe2QSLS8X?=
 =?us-ascii?Q?Kh8pBo8FUCjlre84lHRqjMV5bxkO91cwAAyAUy9Z3u457xebOIeZREtUkt+U?=
 =?us-ascii?Q?n6BT+2W82GztCqc/rLEp+PTbIXsaCBYPQpR+GVt+xMnLQGTYom2c48xiQ30K?=
 =?us-ascii?Q?Gs97eaRXVpw4hvjeqb7m55AYsjtnGcRWa19lnuVXNh4so3NzI1cYTyppKRDo?=
 =?us-ascii?Q?0Yx65pVZ8q+1zl3lmYYYHCumPwbqptCwwJO/BTmEk2C1rst2xHBo8WLNSATy?=
 =?us-ascii?Q?E2ZJkbKjpzpiaTI4JTN8pPK8wXum85DZpzvBeZt4bPuUOr81KBxDt8jiqTze?=
 =?us-ascii?Q?AQlj1bJrxXAtumPNC67fLSbeiYKFVNOb7vCzO3xd9jJ1DhTykK2ZEUy0mpLr?=
 =?us-ascii?Q?Z1I3FHUqCvwwa5UZe+E4dV/QbJEkt/xWwoYOmLct2jjl7INs8tYza2gkTue/?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba94731b-8dc1-431c-2ff0-08dcfa80b836
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 14:23:13.5000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fU4j+vh2jv7T+ISArVd14Cs0bzjHaMcq0/ASXlQUOdY0wjz18AY76z7lVGdlxR+OssW5LzkLVyo9lCExJO5ycA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7078
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

On Fri, Nov 01, 2024 at 08:11:05AM -0500, Lucas De Marchi wrote:
> On Sat, Oct 12, 2024 at 06:45:57PM -0500, Lucas De Marchi wrote:
> > It looks like I forgot to Cc, so let's try again.
> > 
> > Lucas De Marchi
> > 
> > On Sat, Oct 12, 2024 at 04:43:16AM +0000, Matthew Brost wrote:
> > > On Thu, Oct 10, 2024 at 11:02:56AM -0500, Lucas De Marchi wrote:
> > > > On Thu, Oct 10, 2024 at 04:33:08PM +0530, Vivekanandan, Balasubramani wrote:
> > > > > On 08.10.2024 18:00, Matthew Brost wrote:
> > > > > > On Tue, Oct 08, 2024 at 05:24:32PM +0000, Matthew Brost wrote:
> > > > > > > On Tue, Oct 08, 2024 at 11:55:03AM -0500, Lucas De Marchi wrote:
> > > > > > > > On Tue, Oct 08, 2024 at 03:42:09PM +0000, Matthew Brost wrote:
> > > > > > > > > On Tue, Oct 08, 2024 at 10:20:15AM -0500, Lucas De Marchi wrote:
> > > > > > > > > > On Tue, Oct 08, 2024 at 02:54:19PM +0000, Matthew Brost wrote:
> > > > > > > > > > > On Tue, Oct 08, 2024 at 01:06:28PM +0530, Balasubramani Vivekanandan wrote:
> > > > > > > > > > > > Drop the exclusive client count tracking and use the filelist from the
> > > > > > > > > > > > drm to track the active clients. This also ensures the clients created
> > > > > > > > > > > > internally by the driver won't block changing the ccs mode.
> > > > > > > > > > > >
> > > > > > > > > > > > Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
> > > > > > > > > > >
> > > > > > > > > > > Is this really fixing anything. As far as I can tell nothing upstream
> > > > > > > > > > > opens a file internally (i.e. xe_file_open) is never called directly.
> > > > > > > > > >
> > > > > > > > > > should fix this case:
> > > > > > > > > >
> > > > > > > > > > 	open()
> > > > > > > > > > 	close()
> > > > > > > > > > 			<---- race here
> > > > > > > > > > 	change_ccs_mode()
> > > > > > > > > >
> > > > > > > > > > because the close is not completely sync - the cleanup where the
> > > > > > > > > > previous number of clients is decremented is executed too late and
> > > > > > > > > > subject to a race fixed here.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Ah, ok. But then IMO just move the clients.count decrement to
> > > > > > > > > xe_file_close. I try to preach solid locking / layering and this seems
> > > > > > > > > to go against this idea.
> > > > > > > >
> > > > > > > > why do you want to track the exact same thing in 2 ways, one in drm and
> > > > > > > > the other in xe? "Are there clients connected?" is something drm_file
> > > > > > > > answer and doesn't need to be duplicated in the individual drivers.
> > > > > > > >
> > > > > > >
> > > > > > > Well layering, making assumptions about the file list means, and not
> > > > > > > randomly deciding what we can and can't do with locks we don't own.
> > > > > > >
> > > > > >
> > > > > > I looked at this a bit more, if we want to do it this way then I think
> > > > > > at a minimum we need a drm helper for this.
> > > > > >
> > > > > > e.g.,
> > > > > >
> > > > > > bool drm_device_user_clients_open(struct drm_device *dev)
> > > > > > {
> > > > > > 	lockdep_assert(&dev->filelist_mutex);
> > > > > >
> > > > > > 	return !!list_empty(&dev->filelist);
> > > > > > }
> > > > > 
> > > > > Still the driver would be required to use the filelist_mutex outside the
> > > > > drm layer. So will not solve the layering problem completely.
> > > > > Otherwise we can define two helper functions in drm, the first one would
> > > > > check there are no open files and returns true holding the mutex.
> > > > > The second function can be used to release the mutex.
> > > > > Does it sound too invasive?
> > > 
> > > I'd say helper to acquire / release the file lock indicating it is ok
> > > for other layers to use the lock. Then add helpers with annotaions (like
> > > my example) for internal access to that layer. Maybe a bit much, I find
> > > myself writing code in this style these days.
> > > 
> > > > 
> > > > yes, and I'd rather prefer not adding these helpers.  If someone wants
> > > > to add helpers later and convert the current use cases, that's a
> > > > cleanup/refactor that can be done on top. For me, these helpers are not
> > > > really helping.
> > > > 
> > > > Rodrigo / Thomas, any thought?
> > > 
> > > Another opinion would be good. I know this seems a bit pedantic but
> > > locking is about the most important thing a driver and certainly the
> > > most difficult to unwind is we do it incorrectly.
> 
> I chatted with Thomas today regarding this. He is also of the opinion
> that it'd be better to have wrappers in the drm layer. However since
> there are already users, it's ok to add this as is and prep a conversion
> on top.
> 
> From a quick look, we'd need to add:
> 
> 	drm_device_user_clients_lock()
> 	drm_device_user_clients_lock_interruptible()
> 	drm_device_user_clients_unlock()
> 	drm_device_user_clients_empty_locked()
> 	drm_device_user_clients_empty()
> 

This seem reasonsible and makes it clear drivers how drivers can use these.

> and discuss it in dri-devel to convert the current users. Maybe we will
> also need some renames or doc updates since drm_device has:
> 
> 	filelist, protected by filelist_mutex
> 	filelist_internal, protected by filelist_mutex
> 	clientlist, clientlist_mutex
>

Some doc updates would be good.
 
> which would point to actually add the helpers as
> drm_device_filelist_* rather than user_clients
>
> 
> For now, applied both patches to drm-xe-next.
>

Thanks for following up here. Will be on the lookup for dridevel patches.

Matt

> 
> Lucas De Marchi
> 
> > > 
> > > Matt
> > > 
> > > > 
> > > > Lucas De Marchi
> > > > 
> > > > > 
> > > > > Regards,
> > > > > Bala
> > > > > 
> > > > > >
> > > > > > Matt
> > > > > >
> > > > > > > > At least it's also used for similar reasons in amdgpu and vmwgfx:
> > > > > > > >
> > > > > > > > $ git grep -l -e "->filelist" -- drivers/gpu/drm/
> > > > > > > > drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > > > > > > drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > > > > > > drivers/gpu/drm/drm_client.c
> > > > > > > > drivers/gpu/drm/drm_debugfs.c
> > > > > > > > drivers/gpu/drm/drm_drv.c
> > > > > > > > drivers/gpu/drm/drm_file.c
> > > > > > > > drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> > > > > > > >
> > > > > > >
> > > > > > > The AMD / VMWGFX usage certainly looks wrong to me. If the file list was
> > > > > > > meant to be traversed by drivers there should be an exported iterator
> > > > > > > IMO.
> > > > > > >
> > > > > > > Matt
> > > > > > >
> > > > > > > >
> > > > > > > > Lucas De Marchi

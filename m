Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E64CCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 14:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4457410E92A;
	Fri,  3 Oct 2025 14:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izUPiAWI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD1C10E92A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759501302; x=1791037302;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9LU/6e6rKNNXV2wj1BFY6kXyfXx91IgWjgetC+TDdeE=;
 b=izUPiAWILa9GIqW4A5eIMNl4lacZMgrMEq38Mzk628xKfqJObYTAuNW8
 WbSLC8lqBRDzstIZu7MwGswD9BBn2+EVASGbJlwouhL2ICW4U7MR7SPIw
 D+ZMjB0ZkCz5tpTAQHriHxxaijQ/5QaDQrM8S/Q5G2uBf4QAc9/18qQTi
 XlUb5QG8qJYlfUB6YWo3oE3tk8czm/WneMKiWCLNZuYSi97Odzl1OhKUJ
 z+c0qHRDiyD3tMFgl85rXfL42LrYtd82GUEFnhGWkzzqqt7nQBSiEUOK2
 mvZriajWKLSGSO47a1HHWHUz5mGD0OIuiBPe2I6qjxBAspe8djEBxvOIU w==;
X-CSE-ConnectionGUID: G19s0LnFSYGQexXnqbMC2Q==
X-CSE-MsgGUID: T0/2liLBTgiuMjG9OWeDGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61947843"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="61947843"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:21:41 -0700
X-CSE-ConnectionGUID: G8w3O/GnTlqwrozZ1+bFGA==
X-CSE-MsgGUID: HACWaHoaSGilbS8L0a58sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="184588905"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:21:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 07:21:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 07:21:36 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 07:21:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOdQSsGePx0sMvTqChWoSSmsHq4dMLM4oE/UasmlJOEhk28kJZeF5ZAvI3VJvL8u0MnH2Px+Ib+d0WVk0QvUnvt2Ig24dxR6QgZpNVjJD6xw9fPHaGyzSeJrCIpaJxg7G2+utwjZF+glF3PuMQvOM60PXgxLMaAr57zbo+kViLdYL6XCNI6rP64Amc6YSEdXWZHFM/35rPIYEJQL4rcWTIZH8/FqHmlytDl0l59nGJu0mgGfQaGdaioYW2b7ccPQwz0gl+K90dL++Dwh9kNtZg0nc6mRpSngTn4hKore52FnLJjfgw4lOzvSal3nSchX84TCLrXnAkuocKRbWcX+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzhQV2UaxIo9X3BO1qKo4DB+deThJ9i6j2Brqv3/tmE=;
 b=SNVp0ZH8PsDBfzG693xj/VHENIlgqHdt/H6Olf9ZMhx2Ao5fNzK6zS7RDQSiYCrWFLDOQITG1lUoia6GVic8LCkobWpq1bi09ZGxqmZ0G2W3F3DFPeIyJVuzzyNCvVbVvfzAFc5TSEobOkx0mIc4gFKmOkFELAIFZu2xdks6UCFrvJB9RMoZulGsSKz3qy9SpB0HS1sNAZrvJBn4Ev5uMXNir6AEXkP1IUXFPD8z7UTOVVYh/h0HOGRZDZrjtDaQYyyG4vOaIixQojFSjkPm5kbsih4EtF+n4gUvjDlkLT1FKCTxAo3JoIlabxxRlNc33WZRjNA04Mder8d/72l7bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7826.namprd11.prod.outlook.com (2603:10b6:930:76::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 14:21:31 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.018; Fri, 3 Oct 2025
 14:21:31 +0000
Date: Fri, 3 Oct 2025 10:21:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <lucas.demarchi@intel.com>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
Subject: Re: [PATCH] drm/xe/xe_late_bind_fw: Initialize uval variable in
 xe_late_bind_fw_num_fans()
Message-ID: <aN_b5jVrLajE-0Z7@intel.com>
References: <20251002005648.3185636-1-mallesh.koujalagi@intel.com>
 <aN6Hy6JZRq-vi08T@intel.com>
 <39c6b59c-1427-4fc0-8440-ac75945bfc59@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <39c6b59c-1427-4fc0-8440-ac75945bfc59@intel.com>
X-ClientProxiedBy: SJ0PR13CA0096.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb61d97-0faa-4986-5b54-08de02882601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PpUxUGpXXhHQBuZQJLctogskUgDXbvTOLMz9lBWPp5lIsJSQCfU2Z6ZcYE0e?=
 =?us-ascii?Q?q2MOGjYp9fOgddeuAIp9yMx230kQGfIyo6X6BHkLv3V5g+APnnysbFEGzupi?=
 =?us-ascii?Q?8umuu9VIUVpqmXfnP4cynbrOtfg7hma1eiMxqHXmj/wDkOhk9sfmAgHkFHJE?=
 =?us-ascii?Q?Lmlqn9uYSytUSVTSmukdU79pAyHMeFSmWbRQbeIztOVXFFtwoEMduItuiZOb?=
 =?us-ascii?Q?J3pSXF+hXcJqY6ZUMMpRsNxFvzkRHQgg6SB5ooLJem7LTIkEgk7St7L0s72u?=
 =?us-ascii?Q?7gvXAWPtJtom5iA/JnE24ygQLDSVJYsZKUh/HKljGmzF+U3YGLo6mxLl2Z9/?=
 =?us-ascii?Q?54zU3MvfvVd/QSi+KzcUrMBIx0XejxxENPMXmcDHsmnpAtAPydMQoSBvIORX?=
 =?us-ascii?Q?uN5bc1ydOo+KmCy6xtIDikDbXPJwFUiJITnQ1Bc0UfAJFdJcjfnsre1gN4En?=
 =?us-ascii?Q?/CFXXlbZslV8jaRfHk/B56oaJVv5Q4yUDoGXLyDHxcOi+SO0rXPaj0gjWP/K?=
 =?us-ascii?Q?/A/9o7Q0yB3bdWYdFQ+r0dJGBntLcHnxgJ3vIr1zaeCQnVlfPArBrl2Gc37b?=
 =?us-ascii?Q?nR28WxOYVrGsoyMLmN3LosIbR1fM0LulUbLlFoqQpslhcj/jbDKFG+ucnOfs?=
 =?us-ascii?Q?4ObS7A5bqLv4FNpGp36c55+ySO39qBDXHmlfR1KmHHogMgk3KTZNV1tx3cSE?=
 =?us-ascii?Q?1hyI6eAYK/0rBNZcK6BecX4KL7q9+ayI4O/KQJb4kQVGDmPSyEUDWOqSCtmG?=
 =?us-ascii?Q?/dZjMEA/L9x1dND4Ul8ukqpiRzHI/COjH1u036LY79kiK1cOC69h9elIHKnX?=
 =?us-ascii?Q?qOWetf56OckEXjJ639JagVLMH9AUReU42loiBjOboxx+Y0vKJJAURfn7hdtA?=
 =?us-ascii?Q?sJVRyZR+LKN0FI4A5nTLQmJvezE2N9/PQeOIvUOT2jWjwaIfg+4oo8U0Ju9M?=
 =?us-ascii?Q?XcTpuhJj2ZvlG2FSTel5NhO0EL0zSGQK+X4DEsfOtnfDoTF13gyO+9Y5U8Bx?=
 =?us-ascii?Q?djoUCUFYalpb/RID6EP2beZp3WBSd1IgsaFIjPBVNWjf6NwgiDrSMXr1RPoQ?=
 =?us-ascii?Q?GATjvx/m3Lw2m5xHXeG8YlBbV4+OKDusVNr8+ujWT4PrF1i1euFcpP/7Tb96?=
 =?us-ascii?Q?nuCyxWyIg2w2v6oYmEFYgj9iDn5iXLK/IoOZRQjlg3cGESSkOPoPrtpHnTBv?=
 =?us-ascii?Q?U4+xqwVAxn4U9ZXz7uu7sRE1BsRlgDik7+6Df7WlHxWPKBSgu/6xHj93SG5O?=
 =?us-ascii?Q?ixg942OrP4Rv8jaO9gJ4WiprpwvL5BS01Bi0RmxXDRrZIwG2FCtdPJhCi2wJ?=
 =?us-ascii?Q?hYfDGDQdGODowPoCFjEE+tXfVIeyzAAnHIiutQHOPH+TvaAHBOoPBDWgKA8Z?=
 =?us-ascii?Q?Pu7koQQv+N9LGX/FE8WzWlI+5wkYjHhah4EnZeX9ZP83OWnee3E8JsD0ZYsl?=
 =?us-ascii?Q?Gm/ul8ZWCNPxr+r1Ndlim+mOp3HksCt8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TS86vb+VzNUq8XUGs4YAZdm7Rj9ryNPWEGTDJplgcyl0B8ARE2TbVOnALax5?=
 =?us-ascii?Q?clund2B/F4beJf+xTG1fC4558cOYnzKuU8pywTx9n5n3iLM9nvTVlxCoMMLO?=
 =?us-ascii?Q?NxIoAC+CfdZg3eQ7i4UttAahRZOjUn7P7KXelAQG4j98ylRY9yAxYMYN/2rt?=
 =?us-ascii?Q?Obb0KyV6F0H3OIyMAoIYrggeBHfJcDmqPWxDVzo9l5AYIGA3BTVfrwofQiVT?=
 =?us-ascii?Q?7clvl2ZQqob1wKcc+oYcHK5SNxqSI6DSFT19+Ltk2y+ueyUsJcnrcH6JJpiA?=
 =?us-ascii?Q?+ueT7gjm3FE/Gh1lsy8QzoG5aQVUXwNe4bCAF7OihxKPFK4/9JZtZ/pXnXLq?=
 =?us-ascii?Q?5XRq5ZldCM4xvIA8ixAXe0h44+axqkdGG9cxFEaeyfP2MZywZZaACCoQJSmF?=
 =?us-ascii?Q?mBEBuHtDWzZCeVf+znejhl7hcCNUC4kQrPwbUAcU1yJb1DGdCgHXl4nxBTeW?=
 =?us-ascii?Q?OdfxDO8L/M+K1La6/AjE8/+4iXRxConywGKrkvAYAvVbxzTsx8lXHV25FsBD?=
 =?us-ascii?Q?PKdafrFV9HgEOqqG3hBMtNLnpVXIuiTXTtZdh2BthR2/K8cf1p6vVNaw8Nsx?=
 =?us-ascii?Q?9mKlLtX+J1qoL64ivyX5tHhRGboNy5Pl08yCe+3YmB1uV7U3lYuD5xAhL4RS?=
 =?us-ascii?Q?8g8oIGd7QcQLz/vik7VPjOmpp3gd7NzBzX1MwDitTBIpz1YAMEwIPYTbVbPB?=
 =?us-ascii?Q?WhHN17ErTUQx8KuzufZ69ORLZnvWSZGFPnNq+nG6O0ffMbTpAqhuDmo46xqJ?=
 =?us-ascii?Q?4pTECKt6FXHlOuX1psREg4yngNmamj/ivImyY1H8Ru9JO6A1y/uWVfjMtmIQ?=
 =?us-ascii?Q?YpOuhE40c2WxMzhiWTdwO7MeT3SM27KyugoAkXBj2+ChCty78pwDo1jB1Ohw?=
 =?us-ascii?Q?Nv/d4GXOer+CSdnyfEeH9Ypm8dT/cJkbSEJWIqzJaFrU/r/Qt/EmSBoljW8e?=
 =?us-ascii?Q?JvfaFMY3mgsA7pn39XgWdMKbCkiwoizK3awzcdSsIVpPTYlQld8hv+39BWh/?=
 =?us-ascii?Q?/MLofyYJ3yN076Px9hlhLNQbgLZXjgwn+485cOCPO+5ujXDesrsVtYGe+Ykn?=
 =?us-ascii?Q?/sZHzGBCpDh+2Mm+M9sB06sNsc+3j7vmAoL9nFxNGxpQPN9OV/M+SKExPDmE?=
 =?us-ascii?Q?y4xSzGUmk6YDbuqHfGhVOTPXPL9U4U+viUTFuqR3ev1+aQY0QTwnkKn4lqp7?=
 =?us-ascii?Q?ffwog9sS2kzOIipvznO8wWlRzT7jWsLZtkI7WFhkbzUwIfyVyL+mQ4sb5iOi?=
 =?us-ascii?Q?qn5R3N3CsXc6DT2Lo8AvFCGgygGpwuIOz52Ux29hlulmntiC6vAjiZSTywQ6?=
 =?us-ascii?Q?EWpebo9L+/gS/MA6KPNomj8ygI0iDbhyw5yPs7QSzB2VDsTLNl/qoPAs/gcv?=
 =?us-ascii?Q?TY0H/3grkVxQJOyOxKekSdPmCgTRAKNgGXbBhKQy7mRurOKwMUYVGz3m2Npv?=
 =?us-ascii?Q?YwYPUnFirjkWQdaY23Ofsd0dLlt/z+beZ/xdJxYxZdCfl1fEMfs9ufJuS6TM?=
 =?us-ascii?Q?/Wpp+jD+f27wZ0/wSz+S6OSshODmCuUy/o764x3p8u4U5uWhRXD9MEtFETLD?=
 =?us-ascii?Q?S+ho0w3mC+n7ISYeWKQuGae+Pvl4QgIN6grLyeHj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb61d97-0faa-4986-5b54-08de02882601
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 14:21:31.2693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvP97h0agnkIAYMyReyhZ+ya+MBhvsfoWqBrcmhVL9lA/8Waqcriel83BhSAEGz9V1zewyPy0LCLHL0/+Of+DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7826
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

On Fri, Oct 03, 2025 at 04:46:57PM +0530, Nilawar, Badal wrote:
> 
> On 02-10-2025 19:40, Rodrigo Vivi wrote:
> > On Thu, Oct 02, 2025 at 06:26:48AM +0530, mallesh.koujalagi@intel.com wrote:
> > > From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> > > 
> > > Initialize the uval variable to 0 in xe_late_bind_fw_num_fans() to fix
> > > a potential use of uninitialized variable warning and ensure predictable
> > > behavior.
> > > 
> > > The variable is passed by reference to xe_pcode_read() which should
> > > populate it on success, but initializing it to 0 provides a safe
> > > default value and follows kernel coding best practices.
> > > 
> > > v2:
> > > - uval = 0 which serves as both a safe default and the fallback
> > >    value when the pcode read operation fails.
> > > 
> > > v3:
> > > - Handle MMIO failure (Rodrigo)
> > > - The function should probably return the error and make the uval as
> > >    pointer-argument, like the pcode_read.
> > > - Change the caller of this function to propagate the error
> > >    upwards if mmio failed.
> > > 
> > > Fixes: 45832bf9c10f3 ("drm/xe/xe_late_bind_fw: Initialize late binding firmware")
> > > Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > and pushing soon
> 
> Is it pushed? The patch is no more using uval as title suggest.

doh! my bad.

It is still about fixing the uninitialized uval, but it should had been changed indeed.
too late now that we have many patches on top already.

> 
> Thanks,
> Badal
> 
> > 
> > > ---
> > >   drivers/gpu/drm/xe/xe_late_bind_fw.c | 16 ++++++++--------
> > >   1 file changed, 8 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > > index 8f5082e689dc..768442ca7da6 100644
> > > --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > > +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > > @@ -184,17 +184,13 @@ static const char *xe_late_bind_parse_status(uint32_t status)
> > >   	}
> > >   }
> > > -static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
> > > +static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind, u32 *num_fans)
> > >   {
> > >   	struct xe_device *xe = late_bind_to_xe(late_bind);
> > >   	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > > -	u32 uval;
> > > -	if (!xe_pcode_read(root_tile,
> > > -			   PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL))
> > > -		return uval;
> > > -	else
> > > -		return 0;
> > > +	return xe_pcode_read(root_tile,
> > > +			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), num_fans, NULL);
> > >   }
> > >   void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
> > > @@ -314,7 +310,11 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
> > >   	lb_fw->flags &= ~INTEL_LB_FLAG_IS_PERSISTENT;
> > >   	if (lb_fw->type == INTEL_LB_TYPE_FAN_CONTROL) {
> > > -		num_fans = xe_late_bind_fw_num_fans(late_bind);
> > > +		ret = xe_late_bind_fw_num_fans(late_bind, &num_fans);
> > > +		if (ret) {
> > > +			drm_dbg(&xe->drm, "Failed to read number of fans: %d\n", ret);
> > > +			return 0; /* Not a fatal error, continue without fan control */
> > > +		}
> > >   		drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
> > >   		if (!num_fans)
> > >   			return 0;
> > > -- 
> > > 2.43.0
> > > 

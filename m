Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9FDCEFC24
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 15:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5282610E235;
	Tue,  8 Oct 2024 15:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BASdfCNl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2249C10E235
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728400831; x=1759936831;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SZAdHeoA5T0on/lnQTgDWF2B7OHR4l9AQKh5FA3zljU=;
 b=BASdfCNl4CIlQuoguAm/e4WIKDJlsLgfya7p9MmM7nmLPiC4o0ixUGC2
 NELuUzFXws66MCfEya03jIEdCS5wmJqiwN4qFIs4sBj8YsEYlB7BAYwpj
 fGEB7pIWTrVH8zZc72K7voFz+lRKnfV36UQZPlvgQJ9Kdn5JUWPGU6tcn
 YAdI5eZ806GUPQPJ0E3im2XWWxBn4Bvj6CWVDx/7upXlY7CuWBFb0NZgm
 idJFgCu2+biG4NMA4Jai0vYnq8+0nKzXlMfvyAV+NF4l6paIPt6R+m40n
 In7OZAFsPZ1nK+3FBss2HGhb9JbGNwelEINnOVKhW1FsUO0j5qbTTSrgp w==;
X-CSE-ConnectionGUID: w64jeaHUT1ilbRg4TR7Q9Q==
X-CSE-MsgGUID: 1Pel59HXSsidwHG7Bt1+bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27420574"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27420574"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 08:20:25 -0700
X-CSE-ConnectionGUID: aMDFxuKeQc+QT3hHi9D4BQ==
X-CSE-MsgGUID: Vg6xOs/wRACJXHtKtMem3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="113352685"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 08:20:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 08:20:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 08:20:21 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 08:20:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFDTfFCyFH3qyd2wkeTYvyis3zFB1+m6JhA30KbeqTL5CGTRXa/4mGC7RN1T7lw9XqXbRtL2+dY6D893uYxlxGfwZbEHLOo5NrJhLHEgbUxJ8TQU6vcYkXmLYd2UBqJ31sHJJ4faxIwV5dZ10YTZzInPHJMqU1rZtFYZVkIYkQ7peKjjx0bKH20XwVObblFJaUOWhEQTlZi5BGangJupmKYfjpHnoptf4aCbne3zWqqKqIT+Ug+PaYQs3tAVC/BwKQZFGumXmziCe3tOHMCEicPKqMDgS44Q3QZyyU70ZKq1cmjAb/qnjbd6M/S+P32XqzYK/Dc0UjWAv8UMVBSROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXAC9Pxynu4zrMdJmtBw4bew6AuQI7fVzzpp4ELPDNo=;
 b=AzZkrcwt2eoqZJjnNnDO9hHRNXugrtjOwTNZ8aSxofdL3AKrkbngPrbF2r0+CMPxkxW/8wQrFO5WUN/FWjr9uG8auu1j9dY9U7tfw96JqyUKeYHVgpekUf9WUz1HXViqK823LcJR8jF6JWEkglI11jEEgBhy9JtfHOEqKhNvSt4gWCT6L2qEEc0Bi42CqGVtyUr7qK+VAVPyweN/n4ACuVx1tUeFqdGjmgJ0fWoiVO4nGsfHKTz2W2LwuxiaKoMwsP0SWtK3Wc+Ac+qcdhyRji8+9Z+QGpU7vjOU/gDgnm7SKHdtdc4G8mXeiWMpCZOSaFdYOi4tCi3TPa8TyDp7mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7812.namprd11.prod.outlook.com (2603:10b6:208:3f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 15:20:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 15:20:18 +0000
Date: Tue, 8 Oct 2024 10:20:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Use the filelist from drm for ccs_mode
 change
Message-ID: <bl3ildwwdjswvvfpim4fgqdmlqvonccfbavdxymyxr4bdp53bn@xwd5njyqad4d>
References: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
 <20241008073628.377433-3-balasubramani.vivekanandan@intel.com>
 <ZwVHmw8KPluuPgvC@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZwVHmw8KPluuPgvC@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:303:16d::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: ec71de44-2cbe-437f-0645-08dce7acb7c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bywczBjHP2PZWwXeX4+K0vQYnxblCbTubKvI1VSQmGo+RSLNaIOCIatwdJo+?=
 =?us-ascii?Q?+e+8eA1/5PV3YelO5F9/3h0t95foRF93zIXaKTsqBlfDHOogq+CBlp29dRcN?=
 =?us-ascii?Q?NtMNALdQLTBbuYGW5q3XDn4DT8lQV/VvmXo6QM0X41Bmq7uIa/cktGrQ0fp3?=
 =?us-ascii?Q?mdrkcbNowH08LLNTsJwq15+A7sDF6QGS/avXVkFtC5ARCa+LI7mloz8Ej5ys?=
 =?us-ascii?Q?VACUy4MHV1Pg+Wm3HfGNhpdd2VnYslbEzE+BcksPEVoxMD3vDaImknL9sY6r?=
 =?us-ascii?Q?9bi7bFC0wy+8aESylvaVAuJ8z1KPkqnOPbA7AW6tC8Y5sDGZqIthFHqkwlSG?=
 =?us-ascii?Q?/tdF1GwPnHda4rmzKb6QcdnpheW8M2Y4oxeDRkmkg6rAshe9q+DeNr0QECWS?=
 =?us-ascii?Q?rTCbR/VEK2wa4i3aM7wziaxhIw9I255WMzyEI9pltFOc5XpSQgUMHvHci7+s?=
 =?us-ascii?Q?qXnlBiWfrWhch0SvDbWWaVhClCGjGBOSdtjoQABeY6HIgGkdGzR0S4ltrgT6?=
 =?us-ascii?Q?2UoUvKYXG6YcGQ9GEide9fl6iSjnn22VTSlxef8JBPZ+ni67hYq5QE0BZwHH?=
 =?us-ascii?Q?jfiIqdsGlQvEZjWqzHeUEUNzx51ECkn++oafkIHHkPbzGGhPguSdp9relbci?=
 =?us-ascii?Q?NCx3rEKNDbHjmJ7htUzwaDKdZsIZhJZkijnEBqTLg7CuBrgdXA42Avrv/7aD?=
 =?us-ascii?Q?FRmqEqVf6Q17Xdbrk5RJsrmMpRuwIKaQ8jX/iRpPuW92uyxZ3wEyXYqNXoUI?=
 =?us-ascii?Q?DgQkXNNTRmU7DERlb5GQkuovedSSxoZrC3O5z/kkX79GLaRRc/Llk+rBoqJt?=
 =?us-ascii?Q?VfVna4dG/piFObP1HcPaOFnwGuE+Jw0LgbLLRjJnzq8gk4SdwiGaAqyHoSJC?=
 =?us-ascii?Q?Ex5LmFDBwli8+sMluYKb9wsm7Q/oPwOpWRJ77W+e0ssVURiycq9MikCqL6NZ?=
 =?us-ascii?Q?11RDTL2C8lMlSjdE+B029ZiFtX/DeA4jG/VPX43RS2p39cEJlAkaRmofPVLO?=
 =?us-ascii?Q?PTs2bErOaDnSBKttS/kjdWc0v6acCM+dYwMyR7F3LZODjK019by2M8PDARHq?=
 =?us-ascii?Q?GKIyNe6LP6jC4LyCWfmpQNqJs4nIj/ZeyJdlSlQ251Dku62nNbnjE4D5h3Dn?=
 =?us-ascii?Q?YMN96JOJzf1ZWrtbparrTM//uv0tfW8uXR/6+ajajUJjQG7MuNJ9VBGWz2ab?=
 =?us-ascii?Q?fDUQr7umnb7A6fRxNbRHiVXt8EeXdpmCtWwV1AHGoSuKA8Tx9mv2dUHjWlbk?=
 =?us-ascii?Q?tVZLN+tU6mJIt4tuEUIEcHr66cS7WcKjPKrkgH1bzA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5FK1e/b8fMvy/mvkNaMJRve7GAUfuaD4I8obmiCJl9R8S649DoW9VvrmXUIS?=
 =?us-ascii?Q?cOsOt78cfSK1JvTg+colAmfcmD8bbGAmLPXbft99s5s5fNIzzFr0SR5/uS++?=
 =?us-ascii?Q?FXeCRkYa1MuIoCQff4/YxOI0ez8gDAs38c6o5rxm/Fe7sPgdt2iXNdHBdbk5?=
 =?us-ascii?Q?dydYW6bdm0KSlr5We7bi6sxTJhQ/UDNP7mHzdG3YE132FZRIe+4xEJ431zCC?=
 =?us-ascii?Q?xVD0lG/doFPOOU2dVb02xvpzqI4awpbrte30nsCQDA/GQ4GvHMajDQkNatEV?=
 =?us-ascii?Q?Xx4nd/V9UXmYpAKLzO5Nl4BrEmsbXpbUQ5HsUI4PbhJQjaUczeUhmJYB3XiN?=
 =?us-ascii?Q?frK1BGnAZD54K9KIg1cXrES0qq66dV97cAdJTWjvjSQ8vQfik+p9rhjdgCoF?=
 =?us-ascii?Q?juErQFlIMNIgWJgGtBujQNeoUvDmqbRr7TiSqLgusg+dIHyUUb12CRfzfiXT?=
 =?us-ascii?Q?LTU2hHUI4YTX+VtYkbsC6/OTFJdzp0H1rtolPrLCsiVt1aFWm8HPEay3+VKk?=
 =?us-ascii?Q?YcY+k7p799HP5lPenpJcVTeZi8uof9EPyq5rSq+7BFFdfPhcKGJo38VbGed/?=
 =?us-ascii?Q?MlLTvr3NZirvTon+LE0nCHFBBCQW06iUo9ek17dqv59SOUQetEkoDj8yBPkI?=
 =?us-ascii?Q?WgXPteh3Z5fc5fyafC9ei1Mcpik4q4co/ZtxEsRTF+jLiOmi/gEVZn3BopCO?=
 =?us-ascii?Q?+VEwWYNQuLl3Vca6jswP4kpYLZxDkW0TT3DTkyaxyIBJB55jTlglGvptvWZS?=
 =?us-ascii?Q?Y9iNuobeqAi1CEHMOx9vlGSF6T+HytP42Qd6v5oS8wOcRmvfSDhEc2xwGycL?=
 =?us-ascii?Q?fq2UvFXMAgkdra0uT3rl7rQWjHfLRsY+FaqgUTqklJH78Y8TDGBL5NJttGcz?=
 =?us-ascii?Q?N62NwJWoh5MBLdbexUjWiFzlN/N8Ag63jRikgdSYQ+lIdZyIvXswB0TAoBKI?=
 =?us-ascii?Q?OUf1TAiKLY0i0Dqmbyy261oQXYlkuqZuWheA8ewUXOJ8gCld9itM2u/fyo1q?=
 =?us-ascii?Q?aIYDlQ8nuyEjNcckgAqaESt5/hOGU7lYTqNh0dqEiS0f8XYOh9loni1d7IJ0?=
 =?us-ascii?Q?Ih90ahjn2X4mM4MK3LsgkPcmJL2fHwSMgnhxyqJISB7shWKtFhaNTsJz+HDz?=
 =?us-ascii?Q?4a7QtOLUZJNIbFejGzEUcu3/iolpyJDpxsEKw4IKnNkX/wVQu4m2VGfBScvd?=
 =?us-ascii?Q?+JVQbtbaM4lT4Rsc2gQUEJRkdXXjzd/YD90f0CxS/I5flElr4eZgpDuoCZrO?=
 =?us-ascii?Q?fI+sHwawen5Ji5iNZ6SLSvTmGO7nLbt+YBZBBXPmQ7qtINPimcMZesLb0tkR?=
 =?us-ascii?Q?6t/tA5HsYP30E1TdGm/MECBQ7I3hVCzFqFLK7YRkJu/hx53SdyONCCFEc3lQ?=
 =?us-ascii?Q?NS9OcFw22U/pbjZK1KteV3NQw7JBQk6201v4hLorl2SInSJn2VjCYJsOeMpz?=
 =?us-ascii?Q?xGREBlo9XSHmZSxaTiYgr6qShuVm7B7vB++FCuONUA29Mnuj+FSjRVncjRSN?=
 =?us-ascii?Q?anuK4eNp3j7hyG3yaKHukMZcKRco3yCcPtta++c2SzRES5XqLnSTzF9o3Rsm?=
 =?us-ascii?Q?lwTMIXxq5pLJQCjgQkrY9FGQ7OzWrR2EImRm3W+NERIYaUrOKkrXp82ggLnD?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec71de44-2cbe-437f-0645-08dce7acb7c3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 15:20:18.3913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXdaKiCmXR2mCXTXFCgiXBfagxQTFiEu6CElsuwQ6AX67OSgSWH1mCLVXAgpCGLo9YwsagUrLjfzu6AU/I74Ca3YqmMMFhS5x8V16MskEvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7812
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

On Tue, Oct 08, 2024 at 02:54:19PM +0000, Matthew Brost wrote:
>On Tue, Oct 08, 2024 at 01:06:28PM +0530, Balasubramani Vivekanandan wrote:
>> Drop the exclusive client count tracking and use the filelist from the
>> drm to track the active clients. This also ensures the clients created
>> internally by the driver won't block changing the ccs mode.
>>
>> Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
>
>Is this really fixing anything. As far as I can tell nothing upstream
>opens a file internally (i.e. xe_file_open) is never called directly.

should fix this case:

	open()
	close()
			<---- race here
	change_ccs_mode()

because the close is not completely sync - the cleanup where the
previous number of clients is decremented is executed too late and
subject to a race fixed here.

I think the commit message needs to be improved to detail this fix.
The fact that internal clients don't end up changing the drm.filelist
is just a justification for why this should be ok wrt internal clients.

Lucas De Marchi

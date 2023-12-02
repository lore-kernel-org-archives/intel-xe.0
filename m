Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24564C4167B
	for <intel-xe@archiver.kernel.org>; Sat,  2 Dec 2023 02:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AD810E06C;
	Sat,  2 Dec 2023 02:37:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813F110E06C
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Dec 2023 02:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701484665; x=1733020665;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z0FbAbnSnv1cghoK8LPPUaKNJh6ynvEEKccHCzoTegU=;
 b=oFGLcfHJBpciX0hZ2k+PJVGu2bVgrHQdM0aePc/0aT3jqMu+uvti6jGf
 KgwF5BtvJW/74EcMzGZhrWm/f6QwUPgfjwmszgKXNAEayoIVq1hkuc9uC
 KUYV6SX0M51kDCrSQG4/MHHqY1pCPar0iaV9L0N8yVFjwPxfkZHI6Y34S
 lymrkJmmEyTtAqx6duG7x3aUntilWyuVazn6UWX6giUx8wXwzC8De1jHS
 KhQI6gVFEkqmY9auCd200G+lXbF2qPr9tB8puyL0QI6kEz3vCSN067l4j
 5AJcfu3iJaTM/NwPnMcf61BPsuGVzpjFOMbLNc0KQpGNvoEfUJWzMbgyO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="457895981"
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; d="scan'208";a="457895981"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 18:37:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="746196556"
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; d="scan'208";a="746196556"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Dec 2023 18:37:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 18:37:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 1 Dec 2023 18:37:43 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 1 Dec 2023 18:37:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilXazAgijSK2o4qqZBdGOViiLT0ClFehJuVuSRBp9OPoGlu0xNQYYdA7UXe1J+iRYwFasZqbRFn3q8UTlNl+ZBTZC2Lu6/siM7usx0PXfx+Zl/seQUx1oWihJgdmXsK3AKVS/n5U7qLIhXHHpjWsl8sCMWFbK1iC3YKurCYDsSDlFd3MXhkKKD3xWF94ch9Cz2HU2nTukJ5CuxJBYqfqqIK0cglq9jwIX+XKnbAyu7xloThrY2MDtM/bobE12jd3klfIqFiyu9Ad3zeuPXEZvoITG7oahhVETLi8Zeecd1DsTyewfHkVdIcVgBPP1jUDPXVKcPvMJ91cLRqFbiS6Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8z6ic6gcHLtuk0d17okx00RJT6ALEMLP/riHGjBKhKc=;
 b=m8NKhH2Q1u5G/WW8KU6NaXwC321WwjcMiiKlh/pZwgal134rFCU22cDla3yAOLRPeIu486mNKr5CTPp72BSvI+7Sja5xYhGt8N2u1bAtleqgkvA88nZfE53mmjdwsJ3BhC3X1WrrdugdE5oRPgBaJWSQehE9Z93HVrtNlZTEbYK7xXcmQWf+OPl3BtOhQzB+WOGIvVkJV//9ksCJd9XWowYMSRtpicmLWDwALoNYLUzRfHnCR1BILxK1ogMSitw4qPYd+LH/0v99arz9RabZ7igjXLIu/kYl+W3/VTeIc/BhuZMQDv4PbFtncK3g72Xa4/UbRRbvas87RdTv75BwPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DM3PR11MB8714.namprd11.prod.outlook.com (2603:10b6:0:b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.27; Sat, 2 Dec 2023 02:37:41 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c%7]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 02:37:41 +0000
Date: Fri, 1 Dec 2023 18:37:38 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <ZWqYckl36d1ftJDi@nvishwa1-DESK>
References: <20231129025716.9094-1-niranjana.vishwanathapura@intel.com>
 <20231129025716.9094-4-niranjana.vishwanathapura@intel.com>
 <ZWpJKjCWA1Y0yEH7@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZWpJKjCWA1Y0yEH7@ashyti-mobl2.lan>
X-ClientProxiedBy: BYAPR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::27) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DM3PR11MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ace5c77-fae1-4bcd-3616-08dbf2dfa7af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qa5KMR2JRcf9kavXBqcwH8++rCLeoI+2D8Fh7gdhqxwadDjDpGihpXKz8b08tWyY9K6KmHPtGg9qVxhWIVw8cpCW8rZV5mu8xka4padKZrwlmtwzNs81tsKrvkmjX1wT+wCP+wzt+IqmsNMs81sfzxNfhVR62PtX1xsrcj+RtTtivq3uFYxMu6AbC0eV4Oo2+ILrs8m2SFyrjzpPKHYQLQSZBMPnc7aoelYdlePwh5hg8sYLS5jo4dJWxWvvsx2o1wnZzwxrfqbRyP3Iqj77awvbbNVfEwQGi0w5EqmL/t7HB4avgXDksGRWm/jc42mWFSbTByBtalJSSYQd5LSUWmjG+PALYsFi8fjp6aKhk7Jy2jBJ6Kj+h0dI7eovz3iS8KNLRHih9qp5vRAzFItU+P/JXhL5xY5fAffQFs1ha369Z4acUX9wveUGwQLxyLaj7Ti5cVJ2BaSSAJ3/pyQoX1aDf/ZSDVXP2y5rziL7p8i8tJqw9jerDH580+9ExrG6EE1cZ1OTkfPtCF0akCNZ9sPLldcwqIUw9gNNY4NntLhELE1M0r6WPGY9gfMgp/d/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(136003)(366004)(376002)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6506007)(5660300002)(478600001)(4744005)(33716001)(6486002)(6666004)(2906002)(8676002)(4326008)(8936002)(44832011)(86362001)(316002)(66476007)(66556008)(6916009)(66946007)(83380400001)(26005)(41300700001)(82960400001)(38100700002)(9686003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oH1Ns8PF/5mCS0jhCWUsGiFdITo/4bJO0Ss2hpjLgkiPEVZUETnZvGZ4UkZ3?=
 =?us-ascii?Q?HSFDlQL8dhVPbJ0YboYif7+B8hNKf66r2MW8rSBptK5s/AUsUPM7EjEi15ns?=
 =?us-ascii?Q?iJMFqvPqEJoQOD2ZMY7kCdWQOStDeUPvcwfVF1aB5Ei2Ui6tyl5kNsIfzQpt?=
 =?us-ascii?Q?lAQOrUG5rxdNGH6aRzXr7sgjqeITMyzDAvJXmQSt+XKuVNIrNo5aKa2FUKTY?=
 =?us-ascii?Q?wgI2/JtPvw60pjQ0piC6J+7ydkyPp8u5HBPTtZRHJ/r4l9S4c98o8DTWgRBG?=
 =?us-ascii?Q?9HCzvYEWi1n5X0/ghEBguwE5R8ojmzu/4uJfMgDqS9BPbexzRQBxBKLAaFpo?=
 =?us-ascii?Q?CNLTgmTkvOvVwgcxclemY1j6qQH/DTsVteaZzXVRTJbTTr4bt61PlFMwTXQz?=
 =?us-ascii?Q?okFEfvInlmE+DBCqit0pRUW8XWrMsTHfm0FkmKFDGxhFq6zTY7/csvXgMd6/?=
 =?us-ascii?Q?D7yifkPL8diBBNoK02kv86gtZmgT5lcsC4s9WyB1CaWneqI3k/vy6R93t/Qp?=
 =?us-ascii?Q?GxEWm6xlmfl0Hgn6f8aTbqu+dFlsmxnIEDVYT4shMUud4szHVbfX9st2CJe5?=
 =?us-ascii?Q?AIIM3CqMZCG/FFVrmkLQwoF58Zj6ix9ycbCZfG1mWutJ9EyDGC0+4+kyZwtp?=
 =?us-ascii?Q?VADyknTwbJBcv2N+JX76Ttnz2QewYxxXdS3HeUo7t40eH8k8j/x3OuUj9o3C?=
 =?us-ascii?Q?ZfqaakYlwbjuqPIeM0NK4j9RgdJNfLWaUbhXY4JJXhBp2srflnExcd4Kp1Zy?=
 =?us-ascii?Q?ELuGnu0kFLFPuSStorJPaYPLV93n/REDiK3rEjGCG3Z953kGKhKjZcgTP2kf?=
 =?us-ascii?Q?3+UUeWYvVi8+LxVQDw1koZFe4nOAtMN4OLju/sL/zBnEdxpwJDgQoBWwd90U?=
 =?us-ascii?Q?e5ezqK9ETosNKSfKfKhPiBIUIK/cEqk5m3R7zMChS6072pbnmcfdouE9kK2k?=
 =?us-ascii?Q?5RfufhPswsnV68qJoniC+wCEVFCT0brjiUlCjLfk2gX+2YgH0G4Q7zh4NSm5?=
 =?us-ascii?Q?cXGQ0UiyPBiCbBJ3Ec+I7CPLsvTaSmCIiZq1xUI1hid6rFmNhkXnzdQAHV73?=
 =?us-ascii?Q?pKY1M/6k2SWJ6YT+HE52BoUNgi+oQR5Sj+T1m3Sc6SHmxTtXk8ESvcKyhMPp?=
 =?us-ascii?Q?gHMeA6HjiieoqoV9bEJF5LweHLt7vEfS30LFSWM6VhNuPYw5m14q6no95ub0?=
 =?us-ascii?Q?lMKYBICoI9DOuH85qxuGlon6p3diJD9K7xAKOVbPPHf8JVIdMbrDCTeQXer1?=
 =?us-ascii?Q?/PaF5uU7SHcJ4PRSk6XU+dI/G5gy9U72fyhXU2/fqpQtFiIZ0KgXGmx+hL4G?=
 =?us-ascii?Q?DDkwJfNLledIXsssHlAbvnhDyJjSnFyU7vVxFjmfhAAbXn97G9a+OePOmDKy?=
 =?us-ascii?Q?lKe+x+0HEe3S0+L/IS4KSELC25Rjqyty070wbmU1py7Eb9sCktJDPm0My/Vf?=
 =?us-ascii?Q?zUqY5oo3eWukt8+FIXJDKH0cS0u7SBd8aPvDlltQvtYwkiDEwKB9RSsRrEIq?=
 =?us-ascii?Q?U6OZC3G2GpqNZHCgr7Ws9hSoWU9/ZAA2wxmcOslSwRCxPg5kntQRmBdeOAyv?=
 =?us-ascii?Q?P4JpaA3t/TWUghkVJVEljnxsgCdOGXE9DAmC3261LHjrvsIt3RcKhgWO2Asy?=
 =?us-ascii?Q?03tilkrI0g9fGaPLylW3FU8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ace5c77-fae1-4bcd-3616-08dbf2dfa7af
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2023 02:37:40.9328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1zxTnE4Jd+xLKSsZaRf7JUH67ZmecT0Qc2jMOBb5215uZ1kMmPJL1nkaLewsasca1a6gV815QMrMDmY51exsSpxF62NXkNI7ftlVsnR8YrPDBKQyGiYflWPO92BiK5U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8714
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe: Avoid any races around
 ccs_mode update
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 01, 2023 at 09:59:22PM +0100, Andi Shyti wrote:
>Hi Niranjana,
>
>...
>
>> +	/** @clients: drm clients info */
>> +	struct {
>> +		/** @lock: Protects drm clients info */
>> +		spinlock_t lock;
>
>is this a refcount at the end of the day?
>

It is not a refcount in the sense that there is nothing to
release/free once count reaches 0.
It is just a mechanism to not allow ccs_mode changes if
there are any active drm clients, to keep things simple.
Note that there is an EU debugger RFC series which uses
a xarray of all drm clients. Once that lands, we could
just check if that array has any elements in them instead
of maintaining a separate count.

Niranjana

>Andi

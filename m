Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7154CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 22:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A157110E180;
	Mon, 16 Oct 2023 22:10:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC6210E180
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 22:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697494224; x=1729030224;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E4ahLAP3Kp30sjRNkZO3r93atwlOx5F47Z9Lz/vXTuM=;
 b=C6R8qAaRuSXvsXn6tdunTNAt2vQy4vSaNjLmvZ0SvWJmwmTZk43TRh7N
 ZCSazjXxjvmS7nF9vsKjjt8odxW8UYyioICQ1ISzScisi2lmK1jEzBX23
 guFRO0vt4xkC6b3OpmVSkPFCM4KaLKriftt82kZBap45+dM056Q1CrH2z
 ml+Y94N6fy4p5eCemG1bkncSfMdkxHwU+iM/2LMmYeMhDdjgGTRFglODg
 vPGhu3KSre3CiHK3bMGFKYcm8f4XsfuJjJYCkiwDsJcb33glDXwqrk1r2
 i+RSdXXh+a9JqgYz69XVStbEFy3DP+UGNK4w1h9BtSMg5nFNuEF5zo6FX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="7214384"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="7214384"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 15:10:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="732476013"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; d="scan'208";a="732476013"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 15:10:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 15:10:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 15:10:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 15:10:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 15:10:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/f1DcsKBybXvE0NBHQhYJHDfmMxYm89Hqo9fgEtCobHWriNvB5bD8pvWXm8TRuL3+QVfPBuyAhbH9wM7mnVyiENldfQRukN6X/ADI2HJU10B52UVhNR08CeoBdymSiciRcSGgYzoKdGsONOjYQHSVwTtmUjP/KPRW1LfADtLqhUBCbFfNtVDWP6JHDwMz6JO8Sk1ihn7+AGfsxblpUCSY5NVNxBMr77YAlcu9ZIEsB7ocM6/iREn5WJoDK1Rrd0p0zaaUwO/XGU/86XhlcnIiPCXOhbQyoTvPT/RmKE2+CmmZ/6djVPlx/WsJcakcwK/UKCB+kLP7qXgRm6ksenMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtKHkChmXzXJDeICDkJfPUvwf3NMfKyEeX293/6yQng=;
 b=Xq41oFxo6JlU88WaSCWwDCcY9Pxz2BQdJJT4lfmsL08PMgcKBiVaMW9VdCr+VybPCL4Q1SUbf2+Tut/Rpw//QUfn5tZ5FkKv8XgByugYLGbLQEwgh0kbPOZ+3iihjnH+17Iuld4lxw97trqYFnJpk8KSFQfwf40waXBPhs708frV+oKcMusSa4N0L8aWj2GZs5VgTksyJVnXzZyggCe0IpHPGXuGyaa86ebhn+JWpESAiRF+PpatOlvDJJIUkVrsZ2f9mPw2ASxRQXYM8VX3SbkbvURt8e+PxiaikWg4ASQsY2DbXADa2ha/KVdFKF5eYewXu7j1FXoOIHkeYxB2eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6091.namprd11.prod.outlook.com (2603:10b6:930:2d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 22:10:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 22:10:18 +0000
Date: Mon, 16 Oct 2023 18:10:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luca Coelho <luca@coelho.fi>
Message-ID: <ZS20xlCm8DMTH4bQ@intel.com>
References: <ZG1Rwd2k6oDdiHHT@DUT025-TGLU.fm.intel.com>
 <8de90ac856b0caf3d0bd82717769e9f6fe1687a0.camel@coelho.fi>
 <ZSRtavVCM2lqbV5y@intel.com>
 <f8c1a6a39300f01b6affc5ecee7b4486dbcb6baa.camel@coelho.fi>
 <ZShRTTLRD7ltDGSS@intel.com>
 <f352c534f049f7068cef667b4faa88d7cca9b8fd.camel@coelho.fi>
 <ZS18QYFnoxZBRAtl@intel.com>
 <cfac5572e3d1ea7e0363cc58d4230ce7135b10d0.camel@coelho.fi>
 <ZS2YMf+umJSSYkh3@intel.com>
 <eeb0a65118c80a61c8cd1e301ad3c28592cfde40.camel@coelho.fi>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eeb0a65118c80a61c8cd1e301ad3c28592cfde40.camel@coelho.fi>
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 51fe6d83-b43f-40d9-dfc3-08dbce94ae70
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j8nK4TqLcGd4ZMLvda8pcW6GDWUgo4yjKhG/ClVUxKWvY8prjPet3pKgSEiTk8lC9LQGfkdwRjMkEEDlbqw41aKSLp2f2sX1DKH86Ho1RPr5z3ibpM2FY0RxpjvRo0kBTJYXKF+f6vXntjWRuqjzGnVoYhGcFl6dcVJ6VInO1+pkQWDbnEVspUIPVT8v9ttKSPOgR86yyTGRP1GRlGF6pgpTK/w9+4EwODrLvhe44niPZa3odAaExS5R84TswFW8qa2qnVc/sZPysQQ18X3pDRPlY7oqojbOzNBh9xhhiF8CcvJyhiomEz07ElqtrFSQPH6ystbnLe+Nd23lSr9aaViDNhe3WHUwi8LtOZnNknG/ToVCIdlJCQvRtDe43cjUlMAyih3Xlkxdq1L5RmqcBF8oH5aQrNH3K4vMvUPtdojh+mRTBtO70WgLpWRP3/tu8LhDX6VT3Dc//DdxDwXYmztcXxgp3xFRTA1HR734sl8m+9fs6pRB+odrJm7ViHb75s/5YrUgXQyeBayMEtW3nOH2vXcuG6VDcM8evhsKBfNUUd1nmSpmM24aoWYQC73D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(366004)(346002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(82960400001)(38100700002)(478600001)(2906002)(6486002)(4001150100001)(6506007)(6512007)(6666004)(54906003)(316002)(66946007)(66556008)(66476007)(6916009)(4326008)(8936002)(5660300002)(44832011)(30864003)(8676002)(83380400001)(26005)(66574015)(2616005)(41300700001)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFE0UEJ5d2h0REV5b1BVZ0ZGYS9lclJ0cGxxaENuZURlYkJNTlVHLy9WMmVP?=
 =?utf-8?B?eGgxNzB6dUtPYWpNMkF0ZTFrQ1NGOG9mZ1J1VHZpNXNrMWVzZ2lzaDVtTHJp?=
 =?utf-8?B?eEJmWVhoOWxrakRrYUVxRUJkeERVcUNiVndsRWRBTE8zRkNCN0tuOFlhZFQv?=
 =?utf-8?B?c2pBTFZ1R0FMQ2p0anliaGZrQXUxVkRNdUdPVm0zQWxTa1ZHUGxDMHRWNWdv?=
 =?utf-8?B?UjQ0MnNhRHZpaGN3dEZsQ1FIVTFxWUlZeTVDQnpzYTA1VXVzSTRPR0l3eFN3?=
 =?utf-8?B?eTMyMGlDREViZmI0Rm5lQ1JOOEI3OFJMSjJ4U3BOSnJxaUtkekU4Qld2aVNH?=
 =?utf-8?B?Q29uZW5YL0lnMzNjemhXbG9WSVJqZ0JZSFFDTVZOZ0ozT3BaVUdFWVU2cWZ6?=
 =?utf-8?B?d3p3OGJPVEVFVkVEWURpNjBmRTZoNWlwWDk1UGVCT0VoRHYyR1AvVkgzQWMx?=
 =?utf-8?B?ek9oNGNEL3FkeHZXQldITVNQQ2xxckRad0dDTm5MUXlBMHA1WGtCT2R5Y1Mz?=
 =?utf-8?B?MU1peFN5UTlib0VBenp3U09MbVFONlRSV0ZCMnc5cEJ0ODNaTngxQmlYL21a?=
 =?utf-8?B?VTd4TUZLRFZMZWVIdEo4L1ZxY21NYmFjWCtXeGpDeEZBbDgvdlI3YlZWTExJ?=
 =?utf-8?B?a21lN2ZDaVZ0aEI2Q2trODUrK1RSVzJYM2tTQlI5SVYyWmFjTVVoN0h2KzB0?=
 =?utf-8?B?aGdQcW9yM0Fic1Y4Zm9KL2NhdVBWV3dNQWdjN3FoVk5sRzgvQTI1YTJGZkJw?=
 =?utf-8?B?c09PVDJrREZLWFEwRmVySG5vWkdqMGlJd2VZWVBLQ0Q0QUpRa2dmQkRGSUlS?=
 =?utf-8?B?UmVOdVhQa3lwRzdWblR0NktrYVJWZlNpa2Vsb1FwSjBPYWVyaUFQWVZIaFlz?=
 =?utf-8?B?ZGNQa0h1RU5xcjJHcVp2aVZiUFVVSjlXcmtJRXcxcTZINkpKQzhhbDl6M3Bi?=
 =?utf-8?B?NHlXbTNQbC9Mb0tPWmdvN2I5V2J3Q1NNVzh4WUlWMmo0OGo2SHMwOUN5NEg5?=
 =?utf-8?B?eUVleDUxQTlQMDVyUW9Nb0xrbVBwU1k1U2FiVVN3WnZhRE1ucTRLNnhnYXl4?=
 =?utf-8?B?YmRja283VkIxUTlVTHBhMjdKbFVLc2xTRWJldytLNUtiZEtjbCtLSVFsRUw5?=
 =?utf-8?B?Zk9BSC9lNlZDMG9OdTNCQktDdzREY1FkQytNRUpGU3h6QWIvK1ozT25zNG44?=
 =?utf-8?B?cFVuRGcxRmI5Z290SGl3aUNKL24wZkFlSHk0ZVI2RVFIc0xTanNTRko2YmE3?=
 =?utf-8?B?WlRhRkhZdXhLSDdSSis5aXhIRW1TVFl0VTJreU5BakxCUmtWdTNLZTV3ZGFx?=
 =?utf-8?B?a0JkSWRQYS9LbWFqb0hsT2ZOZXZ6R3QzSFV4WVJ0TERMQlBLT2JRYnJ2dEZz?=
 =?utf-8?B?TGlBcmMrd1Q2U29yUDVEcG55MU5iZnhud3ZwRkdIYUxhYkhHcUxJU0w3c0Fq?=
 =?utf-8?B?dFlvUHRuUlF0TGRsL1lJZHZzcTVyQ2xIZlJoT245RjJ6Q3VWek1nZWZpWEFB?=
 =?utf-8?B?OGlGZFJLenRtbEdIV0NaWEZXeENFVDN1ZzF5L25LdmVHMy9tRHp0UWtaUU1W?=
 =?utf-8?B?aWUybmxMbEhjalY5elh4bHRoS2dOMHRmdCtSR3FoYUUreU9UUUJsMGxZbmQz?=
 =?utf-8?B?NlVqZlJKWEVndTZPNWIrdEZ6Q1NHelJjYnBQQ1BlVXMrdTh3bk56U1l4TkVy?=
 =?utf-8?B?MXlpK1U5aDlDdmNWMExyQTNXSWhnZG0rL214VjdBWnlZQ2JibVNyaU5nOEFl?=
 =?utf-8?B?bXB4ZXV1SzU0QXBydy8xTW1VL1MxYVhkSWVqR3A3SUtWSk9NdTJWMG9XaHRh?=
 =?utf-8?B?ajlHSTluUmVkWWZhNUJGN21DaHNqNXFHYlh0alhBbnA4N055ZE9aTTN6Zm9M?=
 =?utf-8?B?bWpDMUZlM0cyRmhxS3VVWVo0eU1vZVhHOFIrejdMN2hseVZHUG0wRXFGTTh6?=
 =?utf-8?B?M2RjMldjL0hDTlJoQldOMkU2dElPVHJqQS9Kd1g5T29KbjZkRTFhZS9VdzhG?=
 =?utf-8?B?dUNQdEQ2S0JZUjNTWUNmQnFtRG03L09WVCtGTmJDdUp3eGluYTVjbGJaTyth?=
 =?utf-8?B?MGlyb1Fob3JvR3R5U3F0RkgrREJ0Tks5aXdidTdWNlVsTHRoVnVYczFGamdr?=
 =?utf-8?Q?z2Rlr6ztU66OCT9rzlCxRcjoe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fe6d83-b43f-40d9-dfc3-08dbce94ae70
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 22:10:18.4797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2QHEV34x2NxfBuVZk/IMlMccE2fwG5W8dk1Z3wANCE5EJnV4HM6DQB7Wn9C0R1N2rZrbOswW88esxemAVAw6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6091
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe: A minimal assert for some forcewake
 domain on xe_mmio.
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
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 17, 2023 at 12:33:39AM +0300, Luca Coelho wrote:
> On Mon, 2023-10-16 at 16:08 -0400, Rodrigo Vivi wrote:
> > On Mon, Oct 16, 2023 at 10:40:12PM +0300, Luca Coelho wrote:
> > > On Mon, 2023-10-16 at 14:09 -0400, Rodrigo Vivi wrote:
> > > > On Mon, Oct 16, 2023 at 01:22:32PM +0300, Luca Coelho wrote:
> > > > > On Thu, 2023-10-12 at 16:04 -0400, Rodrigo Vivi wrote:
> > > > > > On Tue, Oct 10, 2023 at 10:00:06AM +0300, Luca Coelho wrote:
> > > > > > > On Mon, 2023-10-09 at 17:15 -0400, Rodrigo Vivi wrote:
> > > > > > > > On Mon, Oct 09, 2023 at 12:22:44PM +0300, Luca Coelho wrote:
> > > > > > > > > Hi everyone,
> > > > > > > > > 
> > > > > > > > > On Tue, 2023-05-23 at 23:52 +0000, Matthew Brost wrote:
> > > > > > > > > > On Tue, May 23, 2023 at 09:38:49AM -0700, Matt Roper wrote:
> > > > > > > > > > > On Tue, May 23, 2023 at 01:56:53PM +0000, Matthew Brost wrote:
> > > > > > > > > > > > On Mon, May 22, 2023 at 08:28:05PM -0700, Matt Roper wrote:
> > > > > > > > > > > > > On Mon, May 22, 2023 at 06:15:27PM -0400, Rodrigo Vivi wrote:
> > > > > > > > > > > > > > It is the maximum protection we can do with the current infrastructure.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > > > > > > > > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > > > > > > > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > > > > > > > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > > > > > > > > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > > > > > > > > > > > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > > > > > > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > > > > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > > > > > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > RFC
> > > > > > > > > > > > > > ===
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Okay, so, this is more an RFC to brainstorm the future of the force_wake in
> > > > > > > > > > > > > > Xe than anything else.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > On i915 the force_wake is built-in the mmio functions at uncore component.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > With that approach we had few historical issues iirc:
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > 1. Display performance with vblank evasion that requested uncore to provide
> > > > > > > > > > > > > > the 'fw' variantes that are actually the ones that avoid fw (contrary to what
> > > > > > > > > > > > > > the name suggests).
> > > > > > > > > > > > > 
> > > > > > > > > > > > > In i915 there were more differences between fw and non-fw variants
> > > > > > > > > > > > > of register functions than just forcewake handling:
> > > > > > > > > > > > > 
> > > > > > > > > > > > >  * _fw() functions assumed that the caller was already holding
> > > > > > > > > > > > >    forcewake, whereas the non-fw functions would obtain it themselves
> > > > > > > > > > > > >  * _fw() functions also assumed that the caller was already holding
> > > > > > > > > > > > >    uncore->lock, whereas the non-fw functions would obtain and release
> > > > > > > > > > > > >    the lock around each register access
> > > > > > > > > > > > >  * _fw() functions do no tracing and no debug assertions
> > > > > > > > > > > > >  * _fw() functions do not check for unclaimed MMIO
> > > > > > > > > > > > > 
> > > > > > > > > > > > > I don't think the first bullet there (forcewake) really mattered much
> > > > > > > > > > > > > from a performance perspective.  For display registers, a quick binary
> > > > > > > > > > > > > search of the FW table (just a handful of CPU cycles) would quickly
> > > > > > > > > > > > > determine that no forcewake domains were needed for those register
> > > > > > > > > > > > > offsets, so we wouldn't be doing anything with forcewake at the hardware
> > > > > > > > > > > > > level at all.  For display registers, the more performance-relevant
> > > > > > > > > > > > > aspects of using the _fw() functions was doing all your register
> > > > > > > > > > > > > accesses together without contention with other MMIO work.  I.e.,
> > > > > > > > > > > > > holding the uncore lock over an entire set of registers rather than
> > > > > > > > > > > > > grabbing/releasing it for each one, and (for vblank evasion
> > > > > > > > > > > > > specifically) doing it all while interrupts were disabled.  For debug
> > > > > > > > > > > > > drivers, there was also a bunch of other stuff that the _fw() functions
> > > > > > > > > > > > > bypassed (e.g., tripling of the number of register accesses due to
> > > > > > > > > > > > > reading FPGA_DBG before/after each register to look for unclaimed
> > > > > > > > > > > > > accesses).
> > > > > > > > > > > > > 
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > 2. Missed ranges updates. Sometimes we messed up with the ranges, there were
> > > > > > > > > > > > > > other times that the spec was updated and we didn't get the notification, and
> > > > > > > > > > > > > > there were cases that the BSpec had bugs.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > For these reasons in Xe we have decided to let to the caller the
> > > > > > > > > > > > > > responsibility to set the force_wake bits for their domains before doing
> > > > > > > > > > > > > > the MMIO.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > I don't think #2 was a reason to skip forcewake in Xe.  Not noticing a
> > > > > > > > > > > > > bspec update (or the bspec itself having incorrect information) would
> > > > > > > > > > > > > lead to even more mistakes if the caller has to explicitly grab the
> > > > > > > > > > > > > appropriate domains than if the driver does it implicitly.  The explicit
> > > > > > > > > > > > > handling only helps in the subset of cases where we blindly grab all of
> > > > > > > > > > > > > the domains (as we do during part of init).
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > MMIO access that requires forcewakes really only should be in a few
> > > > > > > > > > > > places, off the top of my head:
> > > > > > > > > > > > 
> > > > > > > > > > > > 1. Init
> > > > > > > > > > > > 2. Reset
> > > > > > > > > > > > 3. Sysfs / Debugfs
> > > > > > > > > > > > 
> > > > > > > > > > > > In all of these cases I think it fine to blindly grab all forcewakes.
> > > > > > > > > > > > 
> > > > > > > > > > > > Please chime in if I'm missing something.
> > > > > > > > > > > 
> > > > > > > > > > > I think as we implement more features in the Xe driver we're going to
> > > > > > > > > > > wind up with a lot more places where we need to access GT registers at
> > > > > > > > > > > runtime.  A few examples off the top of my head:
> > > > > > > > > > > 
> > > > > > > > > > >  * EU stall sampling
> > > > > > > > > > >  * Perf/OA
> > > > > > > > > > >  * EU debugger
> > > > > > > > > > >  * Various OOB workarounds that ask us to twiddle a register at certain
> > > > > > > > > > >    times in the driver.
> > > > > > > > > > 
> > > > > > > > > > Hmm, ok a lot of these I could make the argument that these are not
> > > > > > > > > > normal operation so just grab everything and call it a day. If some of
> > > > > > > > > > these fall into the category of 'normal enough to be optimized' I can
> > > > > > > > > > also make the argument it is no more complex (perhaps less complex) to
> > > > > > > > > > explicitly grab the forcewake than having the logic auto-grab the
> > > > > > > > > > forcewake.
> > > > > > > > > > 
> > > > > > > > > > What a compromise of in a debug mode we auto-generate the asserts based
> > > > > > > > > > on a table but we still explicitly grab the forcewake?
> > > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > However I'm seeing many questions and doubts popping up:
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > 1. Are we confident that we are not missing any wake-up?
> > > > > > > > > > > > > > 2. Are we confident that the domains are set correctly?
> > > > > > > > > > > > > > 3. Are we not wasting power if we are waking up ALL the domains instead
> > > > > > > > > > > > > >    of some specific one?
> > > > > > > > > > > > > 
> > > > > > > > > > > > > I think we're only holding ALL domains during init; for most of the
> > > > > > > > > > > > > runtime MMIO accesses, I think the code is currently attempting to only
> > > > > > > > > > > > > grab the domain(s) that it thinks the registers it's accessing will
> > > > > > > > > > > > > need.  Although that might be working right now, I'm a little bit
> > > > > > > > > > > > > worried about how that will scale in the long term when a single
> > > > > > > > > > > > > register might be in several different domains depending on what
> > > > > > > > > > > > > platform you're running on.  There have definitely been cases in the
> > > > > > > > > > > > > past where groups of registers migrated from RENDER to GT or vice versa
> > > > > > > > > > > > > between platforms, so the exact domain you needed for an operation
> > > > > > > > > > > > > varied by platform.  And things are even more complicated if you're
> > > > > > > > > > > > > doing any MMIO against the media, since the hardware seems to change
> > > > > > > > > > > > > exactly how it splits up the media power wells somewhat often.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > > 4. What about the display disconnection now because i915 and xe have different
> > > > > > > > > > > > > >    mmio approaches but reusing i915-display?
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > It looks to me that the cons of the current approach are superseding the
> > > > > > > > > > > > > > cons of the i915 approach. But I want to hear more thoughts here before
> > > > > > > > > > > > > > we decide which route to take.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Maybe we have that domain as part of the mmio calls themselves? Maybe
> > > > > > > > > > > > > > a double approach where the caller is responsible but mmio has the range
> > > > > > > > > > > > > > information and double check it?
> > > > > > > > > > > > > 
> > > > > > > > > > > > > As noted above, part of the challenge with forcewake is that even if the
> > > > > > > > > > > > > caller knows it wants to access register FOO, and even if it know FOO is
> > > > > > > > > > > > > a GT register that likely needs forcewake, it's sometimes challenging to
> > > > > > > > > > > > > make sure it's grabbing the correct domain(s) for every single platform
> > > > > > > > > > > > > the Xe driver will eventually support if the power management handling
> > > > > > > > > > > > > changes.  I think that was part of the motivation for encoding the
> > > > > > > > > > > > > tables into the driver in i915.  It seems like GT power wells don't
> > > > > > > > > > > > > change as much these days as they used to, but it's hard to say whether
> > > > > > > > > > > > > that will continue in the future or not.  Who knows...maybe they'll
> > > > > > > > > > > > > eventually start creating dedicated domains for stuff like blitters,
> > > > > > > > > > > > > GuC, etc.  rather than lumping all of those into the "GT" catchall
> > > > > > > > > > > > > domain.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > If we do decide to go back to implicit forcewake handling with the table
> > > > > > > > > > > > > encoded into the driver, it might be worth doing something sort of like
> > > > > > > > > > > > 
> > > > > > > > > > > > Let's not do this intel_uncore.c is an unreadable mess, I don't want
> > > > > > > > > > > > anything like this in Xe.
> > > > > > > > > > > 
> > > > > > > > > > > When you say unreadable, are you referring to the macros that generate
> > > > > > > > > > > the table lookup functions?  I don't think that macro magic would be
> > > > > > > > > > > needed for Xe since we don't have to support old platforms that have
> > > > > > > > > > > very different forcewake behavior, and we also don't need to generate
> > > > > > > > > > > separate 8-bit, 16-bit, and 32-bit versions of each operation anymore
> > > > > > > > > > > (since I think everything in the GT is 32-bits these days).
> > > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > Just the entire file is unreadable in general, trying to avoid these
> > > > > > > > > > types of files in Xe, avoid traps of the i915 did this so let's do it in
> > > > > > > > > > Xe, and over engineering our driver to avoid hypothetical future bugs.
> > > > > > > > > > 
> > > > > > > > > > Matt
> > > > > > > > > > 
> > > > > > > > > > > The forcewake and shadow tables themselves are pretty clean in i915
> > > > > > > > > > > these days, and if we move to autogenerating them from a text file, they
> > > > > > > > > > > can become even simpler since the text file will basically be a cleaned
> > > > > > > > > > > up copy/paste of part of the bspec table.
> > > > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > > Matt
> > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > > what Lucas is doing in the OOB workaround series --- drop the
> > > > > > > > > > > > > per-platform tables into a human-readable text file that's more similar
> > > > > > > > > > > > > to the format used by the bspec (exact ranges, forcewake domain, MCR
> > > > > > > > > > > > > replication type, etc.) and then provide a small parser program that
> > > > > > > > > > > > > will convert that into actual code (and do things like consolidating
> > > > > > > > > > > > > adjacent ranges).
> > > > > > > > > > > > > 
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Any other idea? Thoughts?
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Once the big GT vs tile refactor stuff I have in flight gets finalized,
> > > > > > > > > > > > > I plan to follow up with another series that creates a more appropriate
> > > > > > > > > > > > > MMIO target for register operations rather than using "xe_gt" as the
> > > > > > > > > > > > > target (even for things completely unrelated to the small GT subset of
> > > > > > > > > > > > > hardware).  My idea is that you'd grab an MMIO target structure for MMIO
> > > > > > > > > > > > > operations against a specific hardware unit, and then the info inside
> > > > > > > > > > > > > the MMIO structure would be able to figure out if there are additional
> > > > > > > > > > > > > checks and/or operations it should perform.  E.g.,
> > > > > > > > > > > > > 
> > > > > > > > > > > > >  * mmio = xe_mmio_for_device(xe_device *xe);
> > > > > > > > > > > > >     - Used to submit MMIO operations against the root tile of the PCI
> > > > > > > > > > > > >       device.  Only used during init (e.g., to read the registers that
> > > > > > > > > > > > >       tell us which tiles exist on the platform) and during top-level
> > > > > > > > > > > > >       interrupt enable/disable (since all interrupts are routed through
> > > > > > > > > > > > >       the root tile).
> > > > > > > > > > > > >     - No forcewake needed for register accesses through a handle of this
> > > > > > > > > > > > >       type since you'd only ever be accessing sgunit registers for these
> > > > > > > > > > > > >       types of things.
> > > > > > > > > > > > >     - Register accesses through mmio can warn on debug builds if the
> > > > > > > > > > > > >       register appears to be in a GT-related MMIO range.
> > > > > > > > > > > > > 
> > > > > > > > > > > > >  * mmio = xe_mmio_for_display(xe_device *xe);
> > > > > > > > > > > > >     - Pretty much the same as handles returned by xe_mmio_for_device(),
> > > > > > > > > > > > >       but if a handle of this type is used to try to read/write
> > > > > > > > > > > > >       registers outside the display range, we could have debug builds
> > > > > > > > > > > > >       throw some extra warnings.
> > > > > > > > > > > > >     - Unclaimed register detection could be confined to accesses through
> > > > > > > > > > > > >       these handles.
> > > > > > > > > > > > > 
> > > > > > > > > > > > >  * mmio = xe_mmio_for_tile(xe_tile *tile);
> > > > > > > > > > > > >     - Used to access non-GT registers that reside in a specific tile.
> > > > > > > > > > > > >       I.e., sgunit/soc registers.
> > > > > > > > > > > > >     - As above, no forcewake needed, can make MMIO operations warn
> > > > > > > > > > > > >       if used to access a GT range.
> > > > > > > > > > > > > 
> > > > > > > > > > > > >  * mmio = xe_mmio_for_gt(xe_gt *gt);
> > > > > > > > > > > > >     - Used to access GT registers in a specific GT
> > > > > > > > > > > > >     - Does automatic GSI offset translation for media GTs
> > > > > > > > > > > > >     - Can either do automatic forcewake like i915 does, or can do debug
> > > > > > > > > > > > >       check+warn like you have here.
> > > > > > > > > > > > >     - Can make MMIO operations warn if MMIO offset is outside GT range
> > > > > > > > > > > > >     - Can also trigger warnings if a GT non-GSI, non-media engine
> > > > > > > > > > > > >       register is accessed from an MMIO obtained from a media GT.
> > > > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > Ack on this if we keep in managable, worried code / feature bloat those
> > > > > > > > > > > > that will result in a similar file to intel_uncore.c in Xe.
> > > > > > > > > 
> > > > > > > > > Just to revive this thread.
> > > > > > > > > 
> > > > > > > > > I've been discussing this proposal in the context of a change we need
> > > > > > > > > to make in the display, which is to introduce a wakelock for some
> > > > > > > > > registers access in order to be able to remove the DMC trap.
> > > > > > > > > 
> > > > > > > > > We came to the conclusion that this new implementation is very much the
> > > > > > > > > same as the forcewake proposal here.  From the display point-of-view,
> > > > > > > > > we could simply have a new domain and range of registers to protect.
> > > > > > > > > 
> > > > > > > > > We _could_ implement a separate "wakelock" mechanism for the display
> > > > > > > > > part, but that would be mostly duplicating the entire forcewake
> > > > > > > > > implementation.
> > > > > > > > > 
> > > > > > > > > So, are there any plans to implement the current proposal? Or any other
> > > > > > > > > plans related to the forcewake implementation for Xe? As I see it, the
> > > > > > > > > "wakelock" implementation in the display depends on this.
> > > > > > > > > 
> > > > > > > > > Any thoughts?
> > > > > > > > 
> > > > > > > > Hi Luca, thanks for raising this again here.
> > > > > > > 
> > > > > > > Hi Lucas! Thanks for your comments.
> > > > > > > 
> > > > > > > 
> > > > > > > > So, as I said in the past, I don't have strong opinions regarding the
> > > > > > > > overall forcewake approach.
> > > > > > > > 
> > > > > > > > The since GT MMIO is not used very frequently, I don't see a problem of
> > > > > > > > leaving that up to the caller to take the right domain when needed, or even
> > > > > > > > the FORCEWAKE_ALL domain. Instead of forcing all the callers to
> > > > > > > > go through this extra steps and then have to opt-out with the '_fw' [sic]
> > > > > > > > alternatives for the cases where the forcewake cannot be checked underneath.
> > > > > > > > 
> > > > > > > > So, for the new display wakelocks, that's the problem of adding them to
> > > > > > > > the drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h where the converions
> > > > > > > > from i915's intel uncore are happening to xe_mmio? So, when using the
> > > > > > > > intel_uncore's '_fw' variant you skip the wakelock and when doing the regular
> > > > > > > > mmio calls you just add a wakelock_get/put around the xe_mmio call with
> > > > > > > > the display domain. And in i915 you implement inside the intel_uncore.
> > > > > > > > 
> > > > > > > > What's the downside of this approach?
> > > > > > > 
> > > > > > > That's more or less what I was thinking.  I don't think there's any
> > > > > > > problem on the display side in calling the same framework.
> > > > > > > 
> > > > > > > 
> > > > > > > > Trying to understand all the pros and cons of different approaches, and
> > > > > > > > bringing some people to the discussion.
> > > > > > > > 
> > > > > > > > If we implement the forwareke underneath the mmio call, display needs
> > > > > > > > to anyway implement it twice on the i915's intel_uncore and on the
> > > > > > > > xe_forcewake, no?!
> > > > > > > 
> > > > > > > Yes, IMHO we should start making Xe the base implementation and
> > > > > > > backporting the new implementation into i915.
> > > > > > > 
> > > > > > > So,for this specific case, I think we can just make i915 call the new
> > > > > > > functions in xe and have them backported in intel_uncore.h for i915.
> > > > > > > 
> > > > > > > What I was thinking was basically this:
> > > > > > > 
> > > > > > > 1. Implement the xe_mmio_for_<hw_unit>() proposal in Xe​
> > > > > > 
> > > > > > hmm probably a new component then?! xe_display_wakelock that
> > > > > > implements and export the get/put domain in a similar way
> > > > > > of xe_forcewake, and then on the wrapper you add the get/put
> > > > > > around the existing xe_mmio calls?!
> > > > > 
> > > > > Yes, I guess a new component, but part of Xe.  I don't exactly know
> > > > > what you mean with "xe_forcewake", but it's the same as Matt proposed
> > > > > with the different functions for different domains.  These functions
> > > > > would do everything that is needed for the specific domain, such as
> > > > > keeping it awake, checking if the registers are in the right range etc.
> > > > > 
> > > > > 
> > > > > > > 2. Display code uses new APIs (xe_mmio_for_display ops)​
> > > > > > > 
> > > > > > > 3. Update uncore to handle "wakelock domain"​
> > > > > > 
> > > > > > then on uncore you would need to parse the mmio range and then
> > > > > > call the get and puts, that in that case would be static inside
> > > > > > the uncore itself like the forcewakes ?!
> > > > > 
> > > > > The callers will use the new Xe APIs, so in i915, the display code (and
> > > > > probably GT and others too) will be the same as in Xe. 
> > > > 
> > > > I confess a got a bit lost now. What's GT need here? Does GT need this
> > > > new wakelock or is it a display only thing?
> > > > 
> > > > if it is a display only thing, we have a new xe_display_wakelock component.
> > > > The mmio wrappers that translate intel_de mmio calls to xe_mmio would make
> > > > usage of the xe_display_wakelock functions. And no body else. no need to
> > > > disrupt the working GT code.
> > > > 
> > > > But maybe I'm completely misunderstanding what the wakelock is about.
> > > 
> > > Sorry if I was not clear.
> > > 
> > > First of all, I don't think the new "wakelock" mechanism is any
> > > different than the forcewake implementation we need in Xe (which we
> > > have in uncore for i915).  AFAIU, we don't have this forcewake
> > > implementation in Xe yet (which was the original discussion in this
> > > thread), right?
> > 
> > wrong. we have xe_forcewake. But it is up to the caller of the xe_mmio
> > to decide if it needs to forcewake certain domain or not.
> 
> Right, this I have seen...
> 
> 
> > What we don't have is the xe_mmio calling the xe_forcewake based on
> > some pre defined mmio range, like i915 does.
> 
> ...but this is what I meant that was missing.
> 
> 
> > What is this wakelock about? is it only a new display range of forcewake
> > with a new display domain?
> 
> For some reason, it's not just a new display domain.  But it's a new
> range (or set of ranges) that need to be protected by setting a bit in
> DMC.
> 
> 
> > or is it a new sequence of display mmios that needs to be executed
> > before and after display mmio calls?
> 
> This is the case.  We need to set the "wakelock bit" before making MMIO
> operations on specific ranges.
> 
> 
> > or even before and after gt mmio calls besides the forcewake domains?
> 
> No, AFAICT there's not direct relation to GT.
> 
> 
> > > So, my proposal is that we should implement the forcewake stuff in Xe
> > > as Matt proposed, with the different APIs for different components
> > > (e.g. xe_mmio_for_display()).  When this is done, we can add a new
> > > "domain" (or maybe even reuse the xe_mmio_for_display() one) for the
> > > new ranges that need a "wakelock" (which IMHO is the same as the
> > > existing forcewake mechanisms).  If we do this, the implementation in
> > > Xe is solved.
> > 
> > I really believe the wakelock should be totally orthogonal to Matt's
> > proposal on the mmio split for device vs tile vs gt...
> > To me, mmio_display is mmio_device anyway...
> 
> And couldn't the wakelock stuff be handled in the same way? My point is
> that it would be good to abstract this HW intricacies from the caller
> (in this case, the display).
> 
> 
> > We already have a wrapper for translating intel_de calls to xe_mmio,
> > why that cannot be used to implement this display wakelock sequences
> > anyway and regarless?
> 
> It can, but adding this logic inside the wrappers doesn't sound right
> to me.
> 
> 
> > > But, of course, we need to make sure that the display code will remain
> > > the same in i915.  To do so, I'm proposing that we make the display
> > > code use the new xe_forcewake APIs, even though they won't exist in
> > > i915.  So, for i915, we provide wrappers for these new APIs so we can
> > > convert the calls into calls to uncore.  So functionally, the display
> > > code in i915 will remain the same.  We don't need to implement the
> > > "wakelock" part for i915, but we convert i915 to use the new
> > > xe_forcewake APIs where it currently uses the uncore's version.
> > 
> > i915-display should only call intel_de functions this should be a wrapper
> > to i915's intel_uncore or xe's xe_mmio... maybe intel_de itself is the
> > right place to implement this display wakelock?
> 
> Again, I don't think a wrapper would be the right place to add this
> functionality, but it could, technically, be there.

Agreed. I had never told to implement in the wrapper. But the wrapper
would call the implementation in the new xe_display_wakelock besides
the call of xe_mmio. And then the implementation of xe_display_wakelock
ported to i915's intel_uncore.

However I don't believe this is needed as well. As more as I understand
this, more I believe the right place to add it is inside the
intel_de_{read, write, rmw) inside intel_de.h

You implement there once and you don't need to call anything in Xe and
you also don't need to backport anywhere. A single place and you are
covered on both drivers.

If it does not affect GT it shouldn't go inside intel_uncore. And definitely
not needed inside xe_mmio itself as well.

> 
> 
> > But i915 should never call xe functions directly.
> > 
> 
> Okay, I missed this rule.  I thought Xe would be the main driver and
> i915 would start becoming obsolete and all the current wrappers were
> just temporary, for the transition period.
> 
> IMHO the display code in Xe should become the main version of it while
> the display code in i915 should be frozen and become obsolete (or
> legacy, with updates only when needed, for old HW).  But I digress.

The work that Jani is leading is to make the display code independent,
and not replace one dependency by another.

> 
> 
> > > We won't disrupt the existing GT forcewake usage in i915.  That will
> > > remain the same.  But we will need to implement forcewake in Xe, which
> > > GT will use.  But the GT from Xe is not shared with i915, so no need to
> > > create wrappers for that.
> > 
> > The big question that nobody could ever answer yet, is why do we need
> > the intrinsic forcewake underneath xe_mmio, that is not already covered
> > by the xe_forcewake call by the xe_mmio callers?
> 
> I think implicit handling of all this would make things simpler (or at
> least more localized).  But it's a matter of style (and most likely
> details I'm missing)
> 
> 
> > Looking to the '_fw' variantes of the i915, we see that there are many
> > cases out there that we don't want the intrinsic forcewake and then
> > we had to create this bypass option, which name is extremely confusing.
> > Opposite of what it currently does and means.
> 
> What are these cases exactly?

They are mmio functions that doesn't take care of the forcewake.
Basically they are like the xe_mmio functions.

It is up to the caller using the '_fw' functions to take care of
the forcewake.

> I had understood that this was only the
> case because we didn't want to thrash the forcewake when we're
> accessing ranges that need it several times in a row.  Though this kind
> of thing could be done by using a timer to add quiescence.

so we already have the need for the case where forcewake is not needed
underneath, so the simplicity here might be to have just one single kind
of mmio functions and not 2.

> 
> 
> > GT MMIO operations are very limited to small usage during init, reset
> > and resume. And the underneath range seems like an overkill and historically
> > brought us many trouble.
> 
> I think the implicit handling could also take care of the state (i.e.
> whether the HW is "initialized enough" to need the forcewake) and use
> it only when needed.

not possible. Because we don't know who or what woke up that block. It might
be a firmware underneath. So if we trust that the block is enabled and avoid
getting the forcewake, then we are at risk of the domain get shut off in the
middle of the operation.

> 
> 
> > Again, I could be easily pursued to the opposite direction of the intrinsic
> > forcewake, but so far with the current arguments that we have at the table
> > I prefer to stick with the caller's responsibility on the forcewake.
> > 
> > If this 'wakelock' is something new that is bigger than display and that
> > maybe justifies the intrinsic forcewake, then we probably need more
> > information and details on the wakelock.
> > 
> > But if it is a display only thing as it looks like, I don't see why it
> > couldn't simply live in the inte_de wrapper that calls xe_mmio...
> 
> Okay, so there seems to be a lot of history, complications and legacy
> in the forecewake implementation that I have overlooked.  Though I tend
> to disagree that the callers should know and take care of all this.  To
> me, there should be a component that provides all this hardware access
> without the callers having to know all the intricacies and details of
> the HW implementation, such as what and when we need to have forcewake
> protection, which domains to use etc.

In general this is the part that I pretty much agree with you.
But this hidden magic underneath already brought us many trouble with
missing cases, only because the ranges implementation or even the bspec
were outdated. While if we had a simple wake all domain or we were used
to think about domain when implementing new mmio calls for new hw, we
would had saved a lot of time.

> 
> And this is what I had understood from Matt's proposal.  The caller
> would just say "I'm display" (with an xe_mmio_for_display() call or
> whatever the wrapper would be called) and then access registers or make
> larger MMIO operations using function pointers that were assigned by
> this initial "identification" call.  These ops could then take care of
> whatever is needed for these operations.

no no, his idea was simply to avoid display code or even display wrapper
have to have to think about the GT at all. But for me the 'device' portion
of his proposal should be enough to cover the display and the display
won't be needed.

In general, if caller know that the MMIO is for a given GT it calls the
xe_mmio_gt(gt, ...). If the caller knows that it is MMIO for a given Tile it calls
the xe_mmio_tile(tile, ...) if it knows that it is for the device it calls
xe_mmio_device(xe, ...)

But those have nothing to do with the forcewake anyway. Likely for all the
GTs and maybe even for some Tile ones you would still need to grab the forcewake
and orthogonal to the discussion if it is inside or outside...

The device likely doesn't have to grab any forcewake, but if it is display
apparently you would need the wakelock, but that it could be outside that
as well anyway.

> 
> If we had this, then the wakelock implementation would be handled
> inside these ops for display, without the display itself having to know
> about access details.

But it is a display thing, why do you need to abstract the display thing
underneath the MMIO accesses?

> 
> But maybe I misunderstood the proposal.  And, if this is not the plan,
> then the only way to do it is to add the "wakelock" logic to the
> display orthogonally to the general MMIO access operations, which I
> wanted to avoid.

well, let's have it inside intel_de_ and we have only one implementation.
no port needed. Regardless of the future of the xe_mmio or the future
of xe_forcewake.

> 
> --
> Cheers,
> Luca.

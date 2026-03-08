Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F8BFCA180
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 18:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A6810E596;
	Mon,  9 Mar 2026 18:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sotapeli.fi header.i=@sotapeli.fi header.b="qDJ/fbpR";
	dkim-atps=neutral
X-Greylist: delayed 391 seconds by postgrey-1.36 at gabe;
 Sun, 08 Mar 2026 18:33:25 UTC
Received: from se.sotapeli.fi (se.sotapeli.fi [206.168.212.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC92610E06D
 for <intel-xe@lists.freedesktop.org>; Sun,  8 Mar 2026 18:33:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 38592181AA07; Sun,  8 Mar 2026 19:26:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sotapeli.fi; s=dkim;
 t=1772994412; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=N5dCOjSWAkxO9DN4gtCxteG7R4ZfjxfQTi9PJmI9Jj4=;
 b=qDJ/fbpRMDy1mVvL9UCCpugY2hp8KurePTJv+j3oM6TIgpSNyHxlspozTQKVgP5i28Km6X
 89a3+0DMedZl2JnNEA+absdWKz1aSwxDEinf0XSK5pOhHNQl1XAd9ro/rECnU1dYXvsl/S
 KPlti/UWCgVmq5b9x79m9em9E/vyy6b/HSSiHKTJNYGy4VKoADUgYfIuG8l2hCnLpKDzJa
 ONM2ueN1qwITjKC0M2Pu6y2agCzJmofAX3MxBdB+x+l6Y+Cwy33Q12kH+9I1zjg6RrRBEV
 80xjL4vkwc20ctQ+9eXZR6MW44a3aMGlCUO4PrhWwPDy97WUMSJuTwHOOdV/rA==
Message-ID: <473f5ef9-d8d1-46b0-a145-dd278ac4e9cb@sotapeli.fi>
Date: Sun, 8 Mar 2026 20:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Few bugs with Arc B570
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <12d4e567-0592-42d1-af84-a8b079b33785@sotapeli.fi>
 <DM4PR11MB5456CD6BBFF05C5DE68D10B6EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Language: en-US
From: Jani Partanen <jiipee@sotapeli.fi>
Autocrypt: addr=jiipee@sotapeli.fi; keydata=
 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
In-Reply-To: <DM4PR11MB5456CD6BBFF05C5DE68D10B6EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Mon, 09 Mar 2026 18:55:56 +0000
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

On 21/11/2025 18.47, Lin, Shuicheng wrote:


>> I am also seeing this, but sadly this always happens at time when I am
>> not front of computer so dump gets trashed. I have not figured out how I
>> could change timeout from 1h to something else. I have seen this on
>> stock kernel also.
>>
>>
>> [213377.351299] xe 0000:0e:00.0: [drm] GT0: Engine reset:
>> engine_class=rcs, logical_mask: 0x1, guc_id=109
>> [213377.351361] xe 0000:0e:00.0: [drm] GT0: Timedout job: seqno=7579,
>> lrc_seqno=7579, guc_id=109, flags=0x0 in zenity [306155]
>> [213377.403140] xe 0000:0e:00.0: [drm] Xe device coredump has been created
>> [213377.403145] xe 0000:0e:00.0: [drm] Check your
>> /sys/class/drm/card1/device/devcoredump/data
>> [217090.855547] xe 0000:0e:00.0: [drm] Xe device coredump has been deleted.
>>
> It seems like engine hang and lead to engine reset. And the data file could help provide more info when issue occurs.
>
> The 1h timeout is defined as below in the code.
> /* 1 hour timeout */
> #define XE_COREDUMP_TIMEOUT_JIFFIES (60 * 60 * HZ)


I finaly got coredump from this! Reason it took so long time, is that I 
use GUI only rarely on that machine, it's mostly acting as my NAS. But 
dump can be found here:

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6639


// Jani



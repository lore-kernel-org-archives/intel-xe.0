Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DA1C4450D
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 12:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F8110EF9E;
	Wed,  1 Jul 2026 12:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rcpassos.me header.i=@rcpassos.me header.b="qB9mfzRC";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=purelymail.com header.i=@purelymail.com header.b="D2WEHFE7";
	dkim-atps=neutral
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8431610E170
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 00:35:00 +0000 (UTC)
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256;
 b=qB9mfzRCZYvoF9IRkZOjzjyQq8O/0jFLZFA0ucmORMzvxBxRp4K7/N7TLCoJt/cYyGfgDwXkJ/ZN6OU36pNb/Wqm/7kLI1+0lsE0q5csj72EEZSqi4zwPRD6Z+kzZWSeCDWIN6wa2wIgR6gnwCRf8PLT3Zu0uWK5mD1X3xq065sKFPS1OfULohLW291ewJoBDIE1jW+2aObKX3J6njkmUQ4Jge0LI8OphBFanZoSaDhZoK3URIOMkfpxB7mCgCNEf2WeG/T6tWohPPdTRrOBP77TEUmlicuKTNHIJyTnw5wa9Z5+QXge9SsiXUreaNTFJC0vW/DnE1EAMYDLdnudpQ==;
 s=purelymail2; d=rcpassos.me; v=1;
 bh=ZsfCjmQEzgl9BUa5k4KAiMGgZgn3+ETC4EaT4Dw+yFY=;
 h=Received:Date:From:To:Subject; 
DKIM-Signature: a=rsa-sha256;
 b=D2WEHFE7KDUDAgT5dQJ2KVOBUCpPX/X8nLh3fGFXRxTK4KhZN9GKCzbm1/feLbn73x64KYgD2kR/EvbqzEMDdEHXALWVyptRG7M9czRgnr0eLf1UVRhQpSogE8v+EdRzuTuMIoA3sYQ2VbX8C29bkbLT7HUAndC/qGVZwpTSAT7I54M0JikPAoRfG6EfiwHoLhhGiv9qBq/qChOgFxw9T+ulxxODPN4TlBSLSEH/aPCbFGRk3ftGHeSaWr7hAYp/fnMJirWjYj31EmU4ZauF9XZPq9l7zU/iyriSQMCF93Z9pDmWxXCpgLZ2JnlHWy9KYaE8WDXMo79SZVl+Zu0PuQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=ZsfCjmQEzgl9BUa5k4KAiMGgZgn3+ETC4EaT4Dw+yFY=;
 h=Feedback-ID:Received:Date:From:To:Subject; 
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: intel-xe@lists.freedesktop.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 53992085;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 00:34:29 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 28 Jun 2026 21:34:49 -0300
Message-Id: <DJL413GMZH5Q.2S11VUVHGLLVF@rcpassos.me>
From: "Rafael Passos" <rafael@rcpassos.me>
To: "Randy Dunlap" <rdunlap@infradead.org>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] Documentation: xe_drm: fix chars used for subsection
Cc: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <skhan@linuxfoundation.org>, "Intel-xe"
 <intel-xe-bounces@lists.freedesktop.org>, "Rafael Passos"
 <rafael@rcpassos.me>
X-Mailer: aerc 0.21.0
References: <20260621030114.963405-1-rafael@rcpassos.me>
 <1a20e4bf-fd7f-453e-b7a8-c7feb0b077c6@infradead.org>
In-Reply-To: <1a20e4bf-fd7f-453e-b7a8-c7feb0b077c6@infradead.org>
X-Mailman-Approved-At: Wed, 01 Jul 2026 12:56:31 +0000
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

Hi,

I just checked, and this issue is still present.
Since the merge window just closed, I think it's a good time
to send a ping :)

On Sun Jun 21, 2026 at 1:07 AM -03, Randy Dunlap wrote:
> On 6/20/26 8:01 PM, Rafael Passos wrote:
>> and the page title is defined the.
>
>                         defined there.

Should I send a v3 of this patch fixing this minor typo ?

I see the original email did not show up in Lore (just Randy's response).
Should resend in cases like this ? In this case, while at it, just do a v3?

> LGTM. Thanks.
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Also, if I were to send a new version (changing only the commit message),
and the previous had Review/Tested tags, should I carry them in the new ver=
sion?
Or just send it as is?


Thanks,

Rafael Passos
